package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.domain.Agendamento;

public interface ProcessamentoAgendamentoService {

    void run(Agendamento agendamento) throws InterruptedException;

}
