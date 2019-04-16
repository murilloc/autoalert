package br.nocclaro.autoalert.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class LogAgendamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @NonNull
    LocalDateTime dataHora;

    @Lob
    @NonNull
    String info;

    @ManyToOne(fetch = FetchType.LAZY)
    private Agendamento agendamento;

    @NonNull
    @Enumerated(EnumType.STRING)
    private StatusLog status;


}
