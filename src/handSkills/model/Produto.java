package handSkills.model;


public class Produto {
	
	private int id;
	private	String nomeProduto;
	private	String localOrigemProduto;
	private	String coresDisponiveis;
	private	String materialDoProduto;
	private double precoVenda;
	private int quantidadeDisponivel;
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
	public String getMaterialDoProduto() {
		return materialDoProduto;
	}
	public void setMaterialDoProduto(String materialDoProduto) {
		this.materialDoProduto = materialDoProduto;
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
