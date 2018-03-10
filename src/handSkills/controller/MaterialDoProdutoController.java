package handSkills.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.MaterialDoProduto;
import handSkills.model.MaterialDoProdutoDAO;

@Controller
public class MaterialDoProdutoController {

	@RequestMapping("/exibirCadastrarMaterial")
	public String exibirCadastrarMaterial() {

		return "material/cadastrarMaterial";
	}

	@RequestMapping("/cadastrarMaterial")
	public String cadastrarMaterial(MaterialDoProduto material, Model model) {

		try {

			MaterialDoProdutoDAO dao2 = new MaterialDoProdutoDAO();

			if (dao2.verificaExisteNomeProduto(material.getDescricao())) {
				model.addAttribute("nomeMaterialProdutoExiste", "O nome do material já existe, por favor tente outro.");
				return "forward:exibirCadastrarMaterial";
			}

			MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
			dao.CadastrarMaterial(material);
			model.addAttribute("msg", "O Material " + material.getDescricao() + " cadastrado com sucesso");
			return "material/cadastrarMaterial";
			
		} catch (Exception e) {
			model.addAttribute("mensagem", "Não foi possivél cadastrar o material do produto, contate o Administrador!");
			return "forward:exibirCadastrarMaterial";
		}

	
	}

	@RequestMapping("/exibirAlterarMaterial")
	public String exibirAlterarProduto(MaterialDoProduto material, Model model) {

		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		MaterialDoProduto materialCompleto = dao.buscarPorId(material.getId());
		model.addAttribute("material", materialCompleto);

		return "material/alterarMaterial";
	}

	@RequestMapping("/alterarMaterial")
	public String alterarMaterial(MaterialDoProduto material, Model model) {

		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		dao.alterarMaterial(material);

		model.addAttribute("mensagem", "Material Alterado com sucesso!");

		return "forward:listarMaterial";
	}

	@RequestMapping("/exibirListarMaterial")
	public String exibirListarMaterial() {

		return "material/listarMaterial";
	}

	@RequestMapping("/listarMaterial")
	public String listarMaterial(Model model) {

		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> listarMaterial = dao.listarMaterialDoProduto();
		model.addAttribute("listarMaterial", listarMaterial);

		return "material/listarMaterial";
	}

	@RequestMapping("removerMaterial")
	public String removerMaterial(MaterialDoProduto material, Model model) {
		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		dao.removerMaterial(material);
		model.addAttribute("mensagem", "Material Removido com Sucesso");
		return "forward:listarMaterial";
	}
}
