package com.student_profile_web.dao;

import java.util.List;

import com.student_profile_web.entity.Admin;

public interface AdminDAO {

	public void saveAdmin(Admin admin);
	
	public List<Admin> getAdminUsers();
	
	public Admin getAdmin(String username);
	
}