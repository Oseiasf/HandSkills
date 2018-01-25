package handSkills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import handSkills.util.ConnectionFactory;

public class ProdutoDAO {

	private Connection connection;

	public ProdutoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void CadastrarProduto(Produto produto) {

		String sql = "INSERT INTO Produto (codigo, nomeProduto, localOrigemProduto, coresDisponiveis," +
		"materialFeito, precoVenda, quantidadeDisponivel, imagem) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getCodigo());
			stmt.setString(2, produto.getNomeProduto());
			stmt.setString(3, produto.getLocalOrigemProduto());
			stmt.setString(4, produto.getCoresDisponiveis());
			stmt.setString(5, produto.getMaterialFeito()); 
			stmt.setDouble(6, produto.getPrecoVenda());
			stmt.setInt(7, produto.getQuantidadeDisponivel());
			stmt.setString(8, produto.getImagem());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listar() {

		try {
			List<Produto> listaProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Produto ORDER BY nomeProduto");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();

				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setLocalOrigemProduto(rs.getString("localOrigemProduto"));
				produto.setCoresDisponiveis(rs.getString("coresDisponiveis"));
				produto.setMaterialFeito(rs.getString("materialFeito"));
				produto.setPrecoVenda(rs.getDouble("precoVenda"));
				produto.setQuantidadeDisponivel(rs.getInt("quantidadeDisponivel"));
				produto.setImagem(rs.getString("imagem"));

				listaProduto.add(produto);
			}

			rs.close();
			stmt.close();
			connection.close();

			return listaProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Produto produto) {

		String sql = "DELETE FROM Produto WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, produto.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterarProduto(Produto produto) {

		String sql = "UPDATE Produto SET codigo = ?, nomeProduto = ?, localOrigemProduto = ?, coresDisponiveis = ?, materialFeito = ?, precoVenda = ?, quantidadeDisponivel = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			
			stmt.setString(1, produto.getCodigo());
			stmt.setString(2, produto.getNomeProduto());
			stmt.setString(3, produto.getLocalOrigemProduto());
			stmt.setString(4, produto.getCoresDisponiveis());
			stmt.setString(5, produto.getMaterialFeito()); 
			stmt.setDouble(6, produto.getPrecoVenda());
			stmt.setInt(7, produto.getQuantidadeDisponivel());
			stmt.setInt(8, produto.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Produto buscaPorId(int id) {

		Produto produto = new Produto();

		try {

			String sql = "SELECT * FROM Produto WHERE id = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setLocalOrigemProduto(rs.getString("localOrigemProduto"));
				produto.setCoresDisponiveis(rs.getString("coresDisponiveis"));
				produto.setMaterialFeito(rs.getString("materialFeito"));
				produto.setPrecoVenda(rs.getDouble("precoVenda"));
				produto.setQuantidadeDisponivel(rs.getInt("quantidadeDisponivel"));
				produto.setImagem(rs.getString("imagem"));

			}

			rs.close();
			stmt.close();
			connection.close();

			return produto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
