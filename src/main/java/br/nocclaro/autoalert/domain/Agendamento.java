package br.nocclaro.autoalert.domain;


import br.nocclaro.autoalert.validation.ResultadoTesteValido;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class Agendamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private LocalDateTime dataHoraAgendamento;

    @NonNull
    @Enumerated(EnumType.STRING)
    private StatusAgendamento statusAgendamento;

    @Lob
    @NotBlank
    @ResultadoTesteValido
    private String resultadoTeste;

    @ManyToOne
    @NonNull
    private TipoVulnerabilidade tipoVulnerabilidade;


    @OneToMany(
            mappedBy = "agendamento",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<VulnerabilidadeCliente> vulerabilidades = new ArrayList<>();


    @OneToMany(
            mappedBy = "agendamento",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<LogAgendamento> logs = new ArrayList<>();




    @Override
    public String toString() {
        return "Agendamento{" +
                "id=" + id +
                '}';
    }
}
