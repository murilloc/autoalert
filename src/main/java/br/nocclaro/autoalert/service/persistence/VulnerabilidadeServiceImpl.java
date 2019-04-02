package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Vulnerabilidade;
import br.nocclaro.autoalert.repository.VulnerabilidadeRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class VulnerabilidadeServiceImpl implements VulnerabilidadeService {

    private VulnerabilidadeRepository vulnerabilidadeRepository;

    public VulnerabilidadeServiceImpl(VulnerabilidadeRepository vulnerabilidadeRepository) {
        this.vulnerabilidadeRepository = vulnerabilidadeRepository;
    }

    @Override
    public Vulnerabilidade salvar(Vulnerabilidade vulnerabilidade) {
        return vulnerabilidadeRepository.save(vulnerabilidade);
    }

    @Override
    public Vulnerabilidade editar(Vulnerabilidade vulnerabilidade) {
        return vulnerabilidadeRepository.save(vulnerabilidade);
    }

    @Override
    public void excluir(Long id) {
        vulnerabilidadeRepository.deleteById(id);
    }

    @Override
    public Optional<Vulnerabilidade> buscarPorId(Long id) {
        return vulnerabilidadeRepository.findById(id);
    }

    @Override
    public List<Vulnerabilidade> buscarTodos() {
        return vulnerabilidadeRepository.findAll();
    }

    @Override
    public Page<Vulnerabilidade> findPaginated(Pageable pageable) {
        return null;
    }
}
