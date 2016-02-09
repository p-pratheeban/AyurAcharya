package edu.mum.devfest.group8.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.mum.devfest.group8.dao.LoginDao;
@WebServlet("/Login")
public class LoginController extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
  
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();
          
        String user=request.getParameter("user");    
        String pass=request.getParameter("pass");   
          
        HttpSession session = request.getSession(false);  
        if(session!=null)  
        session.setAttribute("username", user);  
        LoginDao loginDao=new LoginDao();
        if(loginDao.validate(user, pass)){    
            //RequestDispatcher rd=request.getRequestDispatcher("jsp/home.jsp");    
            //rd.forward(request,response);
        	response.sendRedirect("jsp/home.jsp");
        }    
        else{    
            out.print("<p style=\"color:red\">Sorry username or password error</p>");    
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
            rd.include(request,response);    
        }    
  
        out.close();    
    }    
}
