package edu.mum.devfest.group8.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import edu.mum.devfest.group8.dao.PostDao;
import edu.mum.devfest.group8.model.Post;
@WebServlet("/Posts")
public class PostController {
	PostDao postDao = new PostDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("username");
		Post post =new Post();
		post.setUsername(name);
		System.out.println(name);
		post.setPosttext(request.getParameter("postText"));
		System.out.println(request.getParameter("postText"));
		post.setCreatedDate(new Date());
		postDao.addPost(post);
		response.sendRedirect("jsp/post.jsp");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("username"));
        response.setContentType("text/html");
		Gson gson = new Gson();
		//List<Post> dailyRoutine = dailyRoutineDao.getDailyRoutine();
		//String dailyRoutines = gson.toJson(dailyRoutine);
		//out.println("{\"Routines\":"+dailyRoutines+"}");
	
	}
}
