package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.LogAgendamento;
import br.nocclaro.autoalert.repository.LogAgendamentoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class LogAgendamentoServiceImpl implements LogAgendamentoSerivce {

    LogAgendamentoRepository logAgendamentoRepository;

    final AgendamentoService agendamentoService;

    public LogAgendamentoServiceImpl(LogAgendamentoRepository logAgendamentoRepository, AgendamentoService agendamentoService) {
        this.logAgendamentoRepository = logAgendamentoRepository;
        this.agendamentoService = agendamentoService;
    }

    @Override
    public LogAgendamento salvar(LogAgendamento logAgendamento) {
        return logAgendamentoRepository.save(logAgendamento);
    }

    @Override
    public LogAgendamento editar(LogAgendamento logAgendamento) {
        return logAgendamentoRepository.save(logAgendamento);
    }

    @Override
    public void excluir(Long id) {

        logAgendamentoRepository.deleteById(id);

    }

    @Override
    public List<LogAgendamento> buscarPorAgendamentoId(Long id) {

        List<LogAgendamento> logs = new ArrayList<>();
        Optional<Agendamento> agendamento = agendamentoService.buscarPorId(id);
        if (agendamento.isPresent()) {
            logs = logAgendamentoRepository.findAllByAgendamento(agendamento.get());
        }
        return logs;
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<LogAgendamento> buscarPorId(Long id) {
        return logAgendamentoRepository.findById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<LogAgendamento> buscarTodos() {
        return logAgendamentoRepository.findAll();
    }
}
