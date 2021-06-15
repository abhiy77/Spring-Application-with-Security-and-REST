package com.student_profile_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.student_profile_web.entity.Admin;
import com.student_profile_web.entity.StudentAuthenticate;
import com.student_profile_web.service.AdminServiceImpl;
import com.student_profile_web.service.StudentService;

@Controller
public class RegisterController {
	
	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/showAdminRegisterPage")
	public String showAdminRegisterPage(Model model) {
		
		// create model attribute to bind form data
		Admin admin = new Admin();
		
		model.addAttribute("admin", admin);
				
		return "admin-register";
	}
	
	@PostMapping("/registerAdmin")
	public String registerAdmin(@ModelAttribute("admin") Admin admin) {
		
		if(adminService.getAdmin(admin.getUsername()) != null) {
			return "redirect:/showAdminRegisterPage?exists";
		}
		
		adminService.saveAdmin(admin);
		
		return "redirect:/showLoginPage?success";
	}
	
	@GetMapping("/showStudentRegisterPage")
	public String showStudentRegisterPage(Model model) {
		
		// create model attribute to bind form data
		StudentAuthenticate studentAuthenticate = new StudentAuthenticate();
		
		model.addAttribute("studentAuthenticate", studentAuthenticate);
				
		return "student-register";
	}
	
	@PostMapping("/registerStudent")
	public String registerStudent(@ModelAttribute("studentAuthenticate") StudentAuthenticate studentAuthenticate) {
		
		if(adminService.getAdmin(studentAuthenticate.getUsername()) != null) {
			return "redirect:/showStudentRegisterPage?exists";
		}
		
		if(studentService.findByEmailId(studentAuthenticate.getEmail()) != null) {
			return "redirect:/showStudentRegisterPage?student_email_exists";
		}
		
		adminService.convertAndSave(studentAuthenticate);
		
		studentService.convertAndSave(studentAuthenticate);
		
		return "redirect:/showLoginPage?success";
	}

}
