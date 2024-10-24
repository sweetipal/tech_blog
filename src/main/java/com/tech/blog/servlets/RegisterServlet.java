package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")
@MultipartConfig 
public class RegisterServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = resp.getWriter()) {
			String check = req.getParameter("check");
			if(check ==null) {
				out.println("box not checked");
			}else {
				String name = req.getParameter("user_name");
				String email = req.getParameter("user_email");
				String password = req.getParameter("user_password");
				String gender = req.getParameter("gender");
				String about = req.getParameter("about");
				
				//create user object and set all the data to that object...
				User user = new User(name, email, password, gender, about);
				
				
				//create a user dao object
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
				if(dao.saveUser(user)) {
					// save
					out.println("done");
				}else {
					out.println("error");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 

}
