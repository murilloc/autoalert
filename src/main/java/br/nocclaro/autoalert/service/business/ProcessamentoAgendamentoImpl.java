package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.components.MailMessageModel;
import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.Cliente;
import br.nocclaro.autoalert.domain.IdentificadorVulnerabilidade;
import br.nocclaro.autoalert.domain.LogAgendamento;
import br.nocclaro.autoalert.domain.StatusComunicacao;
import br.nocclaro.autoalert.domain.Vulnerabilidade;
import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.domain.VulnerabilidadeClienteId;
import br.nocclaro.autoalert.service.business.freemarker.FreeMarkerTemplateWriter;
import br.nocclaro.autoalert.service.persistence.ClienteService;
import br.nocclaro.autoalert.service.persistence.LogAgendamentoSerivce;
import br.nocclaro.autoalert.service.persistence.VulnerabilidadeClienteService;
import br.nocclaro.autoalert.service.persistence.VulnerabilidadeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ProcessamentoAgendamentoImpl implements ProcessamentoAgendamentoService {

    private static final Logger logger = LoggerFactory.getLogger(ProcessamentoAgendamentoImpl.class);

    private final EmailService emailService;

    private UtilService utilService;
    private RestProcessorService restProcessorService; // Consulta o webservice
    private VulnerabilidadeService vulnerabilidadeService;
    private ClienteService clienteService;
    private FreeMarkerTemplateWriter templateWriter;
    private LogAgendamentoSerivce logAgendamentoService;
    private VulnerabilidadeClienteService vulnerabilidadeClienteService;

    private HashMap<String, String> modelo;
    private List<HashMap<String, String>> items;

    public ProcessamentoAgendamentoImpl(UtilService utilService,
                                        RestProcessorService restProcessorService,
                                        VulnerabilidadeService vulnerabilidadeService,
                                        ClienteService clienteService,
                                        LogAgendamentoSerivce logAgendamentoService,
                                        VulnerabilidadeClienteService vulnerabilidadeClienteService,
                                        FreeMarkerTemplateWriter templateWriter, EmailService emailService) {
        this.utilService = utilService;
        this.restProcessorService = restProcessorService;
        this.vulnerabilidadeService = vulnerabilidadeService;
        this.clienteService = clienteService;
        this.logAgendamentoService = logAgendamentoService;
        this.vulnerabilidadeClienteService = vulnerabilidadeClienteService;
        this.templateWriter = templateWriter;
        this.emailService = emailService;
        items = new ArrayList<>();
        modelo = new HashMap<>();
    }

    @Override
    public void run(Agendamento agendamento) throws InterruptedException {

        List<String> testResultLines = utilService.separaLinhas(agendamento.getResultadoTeste());
        preparaListaParaEnvio(agendamento, testResultLines);

        List<Cliente> listaClientesParaComunicacao = clienteService.findClientesAguardandoComunicacao();

        for (Cliente cliente : listaClientesParaComunicacao) {
            logger.info(cliente.toString());
            List<VulnerabilidadeCliente> vulnerabilidadesPorCliente =
                    vulnerabilidadeClienteService.buscarVulnerabilidadesPorClienteParaEnvio(StatusComunicacao.AGUARDANDO_ENVIO, cliente, agendamento);
            String messageText = templateWriter.composeMessage(agendamento, vulnerabilidadesPorCliente);

            MailMessageModel mailMessageModel = new MailMessageModel();
            mailMessageModel.setFrom("abuse@embratel.net.br");
            mailMessageModel.setSubject("Alerta de vulnerabilidade:  " + agendamento.getTipoVulnerabilidade().getNome().toLowerCase());

            //mailMessageModel.setTo(cliente.getEmail());
            mailMessageModel.setTo("murilloc@gmail.com");
            mailMessageModel.setMessage(messageText);

            LogAgendamento logAgendamento = new LogAgendamento();
            logAgendamento.setDataHora(LocalDateTime.now());
            logAgendamento.setAgendamento(agendamento);

            if (emailService.sendMessage(mailMessageModel, logAgendamento)) {
                salvarResultadoEnvio(vulnerabilidadesPorCliente, StatusComunicacao.ENVIADO);
            } else {
                salvarResultadoEnvio(vulnerabilidadesPorCliente, StatusComunicacao.FALHOU);
            }

            logAgendamentoService.salvar(logAgendamento);

        }
    }


    private void salvarResultadoEnvio(List<VulnerabilidadeCliente> vulnerabilidadeClienteList, StatusComunicacao status) {
        for (VulnerabilidadeCliente vulnerabilidadeCliente : vulnerabilidadeClienteList) {
            vulnerabilidadeCliente.setStatusComunicacao(status);
            vulnerabilidadeCliente.setDataHoraEnvio(LocalDateTime.now());
            vulnerabilidadeClienteService.salvar(vulnerabilidadeCliente);
        }
    }

    private void preparaListaParaEnvio(Agendamento agendamento, List<String> testResultLines) throws InterruptedException {
        for (String line : testResultLines) {
            boolean encontrouCliente = false;
            List<String> campos = utilService.separaCampos(line);
            modelo.put("ip", campos.get(0).trim());
            modelo.put("asn", campos.get(1).trim());
            modelo.put("status", campos.get(2).trim());
            modelo.put("data", utilService.substituirPor("[a-z][A-Z] ", " ", campos.get(3)).trim());
            logger.info(modelo.get("data"));
            modelo.put("diagnostico", campos.get(4).trim());

            if (agendamento.getTipoVulnerabilidade().getIdentificadorVulnerabilidade() == IdentificadorVulnerabilidade.SERVICO_DEVICE_DISCOVERY_HABILITADO) {
                modelo.put("payload", campos.get(5).trim());
            }

            Cliente cliente = restProcessorService.getClienteFromIp(campos.get(0).trim());

            if (null != cliente) {
                String nomeCliente = cliente.getNome();
                String emailCliente = cliente.getEmail();
                modelo.put("cliente", nomeCliente);
                modelo.put("email", emailCliente);
                items.add(modelo);
                encontrouCliente = true;
            }

            if (encontrouCliente) {
                ativarModelo(modelo, agendamento);
            } else {
                cadastrarErro(modelo);
            }
            Thread.sleep(3000);
        }
    }


    private void cadastrarErro(HashMap<String, String> modelo) {
        logger.error("Ip do cliente não localizado........: " + modelo.get("ip"));
    }


    private void ativarModelo(HashMap<String, String> modelo, Agendamento agendamento) {


        Vulnerabilidade novaVulnerabilidade = new Vulnerabilidade();
        Cliente novoCliente = new Cliente();

        VulnerabilidadeCliente vulnerabilidadeCliente = new VulnerabilidadeCliente();

        getNovaVulnerabilidade(modelo, agendamento, novaVulnerabilidade);
        novoCliente = getNovoCliente(modelo, novoCliente);

        novaVulnerabilidade = vulnerabilidadeService.salvar(novaVulnerabilidade);
        vulnerabilidadeCliente.setCliente(novoCliente);
        vulnerabilidadeCliente.setVulnerabilidade(novaVulnerabilidade);

        VulnerabilidadeClienteId id = new VulnerabilidadeClienteId();
        id.setClienteId(novoCliente.getId());
        id.setVulnerabilidadeId(novaVulnerabilidade.getId());
        id.setIpAddress(modelo.get("ip"));
        vulnerabilidadeCliente.setId(id);
        vulnerabilidadeCliente.setAgendamento(agendamento);
        StatusComunicacao statusComunicacao = StatusComunicacao.AGUARDANDO_ENVIO;
        vulnerabilidadeCliente.setStatusComunicacao(statusComunicacao);
        vulnerabilidadeClienteService.salvar(vulnerabilidadeCliente);

    }

    private Cliente getNovoCliente(HashMap<String, String> modelo, Cliente novoCliente) {
        novoCliente.setNome(modelo.get("cliente"));
        novoCliente.setEmail(modelo.get("email"));

        Cliente cliente = clienteService.buscarPorEmail(novoCliente.getEmail());
        if (null == cliente) {
            novoCliente = clienteService.salvar(novoCliente);
        } else {
            novoCliente = cliente;
        }
        return novoCliente;
    }

    private void getNovaVulnerabilidade(HashMap<String, String> modelo, Agendamento agendamento, Vulnerabilidade novaVulnerabilidade) {
        novaVulnerabilidade.setAsn(modelo.get("asn"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String data = modelo.get("data");
        data = utilService.substituirPor("([A-Z])", " ", data).trim();
        data = utilService.substituirPor("([a-z])", " ", data).trim();
        logger.debug(data);
        novaVulnerabilidade.setDataHora(LocalDateTime.parse(data, formatter));
        novaVulnerabilidade.setResultado(modelo.get("diagnostico"));
        novaVulnerabilidade.setStatus(modelo.get("status"));

        if (agendamento.getTipoVulnerabilidade().getIdentificadorVulnerabilidade() == IdentificadorVulnerabilidade.SERVICO_DEVICE_DISCOVERY_HABILITADO) {
            novaVulnerabilidade.setPayload(modelo.get("payload"));
        }
        novaVulnerabilidade.setTipoVulnerabilidade(agendamento.getTipoVulnerabilidade());
    }

}
