package com.codegeek.dao;
import java.sql.*;

import com.codegeek.entities.User;
public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
		// Method To Insert User To DataBase:
	public boolean saveUser(User user ) {
		boolean check_query =false;
		try {
			
			// user --> DataBase
			String query = "insert into user(username,email,password) values(?,?,?)";
			PreparedStatement preparedstatement=this.con.prepareStatement(query);
			preparedstatement.setString(1, user.getUsername());
			preparedstatement.setString(2, user.getEmail());
			preparedstatement.setString(3, user.getPassword());
			
					// Executing Query //
			preparedstatement.executeUpdate();
			check_query=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check_query;
	}
	public User getUserByEmailAndPassword(String email, String password)
	{
		User user=null;
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement preparedstatement = con.prepareStatement(query);
			preparedstatement.setString(1, email);
			preparedstatement.setString(2, password);
			
			ResultSet set=preparedstatement.executeQuery();
			if(set.next()) {
				user = new User();
				
				
				// Set To User Object
				user.setUsername(set.getString("username"));
				user.setId(set.getInt("userId"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setDateTime(set.getTimestamp("create_time"));
				//user.setProfile(set.getString("profile"));
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public User getUserByUserId(int userId) throws SQLException {
		User user = null;
		try {
		String query = "select * from user where userId=?";
		PreparedStatement preparedstatement = this.con.prepareStatement(query);
		preparedstatement.setInt(1, userId);
		ResultSet set = preparedstatement.executeQuery();
		if(set.next()) {
			user.setUsername(set.getString("username"));
			user.setId(set.getInt("userId"));
			user.setEmail(set.getString("email"));
			user.setPassword(set.getString("password"));
			user.setDateTime(set.getTimestamp("create_time"));
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}


