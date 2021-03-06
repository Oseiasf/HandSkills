package handSkills.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.MaterialDoProduto;
import handSkills.model.MaterialDoProdutoDAO;
import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.model.TipoUsuario;
import handSkills.model.Usuario;

@Controller
public class MaterialDoProdutoController {

	@RequestMapping("/exibirCadastrarMaterial")
	public String exibirCadastrarMaterial(Model model, HttpSession session) {
		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			return "erros/404";
		}
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
			model.addAttribute("msg", "O Material " + material.getDescricao() + " foi cadastrado com sucesso");
			return "material/cadastrarMaterial";
			
		} catch (Exception e) {
			model.addAttribute("mensagem", "Não foi possivél cadastrar o material do produto, contate o Administrador!");
			return "forward:exibirCadastrarMaterial";
		}

	
	}

	@RequestMapping("/exibirAlterarMaterial")
	public String exibirAlterarProduto(MaterialDoProduto material, Model model, HttpSession session) {
		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			return "erros/404";
		}
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
	public String exibirListarMaterial(Model model, HttpSession session) {
		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			return "erros/404";
		}
		return "material/listarMaterial";
	}

	@RequestMapping("/listarMaterial")
	public String listarMaterial(Model model, HttpSession session) {
		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			return "erros/404";
		}
		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> listarMaterial = dao.listarMaterialDoProduto();
		model.addAttribute("listarMaterial", listarMaterial);

		return "material/listarMaterial";
	}

	@RequestMapping("removerMaterial")
	public String removerMaterial(MaterialDoProduto material, Model model) {
		
		try {
		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		dao.removerMaterial(material);
		model.addAttribute("mensagem", "Material Removido com Sucesso");
		return "forward:listarMaterial";
		
		}catch(RuntimeException run) {
			model.addAttribute("mensagem","Não é possível remover o material, existem produtos já relacionados.");
			return "forward:listarMaterial";
		}
	}
	
	@RequestMapping("/pesquisarMaterial")
	public String pesquisarMaterial(MaterialDoProduto material, Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO) && !usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			return "erros/404";
		}
		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> pesquisa = new ArrayList<MaterialDoProduto>();
		pesquisa = dao.pesquisarMaterial(material);
		 
		if (material.getDescricao() == null || material.getDescricao().equals("") || material == null) {
			 model.addAttribute("nomeMaterial" , "Não existe materiais com esse nome"); 
			 return "material/pesquisaMaterial";
		 }
		  model.addAttribute("pesquisa", pesquisa);
		  return "material/pesquisaMaterial";
	}
}
