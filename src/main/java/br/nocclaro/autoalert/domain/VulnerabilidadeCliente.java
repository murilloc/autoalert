package br.nocclaro.autoalert.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "vulnerabilidade_cliente")
@Data
public class VulnerabilidadeCliente {
    
    @EmbeddedId
    private VulnerabilidadeClienteId id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("vulnerabilidadeId")
    private Vulnerabilidade vulnerabilidade;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("clienteId")
    private Cliente cliente;
    
    
}
