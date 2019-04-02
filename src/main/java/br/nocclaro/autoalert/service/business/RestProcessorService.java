package br.nocclaro.autoalert.service.business;

import br.nocclaro.autoalert.domain.Cliente;

public interface RestProcessorService {

    Cliente getClienteFromIp(String Ip);


}
