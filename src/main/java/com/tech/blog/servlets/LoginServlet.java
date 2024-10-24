package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = resp.getWriter()) {
			
			// fetech username and password from request
			String userName = req.getParameter("email");
			String UserPassword = req.getParameter("password");
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User user = dao.getUserByEmailAndPassword(userName, UserPassword);
			
			if(user == null) {
				//login error
			//	out.println("Invalid Details..try again");
				Message msg = new Message("Invalid Details ! Try with another","error","alert-danger");
				HttpSession session = req.getSession();
				session.setAttribute("msg", msg);
				resp.sendRedirect("login_page.jsp");
			}else {
				// login success 
				HttpSession session = req.getSession();
				session.setAttribute("currentUser", user);
				resp.sendRedirect("profile.jsp");
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
       

}
