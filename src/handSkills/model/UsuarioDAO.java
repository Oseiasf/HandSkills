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
}
