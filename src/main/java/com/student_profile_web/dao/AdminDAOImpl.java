package com.student_profile_web.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.student_profile_web.entity.Admin;
import com.student_profile_web.entity.Authority;
import com.student_profile_web.entity.Student;


@Repository
public class AdminDAOImpl implements AdminDAO{

	// need to inject the session factory
	@Autowired @Qualifier("admin-sessionFactory")
	private SessionFactory sessionFactory;	

	@Override
	public void saveAdmin(Admin admin) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Authority authority = new Authority(admin.getUsername(),admin.getEnabled() == 2 ? "ROLE_STUDENT" : "ROLE_ADMIN");
		
		admin.setEnabled(1);
		admin.setPassword("{noop}"+admin.getPassword());
		admin.getRoles().add(authority);
		// save/update the customer
		currentSession.saveOrUpdate(admin);
		
	}
	
	@Override
	public List<Admin> getAdminUsers() {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Admin> query = 
				currentSession.createQuery("from users",
											Admin.class);
		
		// execute query and get result list
		List<Admin> users = query.getResultList();
				
		// return the results		
		return users;
	}

	@Override
	public Admin getAdmin(String username) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// now retrieve/read from database using the primary key
		Admin user = currentSession.get(Admin.class, username);
				
		return user;
	}
	
}