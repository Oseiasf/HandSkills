package handSkills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import handSkills.util.ConnectionFactory;

public class IndexDAO {
	private Connection connection;

	public IndexDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
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

}
