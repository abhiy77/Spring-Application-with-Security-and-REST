package com.student_profile_web.service;

import java.util.List;

import com.student_profile_web.entity.Student;
import com.student_profile_web.entity.StudentAuthenticate;

public interface StudentService {

	public List<Student> getStudents();

	public int saveStudent(Student student);

	public Student getStudent(int id);

	public void deleteStudent(int id);
	
	public void convertAndSave(StudentAuthenticate studentAuthenticate);

	public Student findByEmailId(String email);

	public boolean preprocess(Student student);
	
}