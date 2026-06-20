package jpUtil;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JapUtil {
	
	private static EntityManagerFactory emf=Persistence.createEntityManagerFactory("avinash");
	
	public static EntityManagerFactory getEmf() {
		return emf;
	}

}
