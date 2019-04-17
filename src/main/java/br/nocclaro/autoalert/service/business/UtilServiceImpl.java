package br.nocclaro.autoalert.service.business;


import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class UtilServiceImpl implements UtilService {

    @Override
    public List<String> separaCampos(String linha) {

        return Arrays.asList(linha.trim().split("\\|"));
    }

    @Override
    public List<String> separaLinhas(String value) {

        return Arrays.asList(value.trim().split("\\s*\\r?\\n\\s*"));
    }
}
