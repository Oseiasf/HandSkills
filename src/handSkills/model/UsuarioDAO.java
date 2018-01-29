package handSkills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

		String sql = "INSERT INTO Usuario  (nomeCompleto, cpf, rg, email, senha, endereco, bairro, cidade, estado, cep, sexo, tipoUsuario, telefone, whatapp) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			stmt.setString(14, usuario.getWhatapp());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
