package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Cliente;
import br.nocclaro.autoalert.repository.ClienteRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class ClienteServiceImpl implements ClienteService {


    ClienteRepository clienteRepository;

    public ClienteServiceImpl(ClienteRepository clienteRepository) {
        this.clienteRepository = clienteRepository;
    }


    @Override
    public Cliente salvar(Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    @Override
    public Cliente editar(Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    @Override
    public void excluir(Long id) {

        clienteRepository.deleteById(id);
    }

    @Override
    public Cliente buscarPorNome(String nome) {
        return clienteRepository.findByNome(nome);
    }

    @Override
    public Cliente buscarPorEmail(String email) {
        return clienteRepository.findByEmail(email);
    }

    @Override
    public Optional<Cliente> buscarPorId(Long id) {
        return clienteRepository.findById(id);
    }

    @Override
    public List<Cliente> buscarTodos() {
        return clienteRepository.findAll();
    }

    @Override
    public Page<Cliente> findPaginated(Pageable pageable) {
        return null;
    }
}
