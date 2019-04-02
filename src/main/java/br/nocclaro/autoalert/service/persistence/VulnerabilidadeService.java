package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Vulnerabilidade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface VulnerabilidadeService {


    Vulnerabilidade salvar(Vulnerabilidade vulnerabilidade);

    Vulnerabilidade editar(Vulnerabilidade vulnerabilidade);

    void excluir(Long id);

    Optional<Vulnerabilidade> buscarPorId(Long id);

    List<Vulnerabilidade> buscarTodos();

    Page<Vulnerabilidade> findPaginated(Pageable pageable);
}
