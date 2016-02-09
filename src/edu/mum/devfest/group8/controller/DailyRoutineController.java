package edu.mum.devfest.group8.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import edu.mum.devfest.group8.dao.DailyRoutineDao;
import edu.mum.devfest.group8.model.DailyRoutine;



@WebServlet("/SaveDaily")
public class DailyRoutineController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DailyRoutineDao dailyRoutineDao;
	public DailyRoutineController(){
		dailyRoutineDao = new DailyRoutineDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("username");
		DailyRoutine dailyRoutine =new DailyRoutine();
		dailyRoutine.setName(name);
		dailyRoutine.setDate(request.getParameter("date"));
		//java.util.Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("date"));
		//dailyRoutine.setDate(reg); 
		dailyRoutine.setWakeup(Integer.parseInt(request.getParameter("wakeup")));
		dailyRoutine.setBreakfasttime(Integer.parseInt(request.getParameter("breakfast"))); 
		dailyRoutine.setBrealfastmeal(request.getParameter("breakfastm"));
		dailyRoutine.setLunchtime(Integer.parseInt(request.getParameter("lunch"))); 
		dailyRoutine.setLunchmeal(request.getParameter("lunchm"));
		dailyRoutine.setDinnertime(Integer.parseInt(request.getParameter("dinner"))); 
		dailyRoutine.setDinnermeal(request.getParameter("dinnerm"));
		dailyRoutine.setSleep(Integer.parseInt(request.getParameter("sleep")));
		dailyRoutine.setMeditation(Integer.parseInt(request.getParameter("meditation")));
		dailyRoutineDao.addDailyRoutine(dailyRoutine);
		response.sendRedirect("jsp/dailyroutine.jsp");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("username"));
        response.setContentType("text/html");
		Gson gson = new Gson();
		List<DailyRoutine> dailyRoutine = dailyRoutineDao.getDailyRoutine();
		String dailyRoutines = gson.toJson(dailyRoutine);
		out.println("{\"Routines\":"+dailyRoutines+"}");
	
	}
}
