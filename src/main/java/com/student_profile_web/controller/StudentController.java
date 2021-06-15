package com.student_profile_web.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.student_profile_web.entity.Student;
import com.student_profile_web.service.StudentService;


@Controller
@RequestMapping("/student")
public class StudentController {
	
	// need to inject our customer service
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/list")
	public String listStudents(Model model) {
		
		// get customers from the service
		List<Student> studentList = studentService.getStudents();
				
		// add the customers to the model
		model.addAttribute("students", studentList);
		
		return "list-students";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		
		// create model attribute to bind form data
		Student student = new Student();
		
		model.addAttribute("student", student);
		
		return "student-form";
	}
	
	@PostMapping("/saveStudent")
	public String saveStudent(@RequestParam("update") int studId,@ModelAttribute("student") Student student) {
		
//		boolean checkValidity = studentService.preprocess(student);
//		
//		if(!checkValidity) {
//			return "redirect:/student/list?error=invalid_chars";
//		}
		
		Student tempStudent = studentService.findByEmailId(student.getEmail());
		
		// Check whether email already exists
		if(studId == 0 && tempStudent != null) {
			return "redirect:/student/showFormForAdd?error=email_exists";
		}
		
		Student tempStudentUpdate = studentService.getStudent(studId);
		
		if(studId > 0) {
			if(tempStudent != null && !tempStudentUpdate.getEmail().equals(student.getEmail())) {
				return "redirect:/student/showFormForAdd?error=email_exists";
			}
		}
		
		
		// save the customer using our service
		studentService.saveStudent(student);	
		
		return "redirect:/student/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("studentId") String id,
									Model model,HttpServletResponse response) {
		int studId = 0;
		try {
			studId = Integer.parseInt(id);
		}catch(Exception e) {
			return "redirect:/student/list?error=NAN";
		}
		
		// get the customer from our service
		Student student = studentService.getStudent(studId);	
		
		if(student == null) {
			return "redirect:/student/list?error=invalid_id";
			//throw new StudentNotFoundException("Student id not found -" + id);
		}
		
		// set customer as a model attribute to pre-populate the form
		model.addAttribute("student", student);
		
		// send over to our form		
		return "student-form";
	}
	
	@GetMapping("/delete")
	public String deleteStudent(@RequestParam("studentId") int id) {
		
		// delete the customer
		studentService.deleteStudent(id);
		
		return "redirect:/student/list";
	}
}










