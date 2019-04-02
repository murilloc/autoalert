package br.nocclaro.autoalert.domain;

import lombok.Data;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import java.time.LocalDateTime;

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

    @ManyToOne(fetch = FetchType.LAZY)
    private Agendamento agendamento;


    @Enumerated(EnumType.STRING)
    private StatusComunicacao statusComunicacao;

    public LocalDateTime dataHoraEnvio;

    @Override
    public String toString() {
        return "VulnerabilidadeCliente{" +
                "id=" + id +
                '}';
    }



}
