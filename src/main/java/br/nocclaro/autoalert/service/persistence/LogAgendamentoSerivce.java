package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.LogAgendamento;

import java.util.List;
import java.util.Optional;

public interface LogAgendamentoSerivce {

    LogAgendamento salvar(LogAgendamento logAgendamento);

    LogAgendamento editar(LogAgendamento logAgendamento);

    void excluir(Long id);

    Optional<LogAgendamento> buscarPorId(Long id);

    List<LogAgendamento> buscarTodos();

    List<LogAgendamento> buscarPorAgendamentoId(Long id);


}
