package br.nocclaro.autoalert.validation;

import org.apache.commons.validator.routines.InetAddressValidator;
import org.apache.logging.log4j.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class StringResultadoTesteValidator implements ConstraintValidator<ResultadoTesteValido, String> {
    private static final Logger logger = LoggerFactory.getLogger(StringResultadoTesteValidator.class);

    private String value;


    @Override
    public void initialize(ResultadoTesteValido constraintAnnotation) {
        this.value = constraintAnnotation.value();

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (Strings.isEmpty(value) || Strings.isBlank(value)) {
            return true;
        }

        return verificaValidadeCampo(value);
    }

    private boolean verificaValidadeCampo(String value) {

        boolean result = true;
        String[] lines = separaLinhas(value);

        for (String line : lines) {
            String[] testFields = separaCampos(line);
            if (testFields.length != 5 || !validaIP(testFields[0])) {
                result = false;
                break;
            }
        }
        return result;
    }


    private boolean validaIP(String ip) {
        ip = ip.trim();
        InetAddressValidator validator = InetAddressValidator.getInstance();
        return validator.isValidInet4Address(ip);

    }

    private String[] separaCampos(String linha) {

        return linha.trim().split("\\|");
    }


    private String[] separaLinhas(String value) {

        return value.trim().split("\\s*\\r?\\n\\s*");
    }
}
