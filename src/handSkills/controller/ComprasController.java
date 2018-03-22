package handSkills.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.ItemVenda;
import handSkills.model.Usuario;
import handSkills.model.VendaHibernateDAO;

@Controller
public class ComprasController {
	
	@RequestMapping("/exibirListaCompras")
	public String exibirListaCompras(Model model, HttpSession session) {
		
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		
		VendaHibernateDAO dao = new VendaHibernateDAO();
		List<ItemVenda> listaCompras = dao.buscar(usuario.getId());
		model.addAttribute("listaCompras", listaCompras);


		return "compras/listarCompras";
	}
}
