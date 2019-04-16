package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.domain.VulnerabilidadeCliente;

import java.util.List;

public interface TableRendererService {

    String getRenderedDataTable(List<VulnerabilidadeCliente> vulnerabilidadeClientes);
}
