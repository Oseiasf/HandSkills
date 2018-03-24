package handSkills.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "Usuario")
public class Usuario {
	
	@Id
	private int id;
	
	@NotEmpty(message="O nome deve ser preenchido")
	@Size(min = 8, max = 50, message="O nome deve deve ter um tamanho de 5 caracteres, no mínimo e no máximo 50.")
	@Column(name= "nome_completo")
	private String nomeCompleto;
	
	@NotEmpty(message="O cpf deve ser preenchido")
	@Size(max = 14, message="O CPF deve conter, no mínimo, 14 caracteres.")
	@Column
	private	String cpf;
	
	@NotEmpty(message="O RG deve ser preenchido")
	@Size(min = 6, max = 15, message="O RG deve conter 6 caracteres, no mínimo e no máximo 15.")
	@Column
	private String rg;
	
	@NotEmpty(message="O email deve ser preenchido")
	@Size(max = 50, message="O Email deve conter no máximo 50 caracteres.")
	@Column
	private String email;
	
	@NotEmpty(message="A senha deve ser preenchido")
	@Size(min = 8, max = 100, message="A senha deve conter no mínimo 8 caracteres.")
	@Column
	private String senha;
	
	@Column
	private String endereco;
	
	@Column
	private String bairro;
	
	@Column
	private String cidade;

	@Column
	private String estado;
	
	@NotEmpty(message="O CEP deve ser preenchido")
	@Size(min = 8, max = 20, message="O CEP deve conter no mínimo 8 caracteres e no máximo 20.")
	@Column
	private String cep;
	
	@Column
	private String sexo;
	
	@NotEmpty(message="O telefone deve ser preenchido")
	@Size(min = 8, max = 50, message="O telefone deve conter, no mínimo 8 caracteres e no máximo 50")
	@Column
	private String telefone;
	
	@NotEmpty(message="O whatsapp deve ser preenchido")
	@Size(min = 8, max = 50, message="O whatsapp deve conter no mínimo 8 caracteres e no máximo 50")
	@Column
	private String whatsapp;
	
	@Enumerated
	private TipoUsuario tipoUsuario;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getWhatsapp() {
		return whatsapp;
	}
	public void setWhatsapp(String whatsapp) {
		this.whatsapp = whatsapp;
	}
	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	public void setTipoUsuarioStr(String tipo) {
		this.tipoUsuario = TipoUsuario.valueOf(tipo);
	}
	
	
}
