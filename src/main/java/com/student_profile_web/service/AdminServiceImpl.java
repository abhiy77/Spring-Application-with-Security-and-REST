package com.student_profile_web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.student_profile_web.dao.AdminDAOImpl;
import com.student_profile_web.entity.Admin;
import com.student_profile_web.entity.StudentAuthenticate;

@Service
@Transactional(transactionManager = "admin-transactionManager")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAOImpl adminDao;
	
	@Override
	public void saveAdmin(Admin admin) {
		adminDao.saveAdmin(admin);
	}

	@Override
	public void convertAndSave(StudentAuthenticate studentAuthenticate) {
		
		Admin admin = new Admin(studentAuthenticate.getUsername(),studentAuthenticate.getPassword(),2);
		adminDao.saveAdmin(admin);
	}
	
	@Override
	public Admin getAdmin(String username) {
		return adminDao.getAdmin(username);
	}
}
