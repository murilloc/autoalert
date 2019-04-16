package br.nocclaro.autoalert.service.business.freemarker;

import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;
import br.nocclaro.autoalert.service.business.StringTableRendererService;
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
    private StringTableRendererService tableRendererService;

    public FreeMarkerTemplateWriter(FreeMarkerConfigurer freeMarkerConfigurer, StringTableRendererService tableRendererService) {
        this.freeMarkerConfigurer = freeMarkerConfigurer;
        this.tableRendererService = tableRendererService;
    }

    public String composeMessage(String templateName, List<VulnerabilidadeCliente> vulnerabilidadesCliente) {

        Configuration freeMarkerConfig = freeMarkerConfigurer.getConfiguration();
        Template template = null;
        try {
            template = freeMarkerConfig.getTemplate(templateName);
        } catch (IOException e) {
            logger.error("Erro na configuração do template FreeMarker");
        }

        Map<String, String> data = new HashMap<>();
        String renderedDataTable = tableRendererService.getRenderedDataTable(vulnerabilidadesCliente);

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
