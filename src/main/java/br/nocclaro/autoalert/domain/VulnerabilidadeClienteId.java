package br.nocclaro.autoalert.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class VulnerabilidadeClienteId implements Serializable {
    
    @Column(name = "vulnerabilidade_id")
    private Long vulnerabilidadeId;
    
    @Column(name = "cliente_id")
    private Long clienteId;

    
    @NonNull
    private String ipAddress;


    @Override
    public String toString() {
        return "VulnerabilidadeClienteId{" +
                "vulnerabilidadeId=" + vulnerabilidadeId +
                ", clienteId=" + clienteId +
                ", ipAddress='" + ipAddress + '\'' +
                '}';
    }
}
