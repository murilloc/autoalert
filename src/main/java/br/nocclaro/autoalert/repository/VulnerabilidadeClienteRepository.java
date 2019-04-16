package br.nocclaro.autoalert.repository;


import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.Cliente;
import br.nocclaro.autoalert.domain.StatusComunicacao;
import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.domain.VulnerabilidadeClienteId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VulnerabilidadeClienteRepository extends JpaRepository<VulnerabilidadeCliente, VulnerabilidadeClienteId> {

    List<VulnerabilidadeCliente> findByStatusComunicacao(StatusComunicacao statusComuniccao);

    List<VulnerabilidadeCliente> findByStatusComunicacaoAndClienteAndAgendamento(StatusComunicacao statusComunicacao, Cliente cliente, Agendamento agendamento);


}
