package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.TipoVulnerabilidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoVulnerabilidadeRepository extends JpaRepository<TipoVulnerabilidade, Long> {

}
