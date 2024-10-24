package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			try(PrintWriter out = response.getWriter()) {
				//fetch all the data 
				String userEmail = request.getParameter("user_email");
				String userName = request.getParameter("user_name");
				String userPassword = request.getParameter("user_password");
				String about = request.getParameter("about");
				Part part = request.getPart("image");
				String imageName = part.getSubmittedFileName();
				
				// get the user from the session
				HttpSession s = request.getSession();
		       User user = (User) s.getAttribute("currentUser");     //loged in user
		       user.setEmail(userEmail);
		       user.setName(userName);
		       user.setPassword(userPassword);
		       user.setAbout(about);
		       String oldFile = user.getProfile();
		       user.setProfile(imageName);
		       
		       //update database
		       UserDao dao = new UserDao(ConnectionProvider.getConnection());
		       boolean ans = dao.updateUser(user);
		       if(ans) {
		    	   
		    	   String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
		    	   String pathOldFile = request.getRealPath("/")+"pics"+File.separator+oldFile;
		    	   if(!pathOldFile.equals("dafaul.png")) {
		    		   Helper.deleteFile(pathOldFile);
		    	   }
		    		   if (Helper.saveFile(part.getInputStream(), path)) {
		    			   out.println("Profile Updated...");
		    			   Message msg = new Message("Profile Updated...","success","alert-success");
		   				   s.setAttribute("msg", msg);
					}else {
						Message msg = new Message("Something went wrong..","danger","alert-danger");
				    	   s.setAttribute("msg", msg);
					}
		       }else {
		    	   out.println("Not Updated");
		    	   Message msg = new Message("Something went wrong..","danger","alert-danger");
		    	   s.setAttribute("msg", msg);
		    	   
		       }
		       response.sendRedirect("profile.jsp");
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
	}

}
