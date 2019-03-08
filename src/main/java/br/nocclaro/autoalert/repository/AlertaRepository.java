package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.Alerta;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlertaRepository extends JpaRepository<Alerta, Long> {
}
