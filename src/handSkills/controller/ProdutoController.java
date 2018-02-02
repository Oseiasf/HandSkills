package handSkills.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.util.Util;





@Controller
public class ProdutoController {

	@RequestMapping("/exibirCadastrarProduto")
	public String exibirCadastrarProduto() {

		return "produto/CadastrarProduto";
	}
	

	@RequestMapping("/CadastrarProduto")
	public String CadastrarProduto(Produto produto, @RequestParam("file") MultipartFile imagem, Model model) {

		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Util.obterMomentoAtual() + " - " + imagem.getOriginalFilename());
		}

		ProdutoDAO dao = new ProdutoDAO();
		dao.CadastrarProduto(produto);

		model.addAttribute("mensagem", "Produto cadastrado com sucesso");

		return "produto/CadastrarProduto";
	}

	@RequestMapping("/listarProduto")
	public String listarProduto(Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		return "produto/ListarProduto";
	}
	
	@RequestMapping("/exibirlistarProdutoIndex")
	public String exibirlistarProdutoIndex() {
		return "index";
	}
	
	@RequestMapping("/listarProdutoIndex")
	public String listarProdutoIndex(Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProdutoIndex = dao.listarIndex();
		model.addAttribute("listaProdutoIndex", listaProdutoIndex);
		
		return "index";
	}

	@RequestMapping("removerProduto")
	public String removerProduto(Produto produto, Model model) {
		ProdutoDAO dao = new ProdutoDAO();
		dao.remover(produto);
		model.addAttribute("mensagem", "Produto Removido com Sucesso");
		return "forward:ListarProduto";
	}

	@RequestMapping("/exibirAlterarProduto")
	public String exibirAlterarProduto(Produto produto, Model model) {

		ProdutoDAO dao = new ProdutoDAO();
		Produto produtoCompleto = dao.buscaPorId(produto.getId());
		model.addAttribute("p", produtoCompleto);

		return "produto/AlterarProduto";
	}

	@RequestMapping("/alterarProduto")
	public String alterarProduto(Produto produto, Model model) {

		ProdutoDAO dao = new ProdutoDAO();
		dao.alterarProduto(produto);

		model.addAttribute("mensagem", "Produto alterado com sucesso");

		return "forward:listarProduto";
	}
}