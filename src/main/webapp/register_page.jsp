<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<style>
.banner-backgroung {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background banner-backgroung"
		style="padding-bottom: 80px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span><br>
						<p>Register here</p>
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="post" id="reg-form">
							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label for="user_email">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="user_email" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="user_password">Password</label> <input
									name="user_password" type="text" class="form-control"
									id="user_password" placeholder="Password">
							</div>
							<div class="form-group">
								<label for="male">Male</label> <input type="radio" id="male"
									name="gender" value="male"> <label for="female">Female</label>
								<input type="radio" id="female" name="gender" value="female">
							</div>

							<div class="form-group">
								<textarea name="about" class="form-control" rows="5" cols="30"
									placeholder="Enter something about yourself"></textarea>
							</div>
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input" id="check">
								 <label class="form-check-label" for="check">Agree
									terms and conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader" style="display: none;">
							<span class="fa fa-refresh fa-spin fa-3x"></span>
							<h4>Please wait...</h4>
							</div>
							
							<br>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script type="text/javascript">
			$(document).on('submit', '#reg-form', function(event) {
				event.preventDefault(); // prevent default form submission
				$("#submit-btn").hide();
				$("#loader").show();
				let form = new FormData(this);
				// send register servlet
				$.ajax({
					url : "RegisterServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						/* $('#reg-form')[0].reset(); // reset form fields */
						console.log(data); // show response message
						$("#submit-btn").show();
						$("#loader").hide();
						if(data.trim()==='done'){
							swal("Registered successfully..We are going to redirect to login page")
							.then((value) => {
							  window.location = "login_page.jsp"
							});
						}else{
							swal(data);
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$("#submit-btn").show();
						$("#loader").hide();
						swal("something went wrong..try again");
					},
					processData : false,
					contentType : false
				});
			});
	</script>

</body>
</html>