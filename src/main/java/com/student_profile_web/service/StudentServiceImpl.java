package com.student_profile_web.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.student_profile_web.dao.StudentDAO;
import com.student_profile_web.entity.Student;
import com.student_profile_web.entity.StudentAuthenticate;


@Service
@Transactional
public class StudentServiceImpl implements StudentService {

	// need to inject customer dao
	@Autowired
	private StudentDAO studentDAO;
	
	@Override
	public List<Student> getStudents() {
		return studentDAO.getStudents();
	}

	@Override
	public int saveStudent(Student student) {
		return studentDAO.saveStudent(student);
	}

	@Override
	public Student getStudent(int id) {
		return studentDAO.getStudent(id);
	}

	@Override
	public void deleteStudent(int id) {
		studentDAO.deleteStudent(id);
	}

	@Override
	public void convertAndSave(StudentAuthenticate studentAuthenticate) {
		Student student = new Student();
		
		student.setFirstName(studentAuthenticate.getFirstName());
		student.setLastName(studentAuthenticate.getLastName());
		student.setEmail(studentAuthenticate.getEmail());
		
		studentDAO.saveStudent(student);
		
	}

	@Override
	public Student findByEmailId(String email) {
		return studentDAO.findByEmailId(email);
	}

	@Override
	public boolean preprocess(Student student) {
		String firstName = student.getFirstName();
		String lastName = student.getLastName();
		
		return checkValidity(firstName) && checkValidity(lastName);
	}
	
	private boolean checkValidity(String str) {
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<str.length();i++) {
			if(!Character.isAlphabetic(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}
	

}