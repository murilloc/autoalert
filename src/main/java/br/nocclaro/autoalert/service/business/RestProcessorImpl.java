package br.nocclaro.autoalert.service.business;


import br.nocclaro.autoalert.domain.Cliente;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class RestProcessorImpl implements RestProcessorService {


    @Override
    public Cliente getClienteFromIp(String ip) {
        Cliente cliente = new Cliente();

        RestTemplateBuilder builder = new RestTemplateBuilder();
        RestTemplate restTemplate = builder.build();

        String jsonTemplate = restTemplate.getForObject("https://rdap.registro.br/ip/" + ip, String.class);

        cliente.setEmail(getEmailFromResponseBody(jsonTemplate));
        cliente.setNome(getNomeClientFromResponseBody(jsonTemplate));

        if (cliente.getNome().isEmpty() || cliente.getEmail().isEmpty()) {
            return null;
        }

        return cliente;

    }


    private String getEmailFromResponseBody(String jsonTemplate) {


        int inicioEmail = jsonTemplate.indexOf("[\"email\",{},\"text\",\"");
        int fimEmail = jsonTemplate.indexOf("\"],[\"lang\",{},\"language");

        if (inicioEmail > 0 && fimEmail > 0) {
            return jsonTemplate.substring(inicioEmail + 20, fimEmail);
        } else {
            return "";
        }

    }

    private String getNomeClientFromResponseBody(String jsonTemplate) {

        int inicioNomeCliente = jsonTemplate.indexOf("[\"fn\",{},\"text\",\"");
        int fimNomeCliente = jsonTemplate.indexOf("\"],[\"adr\"");
        if (inicioNomeCliente > 0 && fimNomeCliente > 0) {
            return jsonTemplate.substring(inicioNomeCliente + 17, fimNomeCliente);
        } else {
            return "";
        }
    }
}
