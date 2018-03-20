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
	
	public List<Produto> listar() {

		try {
			List<Produto> listaProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Produto ORDER BY nome_produto limit 4");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();

				int idMaterialDoProduto = rs.getInt("material_produto");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);
				
				
				int idUsuario = rs.getInt("id_usu_artesao");
				UsuarioDAO dao2 = new UsuarioDAO();
				Usuario mdp2 = dao2.buscaPorId(idUsuario);
				produto.setUsuarioArtesao(mdp2);

				produto.setId(rs.getInt("id"));
				produto.setNomeProduto(rs.getString("nome_produto"));
				produto.setLocalOrigemProduto(rs.getString("local_origem_produto"));
				produto.setCoresDisponiveis(rs.getString("cores_disponiveis"));
				produto.setPrecoVenda(rs.getDouble("preco_venda"));
				produto.setQuantidadeDisponivel(rs.getInt("quantidade_disponivel"));
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
