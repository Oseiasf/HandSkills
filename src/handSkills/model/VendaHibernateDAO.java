package handSkills.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class VendaHibernateDAO {

	private static final String PERSISTENCE_UNIT = "handskills";

	public void inserir(Venda venda) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();

		for (ItemVenda item : venda.getListaItens()) {
			manager.persist(item);
		}

		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	
	public List<ItemVenda> buscar(int id){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		TypedQuery<ItemVenda> query = manager.createQuery("from ItemVenda iv where iv.venda.usuario.id = :id)", ItemVenda.class);
		query.setParameter("id", id);
		List<ItemVenda> vendas = query.getResultList();
		
		

		manager.close();
		factory.close();
		
		return vendas;
	}

}
