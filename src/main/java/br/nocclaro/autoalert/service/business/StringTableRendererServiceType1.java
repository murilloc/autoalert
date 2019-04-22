package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

@Service
public class StringTableRendererServiceType1 implements TableRendererService {

    @Override
    public String getRenderedDataTable(List<VulnerabilidadeCliente> vulnerabilidadesCliente) {

        StringBuilder result = new StringBuilder();

        char[] linha = new char[85];
        Arrays.fill(linha, ' ');
        int[] separatorPos = {0, 17, 26, 35, 63};
        char separator = '|';
        linha[separatorPos[1]] = separator;
        linha[separatorPos[2]] = separator;
        linha[separatorPos[3]] = separator;
        linha[separatorPos[4]] = separator;


        for (VulnerabilidadeCliente vulnerabilidadeCliente : vulnerabilidadesCliente) {


            char[] ip = vulnerabilidadeCliente.getId().getIpAddress().toCharArray();
            char[] asn = vulnerabilidadeCliente.getVulnerabilidade().getAsn().toCharArray();
            char[] status = vulnerabilidadeCliente.getVulnerabilidade().getStatus().toCharArray();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime localDataHora = vulnerabilidadeCliente.getVulnerabilidade().getDataHora();

            String formatedDataHora = localDataHora.format(formatter);


            char[] dataHora = formatedDataHora.toCharArray();
            char[] resultado = vulnerabilidadeCliente.getVulnerabilidade().getResultado().toCharArray();


            System.arraycopy(ip, 0, linha, separatorPos[0], ip.length);
            System.arraycopy(asn, 0, linha, separatorPos[1] + 2, asn.length);
            System.arraycopy(status, 0, linha, separatorPos[2] + 2, status.length);
            System.arraycopy(dataHora, 0, linha, separatorPos[3] + 2, dataHora.length);
            System.arraycopy(resultado, 0, linha, separatorPos[4] + 2, resultado.length);

            result.append(String.copyValueOf(linha)).append("<br>");


        }


        return result.toString();
    }

}
