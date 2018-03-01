package handSkills.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import handSkills.model.MaterialDoProduto;
import handSkills.model.MaterialDoProdutoDAO;
import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.util.Util;

@Controller
public class ProdutoController {

	@RequestMapping("/exibirCadastrarProduto")
	public String exibirCadastrarProduto(Model model) {

		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> listaMaterialDoProduto = dao.listarMaterialDoProduto();
		model.addAttribute("listaMaterialDoProduto", listaMaterialDoProduto);

		return "produto/cadastrarProduto";
	}

	@RequestMapping("/CadastrarProduto")
	public String CadastrarProduto(Produto produto, @RequestParam("file") MultipartFile imagem, Model model) {

		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Util.obterMomentoAtual() + " - " + imagem.getOriginalFilename());
		}

		ProdutoDAO dao = new ProdutoDAO();
		dao.CadastrarProduto(produto);
		
		if (produto == null){
			model.addAttribute("mensagem", "Erro ao cadastrar Produto");
		}
		
		model.addAttribute("mensagem", "Produto cadastrado com sucesso");

		return "produto/cadastrarProduto";
	}

	@RequestMapping("/listarProduto")
	public String listarProduto(Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		return "produto/ListarProduto";
	}
	
	@RequestMapping("/")
	public String listarProdutoIndex(Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		return "index";
	}

	@RequestMapping("removerProduto")
	public String removerProduto(Produto produto, Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		dao.remover(produto);
		model.addAttribute("mensagem", "Produto Removido com Sucesso");
		return "forward:ListarProduto";
	}

	@RequestMapping("/exibirAtualizarProduto")
	public String exibirAlterarProduto(Produto produto, Model model) {

		ProdutoDAO dao = new ProdutoDAO();
		Produto produtoCompleto = dao.buscaPorId(produto.getId());
		model.addAttribute("p", produtoCompleto);

		MaterialDoProdutoDAO dao2 = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> listaMaterialDoProduto = dao2.listarMaterialDoProduto();
		model.addAttribute("listaMaterialDoProduto", listaMaterialDoProduto);

		return "produto/AlterarProduto";
	}

	@RequestMapping("/exibirInformacoesProduto")
	public String exibirInformacoesProduto(Produto produto, Model model) {

		ProdutoDAO dao = new ProdutoDAO();
		Produto produtoCompleto = dao.buscaPorId(produto.getId());
		model.addAttribute("prod", produtoCompleto);

		return "forward:listarProduto";
	}

	@RequestMapping("/alterarProduto")
	public String alterarProduto(Produto produto, Model model) {

		ProdutoDAO dao = new ProdutoDAO();
		dao.alterarProduto(produto);

		model.addAttribute("mensagem", "Produto alterado com sucesso");

		return "forward:listarProduto";
	}

	@RequestMapping("/pesquisarProduto")
	public String pesquisarProduto(Produto produto, Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> pesquisa = dao.pesquisarProduto(produto);
		model.addAttribute("pesquisa", pesquisa);
		model.addAttribute("localOrigem", produto.getLocalOrigemProduto());
		model.addAttribute("nomeProduto", produto.getNomeProduto());

		return "produto/pesquisaProduto";
	}
	
	@RequestMapping("/exibirCadastrarMaterial")
	public String exibirCadastrarMaterial() {

		return "material/cadastrarMaterial";
	}

	@RequestMapping("/cadastrarMaterial")
	public String cadastrarMaterial(MaterialDoProduto material, Model model) {

		MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
		dao.CadastrarMaterial(material);

		if (material == null) {
			model.addAttribute("msg", "Erro ao inserir Material novo");
			return "material/cadastrarMaterial";
		}

		model.addAttribute("msg", "O Material" + material.getDescricao() + "cadastrado com sucesso");

		return "material/cadastrarMaterial";
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
		return "forward:ListarMaterial";
	}
}
