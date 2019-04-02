package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.TipoVulnerabilidade;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;


public interface TipoVulnerabilidadeService {

    TipoVulnerabilidade salvar(TipoVulnerabilidade TipoVulnerabilidade);

    TipoVulnerabilidade editar(TipoVulnerabilidade TipoVulnerabilidade);

    void excluir(Long id);

    @Transactional(readOnly = true)
    Optional<TipoVulnerabilidade> buscarPorId(Long id);

    @Transactional(readOnly = true)
    List<TipoVulnerabilidade> buscarTodos();
}
