package handSkills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import handSkills.util.ConnectionFactory;

public class ArtesaoDAO {
	private Connection connection;

	public ArtesaoDAO() {
	try {
	this.connection = new ConnectionFactory().getConnection();
	} catch (SQLException e) {
	throw new RuntimeException(e);
	}
	}

	public void incluir(Cliente cliente) {
		try {
			String sql = "INSERT INTO artesao (nome_completo,cpf , rg, cidade,bairro, cep, email, senha, telefone) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, cliente.getNomeCompleto());
			stmt.setString(2, cliente.getCpf());
			stmt.setString(3, cliente.getRg());
			stmt.setString(4, cliente.getCidade());
			stmt.setString(5, cliente.getBairro());
			stmt.setString(6, cliente.getCep());
			stmt.setString(7, cliente.getEmail());
			stmt.setString(8, cliente.getSenha());
			stmt.setString(9, cliente.getTelefone());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
