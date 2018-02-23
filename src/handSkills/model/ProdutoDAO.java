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

		String sql = "INSERT INTO Produto (nomeProduto, localOrigemProduto, coresDisponiveis, materialDoProduto, precoVenda, quantidadeDisponivel, imagem) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNomeProduto());
			stmt.setString(2, produto.getLocalOrigemProduto());
			stmt.setString(3, produto.getCoresDisponiveis());
			stmt.setInt(4, produto.getMaterialDoProduto().getId());
			stmt.setDouble(5, produto.getPrecoVenda());
			stmt.setInt(6, produto.getQuantidadeDisponivel());
			stmt.setString(7, produto.getImagem());

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

				int idMaterialDoProduto = rs.getInt("id");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);

				produto.setId(rs.getInt("id"));
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setLocalOrigemProduto(rs.getString("localOrigemProduto"));
				produto.setCoresDisponiveis(rs.getString("coresDisponiveis"));
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

	public List<Produto> listarIndex() {

		try {
			List<Produto> listaProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Produto ORDER BY nomeProduto");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();
				
				
				produto.setId(rs.getInt("id"));
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setLocalOrigemProduto(rs.getString("localOrigemProduto"));
				produto.setCoresDisponiveis(rs.getString("coresDisponiveis"));

				int idMaterialDoProduto = rs.getInt("id");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);
				
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

		String sql = "UPDATE Produto SET nomeProduto = ?, localOrigemProduto = ?, coresDisponiveis = ?, materialDoProduto = ?, precoVenda = ?, quantidadeDisponivel = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNomeProduto());
			stmt.setString(2, produto.getLocalOrigemProduto());
			stmt.setString(3, produto.getCoresDisponiveis());
			stmt.setInt(4, produto.getMaterialDoProduto().getId());
			stmt.setDouble(5, produto.getPrecoVenda());
			stmt.setInt(6, produto.getQuantidadeDisponivel());
			stmt.setInt(7, produto.getId());

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
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setLocalOrigemProduto(rs.getString("localOrigemProduto"));
				produto.setCoresDisponiveis(rs.getString("coresDisponiveis"));
				
				int idMaterialDoProduto = rs.getInt("id");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);
				
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

	public List<Produto> pesquisar(Produto prod) {

		try {
			List<Produto> p = new ArrayList<Produto>();
			String sql = "";
			PreparedStatement stmt = null;

			if ((prod.getNomeProduto() != null && !prod.getNomeProduto().equals(""))
					&& (prod.getLocalOrigemProduto() == null || prod.getLocalOrigemProduto().equals(""))) {

				sql = "SELECT * FROM Produto WHERE nomeProduto LIKE ?";
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, "%" + prod.getNomeProduto() + "%");

			} else if ((prod.getLocalOrigemProduto() != null && !prod.getLocalOrigemProduto().equals(""))
					&& (prod.getNomeProduto() == null || prod.getNomeProduto().equals(""))) {

				sql = "SELECT * FROM Produto WHERE localOrigemProduto LIKE ?";
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, "%" + prod.getLocalOrigemProduto() + "%");

			} else if ((prod.getNomeProduto() != null && !prod.getNomeProduto().equals(""))
					&& (prod.getLocalOrigemProduto() != null && !prod.getLocalOrigemProduto().equals(""))) {

				sql = "SELECT * FROM Produto WHERE nomeProduto LIKE ? AND localOrigemProduto LIKE ?";
				stmt = connection.prepareStatement(sql);
				stmt.setString(2, "%" + prod.getLocalOrigemProduto() + "%");
				stmt.setString(1, "%" + prod.getNomeProduto() + "%");

			} else {

				sql = "SELECT * FROM Produto";
				stmt = connection.prepareStatement(sql);
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();

				produto.setId(rs.getInt("id"));
				produto.setNomeProduto(rs.getString("nomeProduto"));
				produto.setLocalOrigemProduto(rs.getString("localOrigemProduto"));
				produto.setCoresDisponiveis(rs.getString("coresDisponiveis"));
				
				int idMaterialDoProduto = rs.getInt("id");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);
				
				produto.setPrecoVenda(rs.getDouble("precoVenda"));
				produto.setQuantidadeDisponivel(rs.getInt("quantidadeDisponivel"));
				produto.setImagem(rs.getString("imagem"));

				p.add(produto);
			}

			rs.close();
			stmt.close();
			connection.close();

			return p;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

}
