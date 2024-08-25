package com.DAO;

import com.entity.Users;

public interface userDAO {
	
	public boolean userRegister(Users us);
	
	public Users login(String email, String password);

	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(Users us);
	
	public boolean checkUser(String em);
}