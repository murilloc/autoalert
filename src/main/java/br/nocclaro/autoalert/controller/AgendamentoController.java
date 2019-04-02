package br.nocclaro.autoalert.controller;

import br.nocclaro.autoalert.domain.Agendamento;
import br.nocclaro.autoalert.domain.StatusAgendamento;
import br.nocclaro.autoalert.service.business.AutoAlertService;
import br.nocclaro.autoalert.service.persistence.AgendamentoService;
import br.nocclaro.autoalert.service.business.ProcessamentoAgendamentoService;
import br.nocclaro.autoalert.service.persistence.TipoVulnerabilidadeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/agendamento")
public class AgendamentoController {

    private static final Logger logger = LoggerFactory.getLogger(AgendamentoController.class);

    private AgendamentoService agendamentoService;
    private TipoVulnerabilidadeService tipoVulnerabilidadeService;
    private AutoAlertService autoAlertService;
    private ProcessamentoAgendamentoService processamentoAgendamento;


    public AgendamentoController(AgendamentoService agendamentoService, TipoVulnerabilidadeService tipoVulnerabilidadeService, AutoAlertService autoAlertService, ProcessamentoAgendamentoService processamentoAgendamento) {
        this.agendamentoService = agendamentoService;
        this.tipoVulnerabilidadeService = tipoVulnerabilidadeService;
        this.autoAlertService = autoAlertService;
        this.processamentoAgendamento = processamentoAgendamento;
    }

    @RequestMapping(value = {"criar"})
    public ModelAndView criarAgendamentoView(@ModelAttribute Agendamento agendamento) {
        ModelAndView modelAndView = new ModelAndView("agendamento/cadastro");
        modelAndView.addObject("listaTipoVulnerabilidade", tipoVulnerabilidadeService.buscarTodos());
        return modelAndView;
    }


    @PostMapping(value = "criar")
    public ModelAndView salvarAgendamento(@Valid Agendamento agendamento, BindingResult result, Model model,
                                          RedirectAttributes attributes) {

        if (result.hasErrors()) {
            return criarAgendamentoView(agendamento);
        }

        agendamento.setDataHoraAgendamento(LocalDateTime.now());
        agendamento.setStatusAgendamento(StatusAgendamento.AGENDADO);
        agendamento = agendamentoService.salvar(agendamento);
        attributes.addFlashAttribute("mensagem", "Agendamento salvo com sucesso!");



        try {
            autoAlertService.sendNotifications(agendamento);
        } catch (InterruptedException e) {
            logger.error(e.getMessage());
        }

        return new ModelAndView("redirect:/agendamento/criar");

    }

    @RequestMapping(value = "lista", method = RequestMethod.GET)
    public String getListaAgendamento(Model model) {
        List<Agendamento> agendamentos = agendamentoService.buscarTodos();
        model.addAttribute("agendamentos", agendamentos);
        return "agendamento/lista";
    }

}
