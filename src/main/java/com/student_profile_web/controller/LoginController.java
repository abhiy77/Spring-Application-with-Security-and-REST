package com.student_profile_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@GetMapping("/showIndexPage")
	public String showIndexPage() {
		
		return "index";
	}
	
	@GetMapping("/showLoginPage")
	public String showLoginPage() {	
		return "student-admin-login";
	}
	
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		
		return "access-denied";
	}
	
	@RequestMapping("/")
	public String redirect() {
		return "redirect:/student/list";
	}
}
