package br.nocclaro.autoalert.controller;


import br.nocclaro.autoalert.domain.LogAgendamento;
import br.nocclaro.autoalert.service.persistence.LogAgendamentoSerivce;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("resultado")
public class LogAgendamentoController {

    private static final Logger logger = LoggerFactory.getLogger(AgendamentoController.class);

    private LogAgendamentoSerivce logAgendamentoSerivce;

    public LogAgendamentoController(LogAgendamentoSerivce logAgendamentoSerivce) {
        this.logAgendamentoSerivce = logAgendamentoSerivce;
    }


    @RequestMapping(value = "log", method = RequestMethod.GET)
    public String getListaLogAgendamento(Model model) {
        List<LogAgendamento> logs = logAgendamentoSerivce.buscarTodos();
        model.addAttribute("logs", logs);
        return "logagendamento/lista";
    }


    @RequestMapping(value = "log/{id}", method = RequestMethod.GET)
    public String getListaAgendamentoPorId(@PathVariable Long id, Model model) {
        List<LogAgendamento> logs = logAgendamentoSerivce.buscarPorAgendamentoId(id);
        model.addAttribute("logs", logs);
        model.addAttribute("codigo", id);
        return "logagendamento/lista";
    }


}
