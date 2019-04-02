package br.nocclaro.autoalert.service.persistence;


import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.repository.AgendamentoRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = false)
public class AgendamentoServiceImpl implements AgendamentoService {


    private AgendamentoRepository agendamentoRepository;




    public AgendamentoServiceImpl(AgendamentoRepository agendamentoRepository) {
        this.agendamentoRepository = agendamentoRepository;
    }


    @Override
    public Agendamento salvar(Agendamento agendamento) {
        return agendamentoRepository.save(agendamento);
    }

    @Override
    public Agendamento editar(Agendamento agendamento) {
        return agendamentoRepository.save(agendamento);
    }

    @Override
    public void excluir(Long id) {
        agendamentoRepository.deleteById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Agendamento> buscarPorId(Long id) {
        return agendamentoRepository.findById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Agendamento> buscarTodos() {
        return agendamentoRepository.findAll();
    }

    @Override
    public Page<Agendamento> findPaginated(Pageable pageable) {
        List<Agendamento> agendamentos = agendamentoRepository.findAll();
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageSize();
        int startItem = currentPage * pageSize;
        List<Agendamento> lista;

        if (agendamentos.size() < startItem) {
            lista = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, agendamentos.size());
            lista = agendamentos.subList(startItem, toIndex);
        }

        Page<Agendamento> agendamentoPage = new PageImpl<Agendamento>(lista, PageRequest.of(currentPage, pageSize), agendamentos.size());


        return agendamentoPage;

    }
}
