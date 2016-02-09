package edu.mum.devfest.group8.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import edu.mum.devfest.group8.model.DailyRoutine;
import edu.mum.devfest.group8.model.Post;
import edu.mum.devfest.group8.model.User;
import edu.mum.devfest.group8.util.Database;

public class PostDao {
	private Connection connection;
	ResultSet rs = null;
   
  

	public PostDao() {
		connection = Database.getConnection();
	}

	public void addPost(Post post) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into posts(post_text,username, created_date) values (?, ?, ?)");
			// Parameters start with 1
			preparedStatement.setString(2, post.getUsername());
			preparedStatement.setString(1, post.getPosttext());
			preparedStatement.setDate(3, new java.sql.Date(post.getCreatedDate().getTime()));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
}
