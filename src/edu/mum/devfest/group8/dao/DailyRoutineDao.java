package edu.mum.devfest.group8.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import edu.mum.devfest.group8.model.DailyRoutine;
import edu.mum.devfest.group8.util.Database;

public class DailyRoutineDao {
	private Connection connection;
	ResultSet rs = null;
   
  

	public DailyRoutineDao() {
		connection = Database.getConnection();
	}

	public void addDailyRoutine(DailyRoutine dailyRoutine) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into dailyroutine(name, date, wakeup, breakfasttime, breakfastmeal, lunchtime, lunchmeal, dinnertime, dinnermeal, sleep, meditation) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )");
			// Parameters start with 1
			preparedStatement.setString(1, dailyRoutine.getName());
			preparedStatement.setString(2, dailyRoutine.getDate());
			preparedStatement.setInt(3, dailyRoutine.getWakeup());
			preparedStatement.setInt(4, dailyRoutine.getBreakfasttime());
			preparedStatement.setString(5, dailyRoutine.getBrealfastmeal());
			preparedStatement.setInt(6, dailyRoutine.getLunchtime());
			preparedStatement.setString(7, dailyRoutine.getLunchmeal());
			preparedStatement.setInt(8, dailyRoutine.getDinnertime());
			preparedStatement.setString(9, dailyRoutine.getDinnermeal());
			preparedStatement.setInt(10, dailyRoutine.getSleep());
			preparedStatement.setInt(11, dailyRoutine.getMeditation());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public List<DailyRoutine> getDailyRoutine(){
		List<DailyRoutine> dailydetails = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"select * from dailyroutine where name = ?");
			preparedStatement.setString(1, "robert");
			rs = preparedStatement.executeQuery();
			while(rs.next())
			{
			DailyRoutine dailyRoutine = new DailyRoutine();
			dailyRoutine.setDate(rs.getString("date"));
			dailyRoutine.setWakeup(rs.getInt("wakeup"));			
			dailyRoutine.setBreakfasttime(rs.getInt("breakfasttime"));
			dailyRoutine.setLunchtime(rs.getInt("lunchtime"));
			dailyRoutine.setDinnertime(rs.getInt("dinnertime"));
			dailyRoutine.setSleep(rs.getInt("sleep"));
			dailyRoutine.setMeditation(rs.getInt("meditation"));
			dailydetails.add(dailyRoutine);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dailydetails;
    }
}
