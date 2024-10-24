<%@page import="java.sql.Connection"%><%@page import="com.tech.blog.helper.ConnectionProvider"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css">
    <style>
    .banner-backgroung{
    clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
    }
    </style>
  </head>
  <body><%-- <%
Connection con = ConnectionProvider.getConnection();
%> <h1><%=con %> </h1> --%>
    <!-- Navbar --><%@include file="normal_navbar.jsp" %>
    <!-- banner  -->
    <div class="container-fluid p-0 m-0 banner-backgroung">
      <div class="jumbotron primary-background text-white">
      <div class="container">
        <h3 class="display-3">Welcome to TechBlog</h3>
        <h3>Tech Blog</h3>
        <p>A programming language is a type of written language that tells computers what to do. Programming languages are used to write computer programs and computer software. A programming language is like a set of commands that tell the computer how to do things.</p>
        <p>There are many types of programming languages. Most programming languages do not follow one type alone, so it is difficult to assign a type for each language. The examples of each type are given in each section below because they are the best well-known examples of that type.</p>
        <button class="btn btn-outline-light btn-lg"><span><i class="fa fa-user-plus"></i></span> Start ! Its Free</button>
        <a class="btn btn-outline-light btn-lg" href="login_page.jsp"><span><i class="fa fa-user-circle fa-spin"></i></span> Login</a>
      </div>
    </div>
    
    </div>
    <!--CARDS  -->
    <div class="container">
    <div class="row mb-2">
    <div class="col-md-4">
    <div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    <div class="col-md-4">
    <div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    <div class="col-md-4">
    <div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    </div>
    <div class="row mb-2">
    <div class="col-md-4">
    <div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    <div class="col-md-4">
    <div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    <div class="col-md-4">
    <div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script type="text/javascript"></script>
  </body>
</html>