package br.nocclaro.autoalert.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class Vulnerabilidade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NonNull
    private String asn;
    @NonNull
    private String status;
    @NonNull
    private LocalDateTime dataHora;
    @NonNull
    private String resultado;
    
    @OneToMany(
            mappedBy = "vulnerabilidade",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<VulnerabilidadeCliente> ipClientes = new ArrayList<>();
    
    @ManyToOne
    @JoinColumn(name="tipo_vulnerabilidade_id")
    private TipoVulnerabilidade tipoVulnerabilidade;


    @Override
    public String toString() {
        return "Vulnerabilidade{" +
                "id=" + id +
                '}';
    }
}
