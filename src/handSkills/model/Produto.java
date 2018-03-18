package handSkills.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Produto")
public class Produto {
	
	@Id
	private int id;
	
	@ManyToOne
    @JoinColumn(name = "id_usu_artesao")
	private Usuario usuarioArtesao;
	
	@Column(name = "nome_produto")
	private	String nomeProduto;
	
	@Column(name = "local_origem_produto")
	private	String localOrigemProduto;
	
	@Column(name = "cores_disponiveis")
	private	String coresDisponiveis;
	
	@ManyToOne
    @JoinColumn(name = "material_produto")
	private	MaterialDoProduto materialDoProduto;
	
	@Column(name = "preco_venda")
	private double precoVenda;
	
	@Column(name = "quantidade_disponivel")
	private int quantidadeDisponivel;
	
	@Column
	private String imagem;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public String getLocalOrigemProduto() {
		return localOrigemProduto;
	}
	public void setLocalOrigemProduto(String localOrigemProduto) {
		this.localOrigemProduto = localOrigemProduto;
	}
	public String getCoresDisponiveis() {
		return coresDisponiveis;
	}
	public void setCoresDisponiveis(String coresDisponiveis) {
		this.coresDisponiveis = coresDisponiveis;
	}
	public double getPrecoVenda() {
		return precoVenda;
	}
	public void setPrecoVenda(double precoVenda) {
		this.precoVenda = precoVenda;
	}
	
	public int getQuantidadeDisponivel() {
		return quantidadeDisponivel;
	}
	public void setQuantidadeDisponivel(int quantidade) {
		this.quantidadeDisponivel = quantidade;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	public MaterialDoProduto getMaterialDoProduto() {
		return materialDoProduto;
	}
	public void setMaterialDoProduto(MaterialDoProduto materialDoProduto) {
		this.materialDoProduto = materialDoProduto;
	}
	public Usuario getUsuarioArtesao() {
		return usuarioArtesao;
	}
	public void setUsuarioArtesao(Usuario usuarioArtesao) {
		this.usuarioArtesao = usuarioArtesao;
	}
		
}
