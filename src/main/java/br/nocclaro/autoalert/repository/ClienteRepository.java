package br.nocclaro.autoalert.repository;

import br.nocclaro.autoalert.domain.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {


    Cliente findByNome(String nome);
    Cliente findByEmail(String email);
}
