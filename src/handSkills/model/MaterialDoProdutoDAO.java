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

    private MaterialDoProduto montarObjeto(ResultSet rs) throws SQLException {

    	MaterialDoProduto materialDoProduto = new MaterialDoProduto();
    	materialDoProduto.setId(rs.getInt("id"));
    	materialDoProduto.setDescricao(rs.getString("descricao"));

    	return materialDoProduto;
        }
}
