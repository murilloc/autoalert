package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {


    Cliente findByNome(String nome);

    Cliente findByEmail(String email);

    @Query(value = "SELECT DISTINCT  c.* FROM cliente c INNER JOIN vulnerabilidade_cliente vc on c.id = vc.cliente_id WHERE vc.status_comunicacao = 'AGUARDANDO_ENVIO'", nativeQuery = true)
    List<Cliente> findDistinctAguardandoComunicacao();

}
