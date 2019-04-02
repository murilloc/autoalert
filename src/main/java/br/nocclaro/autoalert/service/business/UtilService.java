package br.nocclaro.autoalert.service.business;

import java.util.List;

public interface UtilService {

    boolean validaIP(String ip);

    List<String> separaCampos(String linha);

    List<String> separaLinhas(String value);
}
