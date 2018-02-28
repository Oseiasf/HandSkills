package handSkills.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.MaterialDoProduto;
import handSkills.model.MaterialDoProdutoDAO;

public class MaterialDoProdutoController {

	@RequestMapping("/exibirCadastrarMaterial")
	public String exibirCadastrarMaterial() {

		return "material/cadastrarMaterial";
	}

	@RequestMapping("/cadastrarMaterial")
	public String CadastrarMaterial(MaterialDoProduto material, Model model) {

		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		dao.CadastrarMaterial(material);

		if (material == null) {
			model.addAttribute("msg", "Erro ao inserir Material novo");
		}

		model.addAttribute("msg", "O Material" + material.getDescricao() + "cadastrado com sucesso");

		return "material/cadastrarMaterial";
	}
}
