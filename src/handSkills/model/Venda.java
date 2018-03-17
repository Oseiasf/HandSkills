package handSkills.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Venda")
public class Venda {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
    @JoinColumn(name = "id_usuario")
    private Usuario usuario;
	@Column(name = "dt_venda")
    private Date dataVenda;
	@Column(name = "valor_total")
    private double valorTotal;
	@OneToMany(mappedBy = "venda", cascade = CascadeType.ALL)
    private List<ItemVenda> listaItens;

    public List<ItemVenda> getListaItens() {
	return listaItens;
    }

    public void setListaItens(List<ItemVenda> listaItens) {
	this.listaItens = listaItens;
    }

    public double getValorTotal() {
	return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
	this.valorTotal = valorTotal;
    }

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public Usuario getUsuario() {
	return usuario;
    }

    public void setUsuario(Usuario usuario) {
	this.usuario = usuario;
    }

    public Date getDataVenda() {
	return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
	this.dataVenda = dataVenda;
    }

}
