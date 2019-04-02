package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.Cliente;
import br.nocclaro.autoalert.domain.StatusComunicacao;
import br.nocclaro.autoalert.domain.Vulnerabilidade;
import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.domain.VulnerabilidadeClienteId;
import br.nocclaro.autoalert.service.persistence.ClienteService;
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

    private UtilService utilService;
    private RestProcessorService restProcessorService;

    private VulnerabilidadeService vulnerabilidadeService;
    private ClienteService clienteService;

    private VulnerabilidadeClienteService vulnerabilidadeClienteService;

    HashMap<String, String> modelo = new HashMap<>();
    List<HashMap<String, String>> items = new ArrayList<>();

    public ProcessamentoAgendamentoImpl(UtilService utilService, RestProcessorService restProcessorService,
                                        VulnerabilidadeService vulnerabilidadeService, ClienteService clienteService, VulnerabilidadeClienteService vulnerabilidadeClienteService) {
        this.utilService = utilService;
        this.restProcessorService = restProcessorService;
        this.vulnerabilidadeService = vulnerabilidadeService;
        this.clienteService = clienteService;
        this.vulnerabilidadeClienteService = vulnerabilidadeClienteService;
    }

    @Override
    public void run(Agendamento agendamento) throws InterruptedException {

        List<String> testResultLines = utilService.separaLinhas(agendamento.getResultadoTeste());

        for (String line : testResultLines) {
            List<String> campos = utilService.separaCampos(line);
            modelo.put("ip", campos.get(0).trim());
            modelo.put("asn", campos.get(1).trim());
            modelo.put("status", campos.get(2).trim());
            modelo.put("data", campos.get(3).trim());
            modelo.put("diagnostico", campos.get(4).trim());

            Cliente cliente = restProcessorService.getClienteFromIp(campos.get(0).trim());

            if (null != cliente) {
                String nomeCliente = cliente.getNome();
                String emailCliente = cliente.getEmail();
                modelo.put("cliente", nomeCliente);
                modelo.put("email", emailCliente);
            }

            items.add(modelo);
            ativarModelo(modelo, agendamento);

            Thread.sleep(10000);

        }

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
        vulnerabilidadeCliente.setStatusComunicacao(StatusComunicacao.AGUARDANDO);
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
        novaVulnerabilidade.setDataHora(LocalDateTime.parse(modelo.get("data").substring(0, 19), formatter));
        novaVulnerabilidade.setResultado(modelo.get("diagnostico"));
        novaVulnerabilidade.setStatus(modelo.get("status"));
        novaVulnerabilidade.setTipoVulnerabilidade(agendamento.getTipoVulnerabilidade());
    }

}
