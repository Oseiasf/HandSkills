package handSkills.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import handSkills.util.ConnectionFactory;

public class MaterialDoProdutoDAO {

	private Connection connection;
	
	public MaterialDoProdutoDAO() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void CadastrarMaterial(MaterialDoProduto materialDoProduto) {

		String sql = "INSERT INTO MaterialDoProduto (descricao) VALUES (?)";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, materialDoProduto.getDescricao());
			
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public List<MaterialDoProduto> listarMaterialDoProduto() {

		try {
			List<MaterialDoProduto> MaterialDoProduto = new ArrayList<MaterialDoProduto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM MaterialDoProduto");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				MaterialDoProduto MaterialDoProduto1 = new MaterialDoProduto();

				MaterialDoProduto1.setId(rs.getInt("id"));
				MaterialDoProduto1.setDescricao(rs.getString("descricao"));
				

				MaterialDoProduto.add(MaterialDoProduto1);
			}

			rs.close();
			stmt.close();
			connection.close();

			return MaterialDoProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

    public MaterialDoProduto buscarPorId(int id) {

	try {
	    PreparedStatement stmt = connection.prepareStatement("SELECT * FROM MaterialDoProduto WHERE id = ?");
	    stmt.setInt(1, id);
	    ResultSet rs = stmt.executeQuery();

	    MaterialDoProduto materialDoProduto = null;
	    if (rs.next()) {
	    	materialDoProduto = montarObjeto(rs);
	    }

	    rs.close();
	    stmt.close();
	    connection.close();
	    return materialDoProduto;

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }
    
    public void removerMaterial(MaterialDoProduto material) {
    	  String sql = "DELETE FROM MaterialDoProduto where id = ?";
    	  try {
    	   PreparedStatement stmt = connection.prepareStatement(sql);
    	   stmt.setInt(1, material.getId());
    	   stmt.execute();
    	   stmt.close();
    	  } catch (SQLException e) {
    		  e.printStackTrace();
    	   throw new RuntimeException(e);
    	  }
    	 }
   

	public void alterarMaterial(MaterialDoProduto material) {

		String sql = "UPDATE MaterialDoProduto SET descricao = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, material.getDescricao());
			
			stmt.setInt(2, material.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
    
    private MaterialDoProduto montarObjeto(ResultSet rs) throws SQLException {

    	MaterialDoProduto materialDoProduto = new MaterialDoProduto();
    	materialDoProduto.setId(rs.getInt("id"));
    	materialDoProduto.setDescricao(rs.getString("descricao"));

    	return materialDoProduto;
        }
    
	public boolean verificaExisteNomeProduto(String nomeProduto) {

		boolean existe = false;

		try {

			String sql = "SELECT descricao FROM MaterialDoProduto WHERE descricao = ?";
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, nomeProduto);

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
	public List<MaterialDoProduto> pesquisarMaterial(MaterialDoProduto material) {

		try {
			List<MaterialDoProduto> listaMaterial = new ArrayList<MaterialDoProduto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM MaterialDoProduto WHERE descricao LIKE ?");
		   
		       stmt.setString(1, '%' + material.getDescricao() + '%');

		       ResultSet rs = stmt.executeQuery();
		       while (rs.next()) {
		    	   
		    	   MaterialDoProduto MaterialDoProduto1 = new MaterialDoProduto();

					MaterialDoProduto1.setId(rs.getInt("id"));
					MaterialDoProduto1.setDescricao(rs.getString("descricao"));

					listaMaterial.add(MaterialDoProduto1); 
		       }
		       rs.close();
		       return listaMaterial;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
