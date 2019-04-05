package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Cliente;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ClienteService {


    Cliente salvar(Cliente Cliente);

    Cliente editar(Cliente Cliente);

    void excluir(Long id);

    Optional<Cliente> buscarPorId(Long id);

    List<Cliente> buscarTodos();

    Cliente buscarPorNome(String nome);
    Cliente buscarPorEmail(String email);

    Page<Cliente> findPaginated(Pageable pageable);

    List<Cliente> findClientesAguardandoComunicacao();
}
