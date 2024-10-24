<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
	<%@ pagelanguage="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css">
    <style>
    .banner-backgroung{
    clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
    }
    </style>
  </head>
  <body>
  <%@include file="normal_navbar.jsp" %>
    <main class="d-flex align-items-center primary-background banner-backgroung" style="height: 70vh;">
      <div class="container">
        <div class="row">
          <div class="col-md-4 offset-md-4">
            <div class="card">
              <div class="card-header primary-background text-white text-center">
                <span><i class="fa fa-user-plus fa-3x"></i></span><br><p>Login here</p>
              </div>
              <% 
              Message msg = (Message)session.getAttribute("msg");
              if(msg != null){ %>
            	  <div class="alert <%= msg.getCssClass() %>" role="alert">
				 <%= msg.getContent() %>
			  </div>
              <%
              session.removeAttribute("msg");
              }
              %>
              <div class="card-body">
                <form action="LoginServlet" method="post">
                  <div class="form-group">
                    <label for="email">Email address</label>
                    <input name="email"  type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" required="required">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input name="password" type="password" class="form-control" id="password" placeholder="Password" required="required">
                  </div>
                 <div class="container text-center">
                  <button type="submit" class="btn btn-primary">Submit</button>
                 </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script type="text/javascript"></script>
  </body>
</html>