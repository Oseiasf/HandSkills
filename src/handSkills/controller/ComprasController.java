package handSkills.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import handSkills.model.ItemCarrinho;
import handSkills.model.ItemVenda;
import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.model.Usuario;
import handSkills.model.Venda;
import handSkills.model.VendaHibernateDAO;

@Controller
public class ComprasController {
	
	@RequestMapping("/exibirAdicionarCompra")
    public String exibirAdicionarCarrinho(Produto produto, Model model, HttpSession session) {
    
	ProdutoDAO dao = new ProdutoDAO();
	Produto produtoCompleto = dao.buscaPorId(produto.getId());
	model.addAttribute("p", produtoCompleto);

	return "compras/AdicionarCompra";
    }
	
    @RequestMapping("/adicionarACompra")
    public String adicionarACompra(@RequestParam("id") String id, @RequestParam("quantidade") String qtd, HttpSession session, Model model, ItemCarrinho item1) {
    
    	
    ProdutoDAO dao = new ProdutoDAO();
	Produto produtoCompleto = dao.buscaPorId(Integer.valueOf(id));
	
	if(item1.getQuantidade() > produtoCompleto.getQuantidadeDisponivel()) {
		 
		model.addAttribute("erro", "Não possuimos tantos produtos no estoque, escolha uma quantidade menor que "+produtoCompleto.getQuantidadeDisponivel());
		
		model.addAttribute("p", produtoCompleto);

		return "compras/FinalizarCompra";
	}
	
	List<ItemCarrinho> listaCarrinho = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");
	if (listaCarrinho != null) {

	    ItemCarrinho item = new ItemCarrinho();
	    item.setProduto(produtoCompleto);
	    item.setQuantidade(Integer.valueOf(qtd));

	    listaCarrinho.add(item);

	} else {

	    ItemCarrinho item = new ItemCarrinho();
	    item.setProduto(produtoCompleto);
	    item.setQuantidade(Integer.valueOf(qtd));

	    listaCarrinho = new ArrayList<ItemCarrinho>();
	    listaCarrinho.add(item);
	}

	session.setAttribute("listaCarrinho", listaCarrinho);

	return "compras/FinalizarCompra";
    }
	
	
	@RequestMapping("/exibirListaCompras")
	public String exibirListaCompras(Model model, HttpSession session) {
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		
		VendaHibernateDAO dao = new VendaHibernateDAO();
		List<ItemVenda> listaCompras = dao.buscar(usuario.getId());
		model.addAttribute("listaCompras", listaCompras);


		return "compras/listarCompras";
	}
	
	@RequestMapping("/exibirListaVendas")
	public String exibirListaVendas(Model model, HttpSession session) {
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		
		VendaHibernateDAO dao = new VendaHibernateDAO();
		List<ItemVenda> listaVendas = dao.listarVendas(usuario.getId());
		model.addAttribute("listaVendas", listaVendas);


		return "compras/listarVendas";
	}
}
