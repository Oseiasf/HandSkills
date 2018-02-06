package handSkills.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import handSkills.model.Usuario;
import handSkills.model.UsuarioDAO;

@Controller
public class AdmController {

	@RequestMapping("listarUsuarios")
	public String listarUsuarios(Model model) {

		UsuarioDAO dao = new UsuarioDAO();
		List<Usuario> listarUsuario = new ArrayList<Usuario>();
		listarUsuario = dao.listar();
		model.addAttribute("listarUsuario", listarUsuario);

		return "adm/ListarUsuario";
	}

}
