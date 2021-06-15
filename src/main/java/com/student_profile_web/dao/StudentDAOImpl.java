package com.student_profile_web.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.student_profile_web.entity.Student;


@Repository
public class StudentDAOImpl implements StudentDAO {

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Student> getStudents() {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// create a query  ... sort by last name
		Query<Student> query = 
				currentSession.createQuery("from Student order by lastName",
											Student.class);
		
		// execute query and get result list
		List<Student> students = query.getResultList();
				
		// return the results		
		return students;
	}

	@Override
	public int saveStudent(Student student) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the customer
		currentSession.saveOrUpdate(student);
		
		return student.getId();
		
	}

	@Override
	public Student getStudent(int id) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Student student = currentSession.get(Student.class, id);
		
		return student;
	}

	@Override
	public void deleteStudent(int id) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		// now retrieve/read from database using the primary key
		Student student = currentSession.get(Student.class, id);
		
		currentSession.delete(student);
	}

	@Override
	public Student findByEmailId(String email) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Student> query = 
				currentSession.createQuery("from Student where email=:studEmail",
											Student.class);
		query.setParameter("studEmail", email);
		
		Student student = query.uniqueResult();
		
		return student;
	}

}