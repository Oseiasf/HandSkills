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

	public void CadastrarProduto(Produto produto, Usuario id) {

		String sql = "INSERT INTO Produto (id_usu_artesao, nome_produto, local_origem_produto, cores_disponiveis, material_produto, preco_venda, quantidade_disponivel, imagem) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, id.getId());
			stmt.setString(2, produto.getNomeProduto());
			stmt.setString(3, produto.getLocalOrigemProduto());
			stmt.setString(4, produto.getCoresDisponiveis());
			stmt.setInt(5, produto.getMaterialDoProduto().getId());
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
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Produto ORDER BY nome_produto");

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
	
	public List<Produto> listarMeusProdutos(Usuario id) {

		try {
			List<Produto> listaProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM Produto as p join Usuario as u on  (u.id = p.id_usu_artesao) where u.id = ? ORDER BY nome_produto;");
			
			
			stmt.setInt(1, id.getId());
			
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


	public void atualizarId(int id) {
		  String sql = "update Produto set material_produto = null where id =?";
		  try {
		   PreparedStatement stmt = connection.prepareStatement(sql);
		   stmt.setInt(1, id);
		   stmt.execute();
		   stmt.close();
		  } catch (SQLException e) {
			  e.printStackTrace();
		   throw new RuntimeException(e);
		  }
		 }
	
	public void remover(Produto produto) {
		  String sql = "delete from Produto where id =?";
		  try {
		   PreparedStatement stmt = connection.prepareStatement(sql);
		   stmt.setInt(1, produto.getId());
		   stmt.execute();
		   stmt.close();
		  } catch (SQLException e) {
			  e.printStackTrace();
		   throw new RuntimeException(e);
		  }
		 }

	public void alterarProduto(Produto produto) {

		String sql = "UPDATE Produto SET nome_produto = ?, local_origem_produto = ?, cores_disponiveis = ?, material_produto = ?, preco_venda = ?, quantidade_disponivel = ? WHERE id = ?";
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
	public Produto buscaPorIdProduto(int id) {

		Produto produto = new Produto();

		try {

			String sql = "select material_produto from Produto where material_produto = (select id from MaterialDoProduto where id = ?);";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				produto.setId(rs.getInt("id"));

			}

			rs.close();
			stmt.close();
			connection.close();

			return produto;

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
				produto.setNomeProduto(rs.getString("nome_produto"));
				produto.setLocalOrigemProduto(rs.getString("local_origem_produto"));
				produto.setCoresDisponiveis(rs.getString("cores_disponiveis"));
				
				int idMaterialDoProduto = rs.getInt("material_produto");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);
				
				int idUsuario = rs.getInt("id_usu_artesao");
				UsuarioDAO dao2 = new UsuarioDAO();
				Usuario mdp2 = dao2.buscaPorId(idUsuario);
				produto.setUsuarioArtesao(mdp2);
				
				produto.setPrecoVenda(rs.getDouble("preco_venda"));
				produto.setQuantidadeDisponivel(rs.getInt("quantidade_disponivel"));
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

	public List<Produto> pesquisarProduto(Produto prod) {

		try {
			List<Produto> p = new ArrayList<Produto>();
			String sql = "";
			PreparedStatement stmt = null;

			if ((prod.getNomeProduto() != null && !prod.getNomeProduto().equals(""))
					&& (prod.getLocalOrigemProduto() == null || prod.getLocalOrigemProduto().equals(""))) {

				sql = "SELECT * FROM Produto WHERE nome_produto LIKE ?";
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, "%" + prod.getNomeProduto() + "%");

			} else if ((prod.getLocalOrigemProduto() != null && !prod.getLocalOrigemProduto().equals(""))
					&& (prod.getNomeProduto() == null || prod.getNomeProduto().equals(""))) {

				sql = "SELECT * FROM Produto WHERE local_origem_produto LIKE ?";
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, "%" + prod.getLocalOrigemProduto() + "%");

			} else if ((prod.getNomeProduto() != null && !prod.getNomeProduto().equals(""))
					&& (prod.getLocalOrigemProduto() != null && !prod.getLocalOrigemProduto().equals(""))) {

				sql = "SELECT * FROM Produto WHERE nome_produto LIKE ? AND local_origem_produto LIKE ?";
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
				produto.setNomeProduto(rs.getString("nome_produto"));
				produto.setLocalOrigemProduto(rs.getString("local_origem_produto"));
				produto.setCoresDisponiveis(rs.getString("cores_disponiveis"));
				
				int idMaterialDoProduto = rs.getInt("id");
				MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
				MaterialDoProduto mdp = dao.buscarPorId(idMaterialDoProduto);
				produto.setMaterialDoProduto(mdp);
				
				int idUsuario = rs.getInt("id_usu_artesao");
				UsuarioDAO dao2 = new UsuarioDAO();
				Usuario mdp2 = dao2.buscaPorId(idUsuario);
				produto.setUsuarioArtesao(mdp2);
				
				produto.setPrecoVenda(rs.getDouble("preco_venda"));
				produto.setQuantidadeDisponivel(rs.getInt("quantidade_disponivel"));
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
