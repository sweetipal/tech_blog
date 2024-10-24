<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.tech.blog.entities.User"%><%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.*"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css">
    <style>
      .banner-backgroung {
        clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
      }
    </style>
  </head>
  <body>
    <!--nav baar start  -->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
      <a class="navbar-brand" href="index.jsp">
        <span>
          <i class="fa fa-asterisk"></i>
        </span> Tech Blog </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">
              <span>
                <i class="fa fa-bell-o"></i>
              </span> LearnCode with Sweety <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span>
                <i class="fa fa-check-square-o"></i>
              </span> Categories </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Programming Languages</a>
              <a class="dropdown-item" href="#">Project Implementation</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Data Structure</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">
              <span>
                <i class="fa fa-address-card-o"></i>
              </span> Contact </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#" data-toggle="modal" data-target="#add-post-modal">
              <span>
                <i class="fa fa-asterisk"></i>
              </span> Do Post </a>
          </li>
        </ul>
        <ul class="navbar nav mr-right">
          <li class="nav-item">
            <a class="nav-link disabled" href="#!" data-toggle="modal" data-target="#profile-modal">
              <span>
                <i class="fa fa-user-circle"></i>
              </span><%=user.getName()%> </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="LogoutServlet">
              <span>
                <i class="fa fa-user-plus"></i>
              </span> Logout </a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- end nav bar -->
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
              
              <!--Main body of the page  -->
              <main>
              <div class="container" >
              <div class="row mt-4">
              <!--First col  -->
              <div class="col-md-4">
              <!-- Categories -->
              <div class="list-group">
				  <a href="#" class="c-link list-group-item list-group-item-action active" onclick="getPosts(0,this)">
				    All Post
				  </a>
				  <% 
				  PostDao dao = new PostDao(ConnectionProvider.getConnection());
				  ArrayList<Category> list1 =  dao.getAllCategories();
				  for(Category cc:list1) { %>
				  <a href="#" class="c-link list-group-item list-group-item-action" onclick="getPosts(<%= cc.getCid() %>,this)"><%= cc.getName() %></a>
				  <%
				  }
				  %>
				</div>
              </div>
              <!--second col  -->
              <div class="col-md-8">
              <!-- Posts -->
              <div class="container text-center" id="loader">
              <i class="fa fa-refresh fa-3x fa-spin"></i>
              <h3 class="mt-2">Loading...</h3>
              </div>
              <div class="container-fluid" id="post-container">
              </div>
              </div>
              </div>
              </div>
              </main>
              
              
              
              
              <!-- end main body of the page -->

    <!--Profile Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header primary-background text-white text-center">
            <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="container text-center">
              <img alt="" src="pics/<%= user.getProfile() %>" style="border-radius:50%; max-width: 150px; ">
              <h5 class="modal-title" id="name"><%=user.getName()%> </h5>
              <!-- details -->
              <div id="profile-details">
                <table class="table">
                  <tbody>
                    <tr>
                      <th scope="row">ID :</th>
                      <td><%= user.getId() %> </td>
                    </tr>
                    <tr>
                      <th scope="row">Email :</th>
                      <td><%= user.getEmail() %> </td>
                    </tr>
                    <tr>
                      <th scope="row">Gender :</th>
                      <td><%= user.getGender() %> </td>
                    </tr>
                    <tr>
                      <th scope="row">Status :</th>
                      <td><%= user.getAbout() %> </td>
                    </tr>
                    <tr>
                      <th scope="row">Registered on :</th>
                      <td><%= user.getDateTime().toString() %> </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="profile-edit" style="display: none;">
              <h3 class="mt-2">Please Edit Carefully</h3>
              <form action="EditServlet" method="post" enctype="multipart/form-data">
              <table class="table">
                  <tbody>
                    <tr>
                      <td>ID :</td>
                      <td><%= user.getId() %> </td>
                    </tr>
                    <tr>
                      <td>Email :</td>
                      <td>
                      <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>">
                      </td>
                    </tr>
                    <tr>
					 <td>Name:</td>
					 <td>
					   <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>">
					  </td>
					</tr>

                    <tr>
                      <td>Password:</td>
                      <td>
                      <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Gender:</td>
                      <td><%= user.getGender().toUpperCase() %> </td>
                    </tr>
                    <tr>
                      <td>About:</td>
                      <td>
                      <textarea rows="3" type="text" class="form-control" name="about"><%= user.getAbout() %></textarea>
                       </td>
                    </tr>
                    <tr>
                      <td>New Profile:</td>
                      <td>
                      <input type="file" class="form-control" name="image">
                       </td>
                    </tr>
                  </tbody>
                </table>
                <div class="container">
                <button type="submit" class="btn btn-outline-primary">Save</button>
                </div>
              </form>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
          </div>
        </div>
      </div>
    </div>
    <!-- end Profile Modal -->
    <!-- Do Post Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details..</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddPostServlet" method="post" id="add-post-form" enctype="multipart/form-data">
          <div class="form-group">
            <select class="form-control" name="cid">
              <option selected="selected" disabled="disabled">---Select Category---</option>
              <% PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                 ArrayList<Category> list = postDao.getAllCategories();
                 for(Category c:list) { %>
                 <option value="<%= c.getCid()%>"><%= c.getName()%></option>
              <% } %>
            </select>
          </div>
          <div class="form-group">
            <input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
          </div>
          <div class="form-group">
            <textarea name="pContent" placeholder="Enter your content" class="form-control" style="height: 200px;"></textarea>
          </div>
          <div class="form-group">
            <textarea name="pCode" placeholder="Enter your program (if any)" class="form-control" style="height: 200px;"></textarea>
          </div>
          <div class="form-group">
            <label>Select your pic..</label>
            <input name="pic" type="file" class="form-control">
          </div>
          <div class="container text-center">
            <button type="submit" class="btn btn-outline-primary">Post</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script>
      $(document).ready(function(){
        let editStatus = false;
        $('#edit-profile-button').click(function(){
          if(editStatus==false){
            $('#profile-details').hide();
            $('#profile-edit').show();   
            editStatus= true;
            $(this).text("Back");
          }else{
            $('#profile-details').show();
            $('#profile-edit').hide();
            editStatus=false;
            $(this).text("Edit")
          }
                                         
        })
      })
    </script>

    <!-- now add post js -->
	 <script type="text/javascript">
	 debugger;
			$(document).on('submit', '#add-post-form', function(event) {
				event.preventDefault(); // prevent default form submission
				
				let form = new FormData(this);
				// send register servlet
				$.ajax({
					url : "AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						if(data.trim()=='done'){
							swal("Good job!", "Save Successfully", "success");
						}
						else{
							swal("error", "something went wrong", "error");
						}
						

					},
					error : function(jqXHR, textStatus, errorThrown) {
						swal("error", "something went wrong", "error");
					},
					processData : false,
					contentType : false
				});
			});
	</script>

  <!-- Loading post ajax -->
  <script>
  function getPosts(catId,temp){
	  $("#loader").show();
	  $("#post-container").hide();
	  $(".c-link").removeClass('active');
	  
	  $.ajax({
	        url: "load_posts.jsp",
	        data:{cid:catId},
	        success : function(data, textStatus, jqXHR) {
							console.log(data);
							$("#loader").hide();
							$("#post-container").show();
	                        $('#post-container').html(data)
	                  	   $(temp).addClass('active')

						},
						error : function(jqXHR, textStatus, errorThrown) {
						
						},
	      })
  }
    $(document).ready(function(e){
    	let allPostRef = $('.c-link')[0]
      getPosts(0,allPostRef);
    })
  </script>
	 
	 
	 
  </body>
</html>