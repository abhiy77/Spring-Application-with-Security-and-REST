package com.student_profile_web;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.student_profile_web.dao.StudentDAOImpl;
import com.student_profile_web.entity.Student;

@SpringBootTest
@Transactional
class StudentProfileManagementApplicationTests {
	
	@Autowired
	private StudentDAOImpl studentRepo;
	
	@Test
	public void testGetStudents() {
		List<Student> studentList = studentRepo.getStudents();
		
		assertEquals(studentList.size(), 3);
	}
	
	@Test
	public void testSaveStudent() {
		Student student = new Student();
		student.setFirstName("Gary");
		student.setLastName("Wilson");
		student.setEmail("gary@gmail.com");
		
		int id = studentRepo.saveStudent(student);
		
		Student tempStudent = studentRepo.getStudent(id);
		
		assertEquals(tempStudent.getId(), id);
		assertEquals(tempStudent.getFirstName(),student.getFirstName());
		assertEquals(tempStudent.getLastName(),student.getLastName());
		assertEquals(tempStudent.getEmail(), student.getEmail());
	}
	
	@Test
	public void testGetStudent() {
		
		int id = 6;	
		Student student = studentRepo.getStudent(id);
		assertNotEquals(student, null);
		assertEquals(student.getId(), id);
	}
	
	@Test
	public void testDeleteStudent() {
		
		int id = 6;
		studentRepo.deleteStudent(id);
		
		Student student = studentRepo.getStudent(id);
		assertEquals(student,null);
		
	}
	
	@Test
	public void testUpdateStudent() {
		
		int id = 6;
		Student student = studentRepo.getStudent(id);
		student.setLastName("Marky");
		
		studentRepo.saveStudent(student);
		
		student = studentRepo.getStudent(id);
		
		assertEquals(student.getLastName(), "Marky");
		
	}

}
