package br.nocclaro.autoalert.repository;


import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.domain.VulnerabilidadeClienteId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VulnerabilidadeClienteRepository extends JpaRepository<VulnerabilidadeCliente, VulnerabilidadeClienteId> {
}
