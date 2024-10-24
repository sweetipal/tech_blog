package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	// Method to insert user into database
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			// Ensure con is not null
			if (con == null) {
				con = ConnectionProvider.getConnection();
			}

			// user --> database
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
			pstmt.close(); // close PreparedStatement
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get user by usermail and userpassword to login // read operation

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				String name = rs.getString("name");
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "update user set name = ?, email= ?, password=?, gender=?, about = ?, profile = ? where id = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());
			pstmt.executeUpdate();
			f=true;
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;

	}

}
