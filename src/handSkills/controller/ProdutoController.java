package handSkills.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import handSkills.model.Estado;
import handSkills.model.EstadoHibernateDAO;
import handSkills.model.MaterialDoProduto;
import handSkills.model.MaterialDoProdutoDAO;
import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.model.TipoUsuario;
import handSkills.model.Usuario;
import handSkills.util.Util;

@Controller
public class ProdutoController {
	
	@RequestMapping("/exibirCadastrarProduto")
	public String exibirCadastrarProduto(Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO) && !usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			ProdutoDAO dao = new ProdutoDAO();
			List<Produto> listaProduto = dao.listar();
			model.addAttribute("listaProduto", listaProduto);
			
			return "index";
		}
		EstadoHibernateDAO dao = new EstadoHibernateDAO();
		List<Estado> listarEstados = new ArrayList<Estado>();
		listarEstados = dao.listar();
		model.addAttribute("listarEstado", listarEstados);
		
		MaterialDoProdutoDAO dao2 = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> listaMaterialDoProduto = dao2.listarMaterialDoProduto();
		model.addAttribute("listaMaterialDoProduto", listaMaterialDoProduto);

		return "produto/cadastrarProduto";
	}

	@RequestMapping("/CadastrarProduto")
	public String CadastrarProduto(@Valid Produto produto, BindingResult result , HttpSession session, @RequestParam("file") MultipartFile imagem, Model model) {
	
		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
			if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO) && !usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			
			return "erros/404";
		}

		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Util.obterMomentoAtual() + " - " + imagem.getOriginalFilename());
		}

		try {
			
			if (result.hasErrors()) {
				return "forward:exibirCadastrarProduto";
				}
			
			Usuario usuarioArtesao = (Usuario) session.getAttribute("usuarioLogado");
			produto.setUsuarioArtesao(usuarioArtesao);
			ProdutoDAO dao = new ProdutoDAO();
			if(produto.getImagem() != "") {
			dao.CadastrarProduto(produto, usuarioArtesao);
			model.addAttribute("mensagem", "O produto " + produto.getNomeProduto() + " foi cadastrado com sucesso");
			} else {
				model.addAttribute("mensagem", "Por favor, selecione uma imagem");
				return "forward:exibirCadastrarProduto";
			}
		} catch (Exception e) {
			model.addAttribute("mensagem", "Não foi possivél cadastrar o produto, contate o Administrador!");
			return "forward:exibirCadastrarProduto";
		}

		return "produto/cadastrarProduto";
	}

	@RequestMapping("/listarProduto")
	public String listarProduto(Model model, HttpSession session) {
		
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		return "produto/ListarProduto";
	}
	
	@RequestMapping("/meusProdutos")
	public String meusProdutos(Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO) && !usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			
			return "erros/404";
		}
		
		Usuario usuarioArtesao = (Usuario) session.getAttribute("usuarioLogado");
		Produto produto = new Produto();
		produto.setUsuarioArtesao(usuarioArtesao);
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> listaProduto = dao.listarMeusProdutos(usuarioArtesao);
		model.addAttribute("listaProduto", listaProduto);

		return "produto/meusProdutos";
	}

	@RequestMapping("removerProduto")
	public String removerProduto(Produto produto, Model model) {
		
		try {
		ProdutoDAO dao = new ProdutoDAO();
		dao.remover(produto);
		model.addAttribute("mensagem", "O produto removido com sucesso");
		return "forward:meusProdutos";
		
		}catch(RuntimeException run) {
			model.addAttribute("mensagem","Não é possível remover o produto, pois o mesmo se encontra vendido.");
			return "forward:meusProdutos";
		}
	}

	@RequestMapping("/exibirAtualizarProduto")
	public String exibirAlterarProduto(Produto produto, Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO) && !usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
			
			return "erros/404";
		}
		
		EstadoHibernateDAO dao3 = new EstadoHibernateDAO();
		List<Estado> listarEstados = new ArrayList<Estado>();
		listarEstados = dao3.listar();
		model.addAttribute("listarEstado", listarEstados);
		
		ProdutoDAO dao = new ProdutoDAO();
		Produto produtoCompleto = dao.buscaPorId(produto.getId());
		model.addAttribute("p", produtoCompleto);

		MaterialDoProdutoDAO dao2 = new MaterialDoProdutoDAO();
		List<MaterialDoProduto> listaMaterialDoProduto = dao2.listarMaterialDoProduto();
		model.addAttribute("listaMaterialDoProduto", listaMaterialDoProduto);

		return "produto/AlterarProduto";
	}

	@RequestMapping("/exibirInformacoesProduto")
	public String exibirInformacoesProduto(Produto produto, Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");
		
		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO) && !usuario1.getTipoUsuario().equals(TipoUsuario.ADM) ) {
			
		
			
			return "erros/404";
		}
		
		ProdutoDAO dao = new ProdutoDAO();
		Produto produtoCompleto = dao.buscaPorId(produto.getId());
		model.addAttribute("prod", produtoCompleto);

		return "forward:listarProduto";
	}

	@RequestMapping("/alterarProduto")
	public String alterarProduto(@Valid Produto produto, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			return "forward:exibirAtualizarProduto";
			}
		
		ProdutoDAO dao = new ProdutoDAO();
		dao.alterarProduto(produto);

		model.addAttribute("mensagem", "O produto foi alterado com sucesso");

		return "forward:listarProduto";
	}

	@RequestMapping("/pesquisarProduto")
	public String pesquisarProduto(Produto produto, Model model, HttpSession session) {
		
		ProdutoDAO dao = new ProdutoDAO();
		List<Produto> pesquisa = dao.pesquisarProduto(produto);
		model.addAttribute("pesquisa", pesquisa);
		model.addAttribute("localOrigem", produto.getLocalOrigemProduto());
		model.addAttribute("nomeProduto", produto.getNomeProduto());

		return "produto/pesquisaProduto";
	}
	
	
}
