<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile Management</title>
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>

	<!-- Navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light py-3">
			<div class="container">
				<!-- Navbar Brand -->
				<div class="row">

					<div class="col-3">
						<a href="${pageContext.request.contextPath}/showIndexPage" class="navbar-brand"> <img
							src="${pageContext.request.contextPath}/imgs/logo.png" alt="logo"
							width="150">
						</a>
					</div>
					<div class="col text-center">
						<p class="h1">STUDENT PROFILE MANAGEMENT</p>
					</div>
				</div>
			</div>
		</nav>
	</header>


	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col">
				<img
					src="https://res.cloudinary.com/mhmd/image/upload/v1569543678/form_d9sh6m.svg"
					alt="" class="img-fluid mb-3 d-none d-md-block">
				<h1 class="text-center">Register as Student</h1>
			</div>
		</div>
		<br> <br> <br> <br>
		<div class="row justify-content-center">
			<!-- For Demo Purpose -->


			<br> <br>
			<!-- Registration Form -->
			<div class="col">
				<form:form
					action="${pageContext.request.contextPath}/registerStudent"
					method="POST" class="form-horizontal"
					modelAttribute="studentAuthenticate">


					<!-- Place for messages: error, alert etc ... -->
					<div class="form-group">
						<div class="col-lg-8 mx-auto mb-4">
							<div>
								
								<c:if test="${param.exists != null}">

									<div class="alert alert-warning">Username already exists</div>

								</c:if>
								
								<c:if test="${param.student_email_exists != null}">

									<div class="alert alert-warning">Student email already exists</div>

								</c:if>

							</div>
						</div>
					</div>

					<div class="row align-items-center">
					

						<div class="input-group col-lg-8  mx-auto mb-4">
							<h4>
								<span class="badge badge-danger">Register as Student</span>
								
							</h4>
						</div>

						<!-- User name -->
						<div class="input-group col-lg-8  mx-auto mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								</span>
							</div>
							<form:input id="name" type="text" name="username" path="username"
								placeholder="User Name" minLength="4"
								class="form-control bg-white border-left-0 border-md"
								required="required" />
						</div>

						<!-- Password -->
						<div class="input-group col-lg-8 mx-auto mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<form:input id="password" type="password" name="password"
								path="password" placeholder="Password" minLength="6"
								class="form-control bg-white border-left-0 border-md"
								required="required" />
						</div>

						<!-- First Name -->

						<div class="input-group col-lg-8 mx-auto mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								</span>
							</div>
							<form:input path="firstName"
								class="form-control bg-white border-left-0 border-md"
								placeholder="First Name" required="required" />
						</div>

						<!-- Last Name -->
						<div class="input-group col-lg-8 mx-auto mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								</span>
							</div>
							<form:input path="lastName"
								class="form-control bg-white border-left-0 border-md"
								placeholder="Last Name" required="required" />
						</div>

						<!-- Email -->

						<div class="input-group col-lg-8 mx-auto mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-envelope text-muted"></i>
								</span>
							</div>
							<form:input path="email"
								class="form-control bg-white border-left-0 border-md"
								placeholder="Email" type="email" required="required"
								pattern="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" />

						</div>

						<!-- Submit Button -->
						<div class="form-group col-lg-8 mx-auto mb-0">
							<button type="submit" class="btn btn-success btn-block">Register
								as Student</button>
						</div>

						<!-- Divider Text -->
						<div
							class="form-group col-lg-8 mx-auto d-flex align-items-center my-4">
							<div class="border-bottom w-100 ml-5"></div>
							<span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
							<div class="border-bottom w-100 mr-5"></div>
						</div>

						<!-- Already Registered -->
						<div class="text-center w-100">
							<p class="text-muted font-weight-bold">
								Already registered ? <a
									href="${pageContext.request.contextPath}/showLoginPage"
									class="text-primary ml-2">Login</a>
							</p>
						</div>

						<!-- Common Base part -->

						<div
							class="form-group col-lg-8 mx-auto d-flex align-items-center my-4">
							<div class="border-bottom w-100 ml-5"></div>
							<span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
							<div class="border-bottom w-100 mr-5"></div>
						</div>
						<div class="text-center w-100">
							<p class="text-muted font-weight-bold">
								<a href="${pageContext.request.contextPath}/showIndexPage"
									class="text-primary ml-2">GO BACK TO HOME PAGE</a>
							</p>
						</div>

						<!-- Common Base part -->

					</div>

				</form:form>
			</div>


		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

</body>
</html>