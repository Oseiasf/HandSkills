package handSkills.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EstadoHibernateDAO {

	private static final String PERSISTENCE_UNIT = "handskills";

	public List<Estado> listar() {

		List<Estado> lista = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		lista = manager.createQuery("SELECT e FROM Estado e ORDER BY e.Nome").getResultList();
		manager.close();
		factory.close();

		return lista;
	}
}
