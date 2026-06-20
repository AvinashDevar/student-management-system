package dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import dto.Admin;
import dto.Student;
import jpUtil.JapUtil;


public class Dao  {
	

	
	public void rigister(Student s, int adminId) {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Admin a=em.find(Admin.class, adminId);
		
		et.begin();
		s.setAdmin(a);
		em.persist(s);
		et.commit();
		
		}
	public void saveAdmin(Admin a) {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(a);
		et.commit();	
		
	}
	
	public Admin adminLogin(String aemail, String apassword) {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		List<Admin> a=em.createQuery("select a from Admin a").getResultList();
		for(Admin a1: a) {
			if(a1.getEmail().equals(aemail)&& a1.getPass().equals(apassword)) {
				return a1;
			}
		}
		return null;
	}
	
	public Student studentLogin(String email,String pass) {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		try {
			Query q =em.createQuery( "select s from Student s where s.email = :email and s.pass = :pass");
			q.setParameter("email", email);
			q.setParameter("pass", pass);
			Student s= (Student)q.getSingleResult();
			return s;
		}catch(Exception e) {
			return null;
			
		}
		
		
		
		
		}
	public List<Student> fetchAllStudents() {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		List<Student> s=em.createQuery("select s from Student s").getResultList();
		return s;
	}
	public List<Admin> fetchAllAdmins() {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		List<Admin> a=em.createQuery("select a from Admin a").getResultList();
		return a;
	}
	public void deleteStudent(int sid) {
		EntityManager em=JapUtil.getEmf().createEntityManager();
		EntityTransaction et=em.getTransaction();
		Student s=em.find(Student.class, sid);
		et.begin();
		em.remove(s);
		et.commit();
	}
	


}
