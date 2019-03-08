package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.Vulnerabilidade;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VulnerabilidadeRepository extends JpaRepository<Vulnerabilidade, Long> {
}
