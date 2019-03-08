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
    
    @OneToMany(mappedBy = "tipoVulnerabilidade")
    private List<Vulnerabilidade> vulnerabilidades = new ArrayList<>();
}
