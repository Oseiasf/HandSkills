package handSkills.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComprasController {
	
	@RequestMapping("/exibirListaCompras")
	public String exibirListaCompras(Model model) {
		

		return "compras/listarCompras";
	}
}
