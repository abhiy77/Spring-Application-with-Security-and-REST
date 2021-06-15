<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>Save Student</title>

<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>

<body>
	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light py-3">
			<div class="container-fluid">
				<!-- Navbar Brand -->
				<div class="row">
					<div class="col col-3">
						<a href="#" class="navbar-brand"> <img
							src="${pageContext.request.contextPath}/imgs/logo.png" alt="logo"
							width="150">
						</a>
					</div>
					<div class="col col-9">
						<p class="h1">STUDENT PROFILE MANAGEMENT</p>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<div id="container">
		<h3 class="ml-5">Save Student</h3>
		<br> <br>



		<form:form action="saveStudent?update=${student.id}"
			modelAttribute="student" method="POST" id="studentForm">

			<!-- need to associate this data with student id -->
			<form:hidden path="id" />

			<div class="input-group col-lg-4 mb-4 ml-4">
				<div class="input-group-prepend">
					<span
						class="input-group-text bg-white px-4 border-md border-right-0">
						<i class="fa fa-user text-muted"></i>
					</span>
				</div>
				<form:input path="firstName"
					class="form-control bg-white border-left-0 border-md"
					id="firstName" placeholder="First Name" required="required" />

			</div>

			<!-- Last Name -->
			<div class="input-group col-lg-4 mb-4 ml-4">
				<div class="input-group-prepend">
					<span
						class="input-group-text bg-white px-4 border-md border-right-0">
						<i class="fa fa-user text-muted"></i>
					</span>
				</div>
				<form:input path="lastName"
					class="form-control bg-white border-left-0 border-md" id="lastName"
					placeholder="Last Name" required="required" />


			</div>

			<!-- Email -->

			<div class="input-group col-lg-4 mb-4 ml-4">
				<div class="input-group-prepend">
					<span
						class="input-group-text bg-white px-4 border-md border-right-0">
						<i class="fa fa-user text-muted"></i>
					</span>
				</div>
				<form:input path="email"
					class="form-control bg-white border-left-0 border-md"
					placeholder="Email" type="email" required="required"
					pattern="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" />

			</div>

			<div class="input-group col-lg-4 mb-4 ml-4 justify-content-center">
				<input type="submit" value="Save" class="btn btn-primary col-lg-2" />
			</div>
			<div class="alert alert-warning" id="alertFirstName"
				style="display: none; width: 35%; margin-left: 45px">Student
				FirstName should only contain alphabetic characters</div>
			<div class="alert alert-warning" id="alertLastName"
				style="display: none; width: 35%; margin-left: 45px">Student
				LastName should only contain alphabetic characters</div>
			<div class="alert alert-warning" id="alertEmail"
				style="display: none; width: 35%; margin-left: 45px">
				A student with the email address already exists.</div>

		</form:form>



		<div style=""></div>

		<p>
			<a href="${pageContext.request.contextPath}/student/list"
				class="h5 col-lg-4 mb-4 ml-4 justify-content-center">Back to
				List</a>
		</p>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript">
		var studentForm = document.getElementById('studentForm');
		
		let url = window.location.href.split("?")[1];
		if(url === 'error=email_exists'){
			var alertEmail = document.getElementById('alertEmail');
			alertEmail.style.display = "";
		}
		
		studentForm.addEventListener('submit', (event) => {
			
			var firstName = document.getElementById('firstName').value.trim();
			var lastName = document.getElementById('lastName').value.trim();
			
			var alertFirstName = document.getElementById('alertFirstName');
			var alertLastName = document.getElementById('alertLastName');
			
			event.preventDefault();
			
			console.log(firstName);
			
			if(!isValid(firstName)){
				alertFirstName.style.display = "";
				return false;
			}
			
			alertFirstName.style.display = "none";
			
			if(!isValid(lastName)){
				alertLastName.style.display = "";
				return false;
			}
			
			alertLastName.style.display = "none";
			
			event.currentTarget.submit();
		});
		
		function isValid(name){
			if(name.length == 0){
				return false;
			}
			var letters = /^[A-Za-z]+$/;
		    if(name.match(letters)){
		    	console.log(name);
		      	return true;
		     }
		    return false;
		}
		
	</script>
	
	

</body>

</html>



