package com.student_profile_web.service;

import com.student_profile_web.entity.Admin;
import com.student_profile_web.entity.StudentAuthenticate;

public interface AdminService {
	
	public void saveAdmin(Admin admin);
	
	public void convertAndSave(StudentAuthenticate studentAuthenticate);
	
	public Admin getAdmin(String username);
}
