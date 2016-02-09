package edu.mum.devfest.group8.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import edu.mum.devfest.group8.model.DailyRoutine;
import edu.mum.devfest.group8.model.User;
import edu.mum.devfest.group8.util.Database;

public class LoginDao {
	private Connection connection;
	ResultSet rs = null;
   
  

	public LoginDao() {
		connection = Database.getConnection();
	}

	public void addDailyRoutine(User user) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into user(username, password,email) values (?, ?, ?)");
			// Parameters start with 1
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
		
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public boolean validate(String name, String pass){
		 boolean status = false; 
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"select * from user where username = ? and password=?");
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, pass);
			rs = preparedStatement.executeQuery();
			status = rs.next(); 			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
    }
}
