package handSkills.controller;

import org.springframework.core.convert.converter.Converter;

import handSkills.model.MaterialDoProduto;
import handSkills.model.MaterialDoProdutoDAO;

public class MaterialDoProdutoConverter implements Converter<String, MaterialDoProduto> {

	public MaterialDoProduto convert(String id) {

		if (id != null && !id.equals("")) {
			
			MaterialDoProdutoDAO dao = new MaterialDoProdutoDAO();
			MaterialDoProduto MaterialDoProduto = dao.buscarPorId(Integer.valueOf(id));
			
			return MaterialDoProduto;
		} else {
			return null;
		}
	}
}