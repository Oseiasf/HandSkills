package handSkills.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.IndexDAO;
import handSkills.model.Produto;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String exibirPrimeiraPagina(Model model) {
		IndexDAO dao = new IndexDAO();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		return "index";
	}
	
	@RequestMapping("/login")
	public String Login(Model model) {

		return "login";
	}
}
