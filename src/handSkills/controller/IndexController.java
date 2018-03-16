package handSkills.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String exibirPrimeiraPagina(Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		return "index";
	}
	
	@RequestMapping("/login")
	public String Login(Model model) {

		return "login";
	}
}
