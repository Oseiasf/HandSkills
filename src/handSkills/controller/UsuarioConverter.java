package handSkills.controller;
import org.springframework.core.convert.converter.Converter;

import handSkills.model.Usuario;
import handSkills.model.UsuarioDAO;

public class UsuarioConverter implements Converter<String, Usuario> {

		public Usuario convert(String id) {

			if (id != null && !id.equals("")) {
				
				UsuarioDAO dao = new UsuarioDAO();
				Usuario usuario = dao.buscaPorId(Integer.valueOf(id));
				
				return usuario;
			} else {
				return null;
			}
		}
	}

