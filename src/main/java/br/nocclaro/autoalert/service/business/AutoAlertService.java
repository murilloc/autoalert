package br.nocclaro.autoalert.service.business;


import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.StatusAgendamento;
import br.nocclaro.autoalert.service.persistence.AgendamentoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class AutoAlertService {
    private static final Logger logger = LoggerFactory.getLogger(AutoAlertService.class);


    private AgendamentoService agendamentoService;
    private ProcessamentoAgendamentoService processamentoAgendamentoService;

    public AutoAlertService(AgendamentoService agendamentoService, ProcessamentoAgendamentoService processamentoAgendamento) {
        this.agendamentoService = agendamentoService;
        this.processamentoAgendamentoService = processamentoAgendamento;
    }

    @Async("theadPoolTaskExecutor")
    public void sendNotifications(Agendamento agendamento) throws InterruptedException {
        logger.info("Iniciando o envio de notificações");

        logger.info("Processando o agendamento + " + agendamento.getId() + " - " + agendamento.getTipoVulnerabilidade().getNome());
        agendamento.setStatusAgendamento(StatusAgendamento.PROCESSANDO);
        agendamentoService.salvar(agendamento);

        processamentoAgendamentoService.run(agendamento);

        agendamento.setStatusAgendamento(StatusAgendamento.COMPLETADO);
        agendamentoService.salvar(agendamento);

        logger.info("Fim do envio de notificações");
    }
}
