package br.nocclaro.autoalert.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.util.ArrayList;
import java.util.List;

@Entity
@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class Cliente {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String nome;

    @Email
    @NonNull
    @Column(unique = true)
    private String email;
    
    @OneToMany(
            mappedBy = "cliente",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<VulnerabilidadeCliente> vulerabilidades = new ArrayList<>();


    @Override
    public String toString() {
        return "Cliente{" +
                "id=" + id +
                '}';
    }
}
