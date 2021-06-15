package com.student_profile_web.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class Admin {
	
	@Id
	private String username;
	private String password;
	private int enabled;
	
	@OneToMany(fetch=FetchType.LAZY,
			   cascade= CascadeType.ALL)
	@JoinColumn(name="username")
	private List<Authority> roles;
	
	public Admin(String username, String password, int enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.roles = new ArrayList<>();
	}

	public Admin() {
		this.roles = new ArrayList<>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public List<Authority> getRoles() {
		return roles;
	}

	public void setRoles(List<Authority> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + password + ", enabled=" + enabled + "]";
	}
	
	
	
	
}
