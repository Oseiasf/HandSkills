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
public class CarrinhoController {

    @RequestMapping("/exibirAdicionarCarrinho")
    public String exibirAdicionarCarrinho(Produto produto, Model model, HttpSession session) {
    
	ProdutoDAO dao = new ProdutoDAO();
	Produto produtoCompleto = dao.buscaPorId(produto.getId());
	model.addAttribute("p", produtoCompleto);

	return "produto/adicionarCarrinho";
    }
    
    @RequestMapping("/adicionarAoCarrinho")
    public String adicionarAoCarrinho(@RequestParam("id") String id, @RequestParam("quantidade") String qtd, HttpSession session, Model model, ItemCarrinho item1) {
    
    	
    ProdutoDAO dao = new ProdutoDAO();
	Produto produtoCompleto = dao.buscaPorId(Integer.valueOf(id));
	if(item1.getQuantidade() > produtoCompleto.getQuantidadeDisponivel()) {
		 
		model.addAttribute("erro", "Não possuimos tantos produtos no estoque, escolha uma quantidade menor que "+produtoCompleto.getQuantidadeDisponivel());
		
		return "forward:exibirAdicionarCarrinho";
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

	model.addAttribute("msg", "Produto Adicionado ao Carrinho!");
	return "forward:listarProduto";
    }

    @RequestMapping("/exibirCarrinho")
    public String exibirCarrinho(HttpSession session, Model model) {
		
	
	List<ItemCarrinho> listaCarrinho = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");

	if (listaCarrinho != null) {

	    double valorTotal = 0;

	    for (ItemCarrinho item : listaCarrinho) {
		valorTotal = valorTotal + (item.getProduto().getPrecoVenda() * item.getQuantidade());
	    }

	    model.addAttribute("valorTotal", valorTotal);
	}

	return "produto/listarCarrinho";
    }
    
    @RequestMapping("/concluirVenda")
    public String concluirVenda(HttpSession session, Model model) {

	List<ItemCarrinho> listaCarrinho = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");

	if (listaCarrinho != null) {

	    Venda venda = new Venda();
	    venda.setUsuario((Usuario) session.getAttribute("usuarioLogado"));
	    venda.setDataVenda(new Date());

	    List<ItemVenda> itensVenda = new ArrayList<ItemVenda>();
	    for (ItemCarrinho itemCarrinho : listaCarrinho) {

		venda.setValorTotal(venda.getValorTotal() + (itemCarrinho.getProduto().getPrecoVenda() * itemCarrinho.getQuantidade()));

		ItemVenda itemVenda = new ItemVenda();
		itemVenda.setProduto(itemCarrinho.getProduto());
		itemVenda.setQuantidade(itemCarrinho.getQuantidade());
		itemVenda.setValor(itemCarrinho.getProduto().getPrecoVenda());
		itemVenda.setVenda(venda);
		itensVenda.add(itemVenda);
	    }

	    venda.setListaItens(itensVenda);

	    VendaHibernateDAO dao = new VendaHibernateDAO();
	    dao.inserir(venda);
	    model.addAttribute("msg", "Compra realizada com sucesso!");
	    session.removeAttribute("listaCarrinho");

	} else {

	    model.addAttribute("msg", "Não há itens adicionados ao carrinho");
	}

	return "forward:listarProduto";
    }
    
    @RequestMapping("/removerItemCarrinho")
    public String removerItemCarrinho( Model model, HttpSession session) {
    	
    	List<ItemCarrinho> lista = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");
    	ItemCarrinho remove = new ItemCarrinho();
    	lista.remove(remove);
    	
    	model.addAttribute("listaCarrinho", lista);
    	model.addAttribute("carrinho", "Produto retirado do carrinho");

	return "forward:exibirCarrinho";
    }
}
