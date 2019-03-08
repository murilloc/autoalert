package br.nocclaro.autoalert.controller;

import br.nocclaro.autoalert.domain.TipoVulnerabilidade;
import br.nocclaro.autoalert.repository.TipoVulnerabilidadeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class TipoVulnerabilidadeController {
    String name;
    private static final Logger logger = LoggerFactory.getLogger(TipoVulnerabilidade.class);
    
    private TipoVulnerabilidadeRepository tipoVulnerabilidadeRepository;
    
    public TipoVulnerabilidadeController(TipoVulnerabilidadeRepository tipoVulnerabilidadeRepository) {
        this.tipoVulnerabilidadeRepository = tipoVulnerabilidadeRepository;
    }
    
    
    @GetMapping("/")
    public String list(Model model) {
        model.addAttribute("tiposVulnerabilidade", tipoVulnerabilidadeRepository.findAll());
        return null;
    }
    
    @GetMapping("tipo/{id}")
    public String read(@PathVariable Long id, Model model) {
        Optional<TipoVulnerabilidade> tipoVulnerabilidade = tipoVulnerabilidadeRepository.findById(id);
        if (tipoVulnerabilidade.isPresent()) {
            model.addAttribute("tipo", tipoVulnerabilidade.get());
            model.addAttribute("success", model.containsAttribute("success"));
            return "tipo/view";
        }
        return "redirect:/";
    }
    
    @GetMapping("tipo/submit")
    public String newTipoForm(Model model) {
        model.addAttribute("link", new TipoVulnerabilidade());
        return "tipo/submit";
    }
    
    @PostMapping("tipo/submit")
    public String createLink(@Valid TipoVulnerabilidade tipo, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            logger.info("Erro de validação ao submeter o tipo de vulnerabilidade");
            model.addAttribute("tipo", tipo);
            return "tipo/submit";
        } else {
            tipoVulnerabilidadeRepository.save(tipo);
            logger.info("Um novo tipo de vulnerabilidade foi salvo com sucesso!");
            redirectAttributes.addAttribute("id", tipo.getId())
                    .addFlashAttribute("success", true);
            return "redirect:/tipo{id}";
        }
    }
}
