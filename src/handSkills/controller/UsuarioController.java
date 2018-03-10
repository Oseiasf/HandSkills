package handSkills.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.model.Usuario;
import handSkills.model.UsuarioDAO;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirCadastrarUsuario")
	public String exibirCadastrarUsuario() {

		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/CadastrarUsuario")
	public String CadastrarUsuario(Usuario usuario, HttpSession session, Model model) {
		
		try {
			
			UsuarioDAO dao2 = new UsuarioDAO();
			
			if (dao2.verificaExisteUsuarioPorEmail(usuario.getEmail())) {
				model.addAttribute("emailExiste", "Email existente, por favor tente outro.");
				return "forward:exibirCadastrarUsuario";
			}
			if (dao2.verificaExisteUsuarioPorCpf(usuario.getCpf())) {
				model.addAttribute("cpflExiste", "Cpf existente, por favor tente outro.");
				return "forward:exibirCadastrarUsuario";
			}
			
			
			UsuarioDAO dao = new UsuarioDAO();
			dao.CadastrarUsuario(usuario);
		} catch (Exception e) {
			model.addAttribute("mensagem", "Não foi possivél cadastrar o usuario, contate o Administrador!");
			return "forward:exibirCadastrarUsuario";
		}
		
		model.addAttribute("mensagem", "O usuario " + usuario.getNomeCompleto() + " foi cadastrado com sucesso!");
		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/exibirAtualizarUsuario")
	public String exibirAlterarUsuario(Usuario usuario, Model model) {

		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuarioCompleto = dao.buscaPorId(usuario.getId());
		model.addAttribute("u", usuarioCompleto);

		return "usuario/AlterarUsuario";
	}

	@RequestMapping("/alterarUsuario")
	public String alterarUsuario(Usuario usuario, Model model) {

		UsuarioDAO dao = new UsuarioDAO();
		dao.alterarUsuario(usuario);
		UsuarioDAO dao2 = new UsuarioDAO();
		List<Usuario> listarUsuario = new ArrayList<Usuario>();
		listarUsuario = dao2.listar();
		model.addAttribute("listarUsuario", listarUsuario);

		return "usuario/ListarUsuario";
	}

	@RequestMapping("listarUsuarios")
	public String listarUsuarios(Model model) {
		UsuarioDAO dao = new UsuarioDAO();
		List<Usuario> listarUsuario = new ArrayList<Usuario>();
		listarUsuario = dao.listar();
		model.addAttribute("listarUsuario", listarUsuario);

		return "usuario/ListarUsuario";
	}
	
	@RequestMapping("removerUsuario")
	public String removerUsuario(Usuario usuario, Model model) {

		UsuarioDAO dao = new UsuarioDAO();
		dao.remover(usuario);
		model.addAttribute("msg", "Usuário Removido com Sucesso !");

		return "usuario/ListarUsuario";
	}
	
	@RequestMapping("/pesquisarUsuario")
	public String pesquisarUsuario(Usuario usuario, Model model) {
		UsuarioDAO dao = new UsuarioDAO();
		List<Usuario> listaUsuario = new ArrayList<Usuario>();
		listaUsuario = dao.pesquisarUsuario(usuario);
		 
		if (usuario.getNomeCompleto() == null || usuario.getNomeCompleto().equals("") || usuario == null) {
			 model.addAttribute("msg" , "Não existe usuários com esse nome"); 
			 return "usuario/pesquisaUsuario";
		 }
		  model.addAttribute("listaUsuario", listaUsuario);
		  return "usuario/pesquisaUsuario";
	}

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuarioLogado = dao.buscarUsuario(usuario);
		if (usuarioLogado != null) {
			session.setAttribute("usuarioLogado", usuarioLogado);
			
			ProdutoDAO dao2 = new ProdutoDAO();
			List<Produto> listaProduto = dao2.listar();
			model.addAttribute("listaProduto", listaProduto);
			
			return "index";
		}
		model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
		return "index";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
	session.invalidate();
	
	ProdutoDAO dao = new ProdutoDAO();
	List<Produto> listaProduto = dao.listar();
	model.addAttribute("listaProduto", listaProduto);
	
	return "index";
	}

}
