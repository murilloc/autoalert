package br.nocclaro.autoalert.service.business;

import org.apache.commons.validator.routines.InetAddressValidator;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class UtilServiceImpl implements UtilService {

    @Override
    public boolean validaIP(String ip) {
        ip = ip.trim();
        InetAddressValidator validator = InetAddressValidator.getInstance();
        return validator.isValidInet4Address(ip) ? true : false;

    }

    @Override
    public List<String> separaCampos(String linha) {

        return Arrays.asList(linha.trim().split("\\|"));
    }

    @Override
    public List<String> separaLinhas(String value) {

        return Arrays.asList(value.trim().split("\\s*\\r?\\n\\s*"));
    }
}
