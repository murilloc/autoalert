package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.LogAgendamento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogAgendamentoRepository extends JpaRepository<LogAgendamento, Long> {


    List<LogAgendamento> findAllByAgendamento(Agendamento agendamento);
}
