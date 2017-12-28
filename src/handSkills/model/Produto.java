package handSkills.model;


public class Produto {
	
	private int id;
	private String codigo;
	private	String nomeProduto;
	private	String localOrigemProduto;
	private	String coresDisponiveis;
	private	String materialFeito;
	private double precoVenda;
	private int quantidadeDisponivel;
	private String imagem;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
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
	public String getMaterialFeito() {
		return materialFeito;
	}
	public void setMaterialFeito(String materialFeito) {
		this.materialFeito = materialFeito;
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
		
}
