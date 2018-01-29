package handSkills.controller;

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

		return "usuario/cadastrarUsuario";
	}

}
