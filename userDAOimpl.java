package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DB.DBconnect;
import com.entity.Users;

public class userDAOimpl implements userDAO {

	private Connection conn;

	public userDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(Users us) {
		boolean f = false;

		try {

			// Prepare the SQL statement
			PreparedStatement ps = conn
					.prepareStatement("INSERT INTO user (name, email, phone, password) VALUES (?, ?, ?, ?)");

			// Set the parameters for the SQL statement
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());

			// Execute the SQL statement
			int i = ps.executeUpdate();

			// Check if the insertion was successful
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Users login(String email, String password) {
		Users us = null;

		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				us = new Users();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String pst) {

		boolean f = false;

		try {

			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			ps.setString(2, pst);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(Users us) {

		boolean f = false;

		try {

			String sql = "update user set name=?, email=?, phone=? where id=?";
			// Prepare the SQL statement
			PreparedStatement ps = conn.prepareStatement(sql);

			// Set the parameters for the SQL statement
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setInt(4, us.getId());

			// Execute the SQL statement
			int i = ps.executeUpdate();

			// Check if the insertion was successful
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkUser(String em) {

		boolean f = true;

		try {
			
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, em);

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				f = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}