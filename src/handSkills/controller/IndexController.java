package handSkills.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.IndexDAO;
import handSkills.model.Produto;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/exibirlistarProdutoIndex")
	public String exibirlistarProdutoIndex() {
		return "index";
	}

	@RequestMapping("/listarProdutoIndex")
	public String listarProdutoIndex(Model model) {
		IndexDAO dao = new IndexDAO();
		List<Produto> listaProdutoIndex = dao.listarIndex();
		model.addAttribute("listaProdutoIndex", listaProdutoIndex);

		return "index";
	}

}
