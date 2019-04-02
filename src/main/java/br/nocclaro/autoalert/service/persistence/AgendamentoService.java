package br.nocclaro.autoalert.service.persistence;

import br.nocclaro.autoalert.domain.Agendamento;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface AgendamentoService {

    Agendamento salvar(Agendamento agendamento);

    Agendamento editar(Agendamento agendamento);

    void excluir(Long id);

    Optional<Agendamento> buscarPorId(Long id);

    List<Agendamento> buscarTodos();

    Page<Agendamento> findPaginated(Pageable pageable);



}
