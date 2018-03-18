package handSkills.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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

}
