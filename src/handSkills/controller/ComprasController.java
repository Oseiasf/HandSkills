package handSkills.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.ItemVenda;
import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.model.Usuario;
import handSkills.model.Venda;
import handSkills.model.VendaHibernateDAO;

@Controller
public class ComprasController {
	
	@RequestMapping("/exibirEfetuarCompra")
    public String exibirAdicionarCarrinho(Produto produto, Model model, HttpSession session) {
    
	ProdutoDAO dao = new ProdutoDAO();
	Produto produtoCompleto = dao.buscaPorId(produto.getId());
	model.addAttribute("p", produtoCompleto);

	return "compras/efetuarCompra";
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

	@RequestMapping("/concluirVendaUnica")
    public String concluirVenda(Produto produto, HttpSession session, Model model) {



	    Venda venda = new Venda();
	    venda.setUsuario((Usuario) session.getAttribute("usuarioLogado"));
	    venda.setDataVenda(new Date());



		ItemVenda itemVenda = new ItemVenda();
		itemVenda.setId(produto.getId());
		itemVenda.setQuantidade(produto.getQuantidadeDisponivel());
		itemVenda.setValor(produto.getPrecoVenda());
		itemVenda.setVenda(venda);
		
		
	    

	    

	    VendaHibernateDAO dao = new VendaHibernateDAO();
	    dao.inserir(venda);
	    model.addAttribute("msg", "Compra realizada com sucesso!");


	return "forward:listarProduto";
    }
}
