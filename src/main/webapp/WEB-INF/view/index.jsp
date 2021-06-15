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
						<a href="#" class="navbar-brand"> <img
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
				<h1 class="text-center">REGISTER AS AN ADMIN OR STUDENT</h1>
			</div>
		</div>
		<br> <br> <br> <br>
		
		<div class="row">
			<div class="col col-6">
				<div class="row d-flex justify-content-center">
					<h4>
						<span class="badge badge-primary">ADMIN PAGE</span>
					</h4>
				</div>
				<div class="row d-flex justify-content-center">
					<a href="showAdminRegisterPage"> <img
						src="${pageContext.request.contextPath}/imgs/admin.jpeg"
						alt="logo" width="250">
					</a>
				</div>
			</div>
			
			<div class="col col-6">
				<div class="row d-flex justify-content-center">
					<h4>
						<span class="badge badge-danger">STUDENT PAGE</span>
					</h4>
				</div>
				<div class="row d-flex justify-content-center">
					<a href="showStudentRegisterPage"> <img
						src="${pageContext.request.contextPath}/imgs/student.png"
						alt="logo" width="200">
					</a>
				</div>
			</div>
		</div>
		
		<br><br>
		
		<div class="row">
			<div class="col-12">
				<div class="text-center w-100">
					<h3 class="text-muted font-weight-bold">
						Already registered ? <a
							href="${pageContext.request.contextPath}/showLoginPage"
							class="text-primary ml-2">Login</a>
					</h3>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

</body>
</html>