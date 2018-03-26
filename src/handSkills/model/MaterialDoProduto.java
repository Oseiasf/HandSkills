package handSkills.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "MaterialDoProduto")
public class MaterialDoProduto {
	
	@Id
	private int id;
	
	@NotEmpty(message="O nome do mateiral dp produto deve ser preenchido")
	@Column(name= "descricao")
	private String Descricao;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescricao() {
		return Descricao;
	}
	public void setDescricao(String descricao) {
		Descricao = descricao;
	}
	
}
