package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.LogAgendamento;
import br.nocclaro.autoalert.repository.LogAgendamentoRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class LogAgendamentoServiceImpl implements LogAgendamentoSerivce {

    LogAgendamentoRepository logAgendamentoRepository;

    public LogAgendamentoServiceImpl(LogAgendamentoRepository logAgendamentoRepository) {
        this.logAgendamentoRepository = logAgendamentoRepository;
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
