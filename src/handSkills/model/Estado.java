package handSkills.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Estado")
public class Estado {
	
	@Id
	private int Id;
	@Column
	private int CodigoUf;
	@Column
	private String Nome;
	@Column
	private String Uf;
	@Column
	private int Regiao;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		this.Id = id;
	}
	public int getCodigoUf() {
		return CodigoUf;
	}
	public void setCodigoUf(int codigoUf) {
		this.CodigoUf = codigoUf;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		this.Nome = nome;
	}
	public String getUf() {
		return Uf;
	}
	public void setUf(String uf) {
		this.Uf = uf;
	}
	public int getRegiao() {
		return Regiao;
	}
	public void setRegiao(int regiao) {
		this.Regiao = regiao;
	}

}
