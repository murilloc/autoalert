package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.TipoVulnerabilidade;
import br.nocclaro.autoalert.repository.TipoVulnerabilidadeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class TipoVilnerabilidadeServiceImpl implements TipoVulnerabilidadeService {

    private TipoVulnerabilidadeRepository tipoVulnerabilidadeRepository;

    public TipoVilnerabilidadeServiceImpl(TipoVulnerabilidadeRepository tipoVulnerabilidadeRepository) {
        this.tipoVulnerabilidadeRepository = tipoVulnerabilidadeRepository;
    }

    @Override
    public TipoVulnerabilidade salvar(TipoVulnerabilidade tipoVulnerabilidade) {
        return tipoVulnerabilidadeRepository.save(tipoVulnerabilidade);
    }

    @Override
    public TipoVulnerabilidade editar(TipoVulnerabilidade tipoVulnerabilidade) {
        return tipoVulnerabilidadeRepository.save(tipoVulnerabilidade);
    }

    @Override
    public void excluir(Long id) {
        tipoVulnerabilidadeRepository.deleteById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<TipoVulnerabilidade> buscarPorId(Long id) {
        return tipoVulnerabilidadeRepository.findById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<TipoVulnerabilidade> buscarTodos() {
        return tipoVulnerabilidadeRepository.findAll();
    }
}
