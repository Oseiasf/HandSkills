package handSkills.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.Usuario;
import handSkills.model.UsuarioDAO;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirCadastrarUsuario")
	public String exibirCadastrarUsuario() {

		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/CadastrarUsuario")
	public String CadastrarUsuario(Usuario usuario, Model model) {

		UsuarioDAO dao = new UsuarioDAO();
		dao.CadastrarUsuario(usuario);

		model.addAttribute("mensagem", "Usuario cadastrado com sucesso!");

		return "index";
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

	@RequestMapping("/pesquisarUsuario")
	public String pesquisarUsuario(Usuario usuario, Model model) {
		UsuarioDAO dao = new UsuarioDAO();
		List<Usuario> pesquisaUsuario = dao.pesquisarUsuario(usuario);
		model.addAttribute("pesquisa", pesquisaUsuario);
		model.addAttribute("nome", usuario.getNomeCompleto());
		model.addAttribute("email", usuario.getEmail());

		return "usuario/pesquisaUsuario";
	}

}
