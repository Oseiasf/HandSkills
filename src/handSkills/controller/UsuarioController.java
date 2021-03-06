package handSkills.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.Estado;
import handSkills.model.EstadoHibernateDAO;
import handSkills.model.IndexDAO;
import handSkills.model.Produto;
import handSkills.model.ProdutoDAO;
import handSkills.model.TipoUsuario;
import handSkills.model.Usuario;
import handSkills.model.UsuarioDAO;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirCadastrarUsuario")
	public String exibirCadastrarUsuario(Model model) {

		EstadoHibernateDAO dao = new EstadoHibernateDAO();
		List<Estado> listarEstados = new ArrayList<Estado>();
		listarEstados = dao.listar();
		model.addAttribute("listarEstado", listarEstados);

		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/CadastrarUsuario")
	public String CadastrarUsuario(@Valid Usuario usuario, BindingResult result, HttpSession session, Model model) {

		try {

			if (result.hasErrors()) {
				return "forward:exibirCadastrarUsuario";
			}

			UsuarioDAO dao2 = new UsuarioDAO();

			if (dao2.verificaExisteUsuarioPorEmail(usuario.getEmail())) {
				model.addAttribute("emailExiste", "Email existente, por favor tente outro.");
				return "forward:exibirCadastrarUsuario";
			}

			dao2 = new UsuarioDAO();
			if (dao2.verificaExisteUsuarioPorCpf(usuario.getCpf())) {
				model.addAttribute("cpfExiste", "Cpf existente, por favor tente outro.");
				return "forward:exibirCadastrarUsuario";
			}

			UsuarioDAO dao = new UsuarioDAO();
			dao.CadastrarUsuario(usuario);
		} catch (Exception e) {
			model.addAttribute("mensagem", "Não foi possivél cadastrar o usuario, por favor contate o administrador. Agradecemos a compreensão!");
			return "forward:exibirCadastrarUsuario";
		}

		model.addAttribute("mensagem", "O usuario " + usuario.getNomeCompleto() + " foi cadastrado com sucesso!");
		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/exibirAtualizarUsuario")
	public String exibirAlterarUsuario(Usuario usuario, Model model, HttpSession session) {

		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuarioCompleto = dao.buscaPorId(usuario.getId());
		model.addAttribute("u", usuarioCompleto);

		EstadoHibernateDAO dao2 = new EstadoHibernateDAO();
		List<Estado> listarEstados = new ArrayList<Estado>();
		listarEstados = dao2.listar();
		model.addAttribute("listarEstado", listarEstados);

		return "usuario/AlterarUsuario";
	}

	@RequestMapping("/alterarUsuario")
	public String alterarUsuario(@Valid Usuario usuario, BindingResult result, Model model, HttpSession session) {

		/*if (result.hasErrors()) {
			return "forward:exibirAtualizarUsuario";
		}*/

		UsuarioDAO dao = new UsuarioDAO();
		dao.alterarUsuario(usuario);
		UsuarioDAO dao2 = new UsuarioDAO();
		
		List<Usuario> listarUsuario = new ArrayList<Usuario>();
		listarUsuario = dao2.listar();
		model.addAttribute("listarUsuario", listarUsuario);

		model.addAttribute("mensagem", "Usuario alterado com sucesso!");

		return "forward:exibirAtualizarUsuario";
	}

	@RequestMapping("listarUsuarios")
	public String listarUsuarios(Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");

		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ADM)) {


			return "erros/404";
		}

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
		model.addAttribute("msg", "Usuário removido com sucesso !");

		return "usuario/ListarUsuario";
	}

	@RequestMapping("/pesquisarUsuario")
	public String pesquisarUsuario(Usuario usuario, Model model, HttpSession session) {

		Usuario usuario1 = (Usuario) session.getAttribute("usuarioLogado");

		if (!usuario1.getTipoUsuario().equals(TipoUsuario.ARTESAO)
				&& !usuario1.getTipoUsuario().equals(TipoUsuario.ADM)) {

			

			return "erros/404";
		}
		
		UsuarioDAO dao = new UsuarioDAO();
		List<Usuario> listaUsuario = new ArrayList<Usuario>();
		listaUsuario = dao.pesquisarUsuario(usuario);

		if (usuario.getNomeCompleto() == null || usuario.getNomeCompleto().equals("") || usuario == null) {
			model.addAttribute("msg", "Não existe usuários com esse nome");
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
		return "login";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();

		return "index";
	}

}
