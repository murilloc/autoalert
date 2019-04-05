package br.nocclaro.autoalert.service.persistence;


import br.nocclaro.autoalert.domain.Cliente;
import br.nocclaro.autoalert.domain.StatusComunicacao;
import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface VulnerabilidadeClienteService {



    VulnerabilidadeCliente salvar(VulnerabilidadeCliente VulnerabilidadeCliente);

    VulnerabilidadeCliente editar(VulnerabilidadeCliente VulnerabilidadeCliente);

    void excluir(Long id);

    Optional<VulnerabilidadeCliente> buscarPorId(Long id);

    List<VulnerabilidadeCliente> buscarTodos();

    List<VulnerabilidadeCliente> buscarPorStatus(StatusComunicacao statusComunicacao);

    List<VulnerabilidadeCliente> buscarAguardandoComunicacao();

    List<VulnerabilidadeCliente> buscarListaVulnerabilidadesPorCliente(Cliente cliente);

    List<VulnerabilidadeCliente> buscarVulnerabilidadesPorClienteParaEnvio(StatusComunicacao statusComunicacao, Cliente cliente);

    Page<VulnerabilidadeCliente> findPaginated(Pageable pageable);
    
}
