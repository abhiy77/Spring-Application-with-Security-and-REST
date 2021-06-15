package com.student_profile_web.dao;

import java.util.List;

import com.student_profile_web.entity.Student;

public interface StudentDAO {

	public List<Student> getStudents();

	public int saveStudent(Student student);

	public Student getStudent(int id);

	public void deleteStudent(int id);

	public Student findByEmailId(String email);
	
}