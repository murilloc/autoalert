package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.LogAgendamento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LogAgendamentoRepository extends JpaRepository<LogAgendamento, Long> {
}
