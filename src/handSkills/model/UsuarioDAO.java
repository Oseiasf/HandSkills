package handSkills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import handSkills.util.ConnectionFactory;

public class UsuarioDAO {

	private Connection connection;

	public UsuarioDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void CadastrarUsuario(Usuario usuario) {

		String sql = "INSERT INTO Usuario  (nome_completo, cpf, rg, email, senha, endereco, bairro, cidade, estado, cep, sexo, tipo_usuario, telefone, whatsapp) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, usuario.getNomeCompleto());
			stmt.setString(2, usuario.getCpf());
			stmt.setString(3, usuario.getRg());
			stmt.setString(4, usuario.getEmail());
			stmt.setString(5, usuario.getSenha());
			stmt.setString(6, usuario.getEndereco());
			stmt.setString(7, usuario.getBairro());
			stmt.setString(8, usuario.getCidade());
			stmt.setString(9, usuario.getEstado());
			stmt.setString(10, usuario.getCep());
			stmt.setString(11, usuario.getSexo());
			stmt.setString(12, usuario.getTipoUsuario().toString());
			stmt.setString(13, usuario.getTelefone());
			stmt.setString(14, usuario.getWhatsapp());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> listar() {

		try {
			List<Usuario> listaUsuario = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Usuario ORDER BY nome_completo");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Usuario usuario = new Usuario();

				usuario = montarObjeto(rs);

				listaUsuario.add(usuario);
			}

			rs.close();
			stmt.close();
			connection.close();

			return listaUsuario;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> pesquisarUsuario(Usuario usuario1) {

		try {
			List<Usuario> listaUsuario = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Usuario WHERE nome_completo LIKE ?");
		   
		       stmt.setString(1, '%' + usuario1.getNomeCompleto() + '%');

		       ResultSet rs = stmt.executeQuery();
		       while (rs.next()) {
		    	  
		    	   Usuario usuario = new Usuario();
		    	   
		    	   usuario = montarObjeto(rs);

		    	   listaUsuario.add(usuario); 
		       }
		       rs.close();
		       return listaUsuario;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterarUsuario(Usuario usuario) {

		String sql = "UPDATE Usuario SET nome_completo = ?, cpf = ?, rg = ?, email = ?, senha = ?, endereco = ?, bairro = ?, cidade = ?, estado = ?, cep = ?, sexo = ?, tipo_usuario = ?, telefone = ?, whatsapp = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, usuario.getNomeCompleto());
			stmt.setString(2, usuario.getCpf());
			stmt.setString(3, usuario.getRg());
			stmt.setString(4, usuario.getEmail());
			stmt.setString(5, usuario.getSenha());
			stmt.setString(6, usuario.getEndereco());
			stmt.setString(7, usuario.getBairro());
			stmt.setString(8, usuario.getCidade());
			stmt.setString(9, usuario.getEstado());
			stmt.setString(10, usuario.getCep());
			stmt.setString(11, usuario.getSexo());
			stmt.setString(12, usuario.getTipoUsuario().toString());
			stmt.setString(13, usuario.getTelefone());
			stmt.setString(14, usuario.getWhatsapp());
			stmt.setInt(15, usuario.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Usuario usuario) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM Usuario WHERE id = ?");
			stmt.setLong(1, usuario.getId());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Usuario buscaPorId(int id) {

		Usuario usuario = new Usuario();

		try {

			String sql = "SELECT * FROM Usuario WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				
				
				usuario = montarObjeto(rs);

			}

			rs.close();
			stmt.close();
			connection.close();

			return usuario;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean verificaExisteUsuarioPorEmail(String email) {

		boolean existe = false;

		try {

			String sql = "SELECT email FROM Usuario WHERE email = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, email);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				
				existe = true;
				break;
								
			}

			rs.close();
			stmt.close();
			connection.close();

			return existe;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	public Usuario buscarUsuario(Usuario usuario) {
		try {
			Usuario usuarioConsultado = null;
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from Usuario where email = ? and senha = ?");
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getSenha());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				usuarioConsultado = montarObjeto(rs);
			}
			rs.close();
			stmt.close();
			return usuarioConsultado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Usuario montarObjeto(ResultSet rs) throws SQLException {

		Usuario usuario = new Usuario();

		usuario.setId(rs.getInt("id"));
		usuario.setNomeCompleto(rs.getString("nome_completo"));
		usuario.setCpf(rs.getString("cpf"));
		usuario.setRg(rs.getString("rg"));
		usuario.setEmail(rs.getString("email"));
		usuario.setSenha(rs.getString("senha"));
		usuario.setEndereco(rs.getString("endereco"));
		usuario.setBairro(rs.getString("bairro"));
		usuario.setCidade(rs.getString("cidade"));
		usuario.setEstado(rs.getString("estado"));
		usuario.setCep(rs.getString("cep"));
		usuario.setSexo(rs.getString("sexo"));
		usuario.setTipoUsuario(TipoUsuario.valueOf(rs.getString("tipo_usuario")));
		usuario.setTelefone(rs.getString("telefone"));
		usuario.setWhatsapp(rs.getString("whatsapp"));

		return usuario;
	}
}
