package com.nagarro.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nagarro.entities.User;

@Repository
public class LoginDAO {

	@RequestMapping("/users")
	public boolean checkUser(String userId, String password) {

		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class)
				.buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		@SuppressWarnings("rawtypes")
		Query searchQuery = session.createQuery("from User where userId=:userId AND password=:password");
		searchQuery.setParameter("userId", userId);
		searchQuery.setParameter("password", password);
		User user = (User) searchQuery.uniqueResult();
		if (user != null) {
			session.getTransaction().commit();
			session.close();
			return true;
		}
		session.getTransaction().commit();
		session.close();
		return false;
	}

}
