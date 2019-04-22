package br.nocclaro.autoalert.service.business;

import java.util.List;

public interface UtilService {

    List<String> separaCampos(String linha);

    List<String> separaLinhas(String value);

    String substituirPor(String padrao, String trocarPor, String texto);
}
