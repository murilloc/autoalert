package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.Cliente;
import br.nocclaro.autoalert.domain.StatusComunicacao;
import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.domain.VulnerabilidadeClienteId;
import br.nocclaro.autoalert.repository.VulnerabilidadeClienteRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class VulnerabilidadeClienteServiceImpl implements VulnerabilidadeClienteService {


    private VulnerabilidadeClienteRepository vulnerabilidadeClienteRepository;


    public VulnerabilidadeClienteServiceImpl(VulnerabilidadeClienteRepository vulnerabilidadeClienteRepository) {
        this.vulnerabilidadeClienteRepository = vulnerabilidadeClienteRepository;
    }

    @Override
    public VulnerabilidadeCliente salvar(VulnerabilidadeCliente vulnerabilidadeCliente) {
        return (VulnerabilidadeCliente) vulnerabilidadeClienteRepository.save(vulnerabilidadeCliente);
    }

    @Override
    public VulnerabilidadeCliente editar(VulnerabilidadeCliente vulnerabilidadeCliente) {
        return (VulnerabilidadeCliente) vulnerabilidadeClienteRepository.save(vulnerabilidadeCliente);
    }

    @Override
    public void excluir(Long id) {

    }

    @Override
    public Optional<VulnerabilidadeCliente> buscarPorId(Long id) {
        return Optional.empty();
    }

    public void excluir(VulnerabilidadeClienteId id) {
        vulnerabilidadeClienteRepository.deleteById(id);
    }

    public Optional<VulnerabilidadeCliente> buscarPorId(VulnerabilidadeClienteId id) {
        return vulnerabilidadeClienteRepository.findById(id);
    }

    @Override
    public List<VulnerabilidadeCliente> buscarTodos() {
        return vulnerabilidadeClienteRepository.findAll();
    }

    @Override
    public List<VulnerabilidadeCliente> buscarPorStatus(StatusComunicacao statusComunicacao) {
        return vulnerabilidadeClienteRepository.findByStatusComunicacao((statusComunicacao));
    }

    @Override
    public Page<VulnerabilidadeCliente> findPaginated(Pageable pageable) {

        return null;
    }

    @Override
    public List<VulnerabilidadeCliente> buscarAguardandoComunicacao() {
        return vulnerabilidadeClienteRepository.findByStatusComunicacao(StatusComunicacao.AGUARDANDO_ENVIO);
    }

    @Override
    public List<VulnerabilidadeCliente> buscarListaVulnerabilidadesPorCliente(Cliente cliente) {
        return vulnerabilidadeClienteRepository.findByStatusComunicacao(StatusComunicacao.AGUARDANDO_ENVIO);
    }


    @Override
    public List<VulnerabilidadeCliente> buscarVulnerabilidadesPorClienteParaEnvio(StatusComunicacao statusComunicacao, Cliente cliente, Agendamento agendamento) {
        return vulnerabilidadeClienteRepository.findByStatusComunicacaoAndClienteAndAgendamento(statusComunicacao, cliente,agendamento);
    }
}
