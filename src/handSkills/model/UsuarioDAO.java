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

		String sql = "INSERT INTO Usuario  (nomeCompleto, cpf, rg, email, senha, endereco, bairro, cidade, estado, cep, sexo, tipoUsuario, telefone, whatsapp) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			stmt.setString(12, usuario.getTipoUsuario());
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
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Usuario ORDER BY nomeCompleto");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Usuario usuario = new Usuario();

				usuario.setId(rs.getInt("id"));
				usuario.setNomeCompleto(rs.getString("nomeCompleto"));
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
				usuario.setTipoUsuario(rs.getString("tipoUsuario"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setWhatsapp(rs.getString("whatsapp"));

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

	public List<Usuario> pesquisarUsuario(Usuario usuario) {

		try {
			List<Usuario> usu = new ArrayList<Usuario>();
			String sql = "";
			PreparedStatement stmt = null;

			if ((usuario.getNomeCompleto() != null && !usuario.getNomeCompleto().equals(""))) {

				sql = "SELECT id, nomeCompleto, email, telefone, whatsapp, tipoUsuario FROM Usuario WHERE nomeCompleto LIKE ?";
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, "%" + usuario.getNomeCompleto() + "%");

			} else {

				sql = "SELECT * FROM Usuario";
				stmt = connection.prepareStatement(sql);
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Usuario usuario1 = new Usuario();

				usuario1.setId(rs.getInt("id"));
				usuario1.setNomeCompleto(rs.getString("nomeCompleto"));
				usuario1.setEmail(rs.getString("email"));
				usuario1.setTelefone(rs.getString("telefone"));
				usuario1.setWhatsapp(rs.getString("whatsapp"));
				usuario1.setTipoUsuario(rs.getString("tipoUsuario"));

				usu.add(usuario1);
			}

			rs.close();
			stmt.close();
			connection.close();

			return usu;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void alterarUsuario(Usuario usuario) {

		String sql = "UPDATE Usuario SET nomeCompleto = ?, cpf = ?, rg = ?, email = ?, senha = ?, endereco = ?, bairro = ?, cidade = ?, estado = ?, cep = ?, sexo = ?, tipoUsuario = ?, telefone = ?, whatsapp = ? WHERE id = ?";
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
			stmt.setString(12, usuario.getTipoUsuario());
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

				usuario.setId(rs.getInt("id"));
				usuario.setNomeCompleto(rs.getString("nomeCompleto"));
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
				usuario.setTipoUsuario(rs.getString("tipoUsuario"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setWhatsapp(rs.getString("whatsapp"));

			}

			rs.close();
			stmt.close();
			connection.close();

			return usuario;

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
		usuario.setNomeCompleto(rs.getString("nomeCompleto"));
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
		usuario.setTipoUsuario(rs.getString("tipoUsuario"));
		usuario.setTelefone(rs.getString("telefone"));
		usuario.setWhatsapp(rs.getString("whatsapp"));

		return usuario;
	}
}
