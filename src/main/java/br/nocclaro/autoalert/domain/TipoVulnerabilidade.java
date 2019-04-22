package br.nocclaro.autoalert.domain;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class TipoVulnerabilidade {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String nome;
    @Lob
    private String modeloMensagem;
    @Column(name="nome_template")
    private String templateName;

    @Enumerated(EnumType.STRING)
    private IdentificadorVulnerabilidade identificadorVulnerabilidade;
    
    @OneToMany(cascade = CascadeType.ALL,
            mappedBy = "tipoVulnerabilidade",
            orphanRemoval = true)
    private List<Vulnerabilidade> vulnerabilidades = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL,
            mappedBy = "tipoVulnerabilidade",
            orphanRemoval = true)
    private List<Agendamento> agendamentos = new ArrayList<>();

    @Override
    public String toString() {
        return "TipoVulnerabilidade{" +
                "id=" + id +
                '}';
    }
}
