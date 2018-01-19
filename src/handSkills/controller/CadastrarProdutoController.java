package handSkills.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.util.Util;

@Controller
public class CadastrarProdutoController {

	@RequestMapping("/exibirInserirProduto")
	public String exibirInserirProduto() {
		return "produto/CadastrarProduto";
	}

	@RequestMapping("/exibirListagemProduto")
	public String exibirListagemProduto() {
		return "produto/ListarProduto";
	}

	@RequestMapping("/inserirProduto")
	public String inserirProduto(Produto produto, @RequestParam("file") MultipartFile imagem) {

		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Calendar.getInstance().getTime() + " - " + imagem.getOriginalFilename());
		}

		ProdutoDAO dao = new ProdutoDAO();
		dao.incluir(produto);
		return "Produto/inseridoSucesso";
	}

}
