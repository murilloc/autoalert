package br.nocclaro.autoalert.service.business.freemarker;

import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.IdentificadorVulnerabilidade;
import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.service.business.StringTableRendererServiceType1;
import br.nocclaro.autoalert.service.business.StringTableRendererServiceType2;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class FreeMarkerTemplateWriter {

    private static final Logger logger = LoggerFactory.getLogger(FreeMarkerTemplateWriter.class);

    private FreeMarkerConfigurer freeMarkerConfigurer;
    private StringTableRendererServiceType1 tableRendererServiceType1;
    private StringTableRendererServiceType2 tableRendererServiceType2;

    public FreeMarkerTemplateWriter(FreeMarkerConfigurer freeMarkerConfigurer, StringTableRendererServiceType1 tableRendererServiceType1, StringTableRendererServiceType2 tableRendererServiceType2) {
        this.freeMarkerConfigurer = freeMarkerConfigurer;
        this.tableRendererServiceType1 = tableRendererServiceType1;
        this.tableRendererServiceType2 = tableRendererServiceType2;
    }

    public String composeMessage(Agendamento agendamento, List<VulnerabilidadeCliente> vulnerabilidadesCliente) {

        Configuration freeMarkerConfig = freeMarkerConfigurer.getConfiguration();
        Template template = null;
        String templateName = agendamento.getTipoVulnerabilidade().getTemplateName();
        IdentificadorVulnerabilidade identificadorVulnerabilidade = agendamento.getTipoVulnerabilidade().getIdentificadorVulnerabilidade();
        try {
            template = freeMarkerConfig.getTemplate(templateName);
        } catch (IOException e) {
            logger.error("Erro na configuração do template FreeMarker");
        }

        String renderedDataTable;
        Map<String, String> data = new HashMap<>();
        if (identificadorVulnerabilidade == IdentificadorVulnerabilidade.SERVICO_DEVICE_DISCOVERY_HABILITADO) {
            renderedDataTable = tableRendererServiceType2.getRenderedDataTable(vulnerabilidadesCliente);
        } else {
            renderedDataTable = tableRendererServiceType1.getRenderedDataTable(vulnerabilidadesCliente);
        }

        data.put("tabelaVulnerabilidades", renderedDataTable);

        String html = null;

        try {
            html = FreeMarkerTemplateUtils.processTemplateIntoString(template, data);
            return html;
        } catch (IOException e) {
            logger.error("Erro ao cirat a string da tabela");
            return "Erro ao cirat a string da tabela";
        } catch (TemplateException e) {
            logger.error("Erro ao renderizar a tabela");
            return "Erro ao renderizar a tabela";
        }


    }

}
