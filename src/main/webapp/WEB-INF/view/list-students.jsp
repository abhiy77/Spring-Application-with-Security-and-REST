<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>
<title>List Students</title>

<!-- reference our style sheet -->

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
					<div class="col-3">
						<a href="#" class="navbar-brand"> <img
							src="${pageContext.request.contextPath}/imgs/logo.png" alt="logo"
							width="150">
						</a>
					</div>
					<div class="col-9 justify-content-center">
						<p class="h1">STUDENT PROFILE MANAGEMENT</p>

						<!-- Logout button -->
					</div>
				</div>
				<form:form action="${pageContext.request.contextPath}/logout"
							method="POST">
							<input type="submit" value="Logout" class="btn btn-danger" style="float:right"/>
				</form:form>
			</div>
		</nav>
	</header>


	<div id="container" class="container-fluid ml-4">

		<div id="content">

			<p>
			<h4>
				<span class="badge badge-success">USER</span>
			</h4>
			<security:authentication property="principal.username" />
			<br> <br>
			<h4>
				<span class="badge badge-danger">ROLE</span>
			</h4>
			<security:authentication property="principal.authorities" />
			<br> <br>



			<!-- Button: Add Student -->

			<security:authorize access="hasRole('ADMIN')">


				<input type="button" value="Add Student" class="btn btn-primary"
					onclick="window.location.href='showFormForAdd'; return false;" />

			</security:authorize>

			<br> <br>

			<div class="form-group">
				<div class="col-lg-8 mx-auto mb-4">
					<div>
						<c:if test="${param.error != null && param.error == 'invalid_id'}">

							<div class="alert alert-danger">Requested student does not
								exist.</div>

						</c:if>

						<c:if test="${param.error == 'NAN'}">

							<div class="alert alert-danger">Please enter a valid
								Student id</div>

						</c:if>
						
						<%-- <c:if test="${param.error == 'email_exists'}">

							<div class="alert alert-warning">A student with the email address already exists.</div>

						</c:if> --%>
						
						<%-- <c:if test="${param.error == 'invalid_chars'}">

							<div class="alert alert-warning">Student FirstName/LastName should only contain alphabetic characters</div>

						</c:if> --%>
					</div>
				</div>
			</div>



			<!--  add our html table here -->

			<table class="table table-striped">
				<thead>
					<tr class="row">
						<th class="col col-3" scope="col">First Name</th>
						<th class="col col-3" scope="col">Last Name</th>
						<th class="col col-4" scope="col">Email</th>
						<th class="col col-2" scope="col">Action</th>
					</tr>
				</thead>

				<tbody>
					<!-- loop over and print our students -->
					<c:forEach var="tempStudent" items="${students}">

						<!-- construct an "update" link with student id -->
						<c:url var="updateLink" value="/student/showFormForUpdate">
							<c:param name="studentId" value="${tempStudent.id}" />
						</c:url>

						<!-- construct a "delete" link with student id -->
						<c:url var="deleteLink" value="/student/delete">
							<c:param name="studentId" value="${tempStudent.id}" />
						</c:url>

						<tr class="row">
							<td class="col col-3">${tempStudent.firstName}</td>
							<td class="col col-3">${tempStudent.lastName}</td>
							<td class="col col-4">${tempStudent.email}</td>

							<security:authorize access="hasRole('ADMIN')">

								<td class="col col-2">
									<!-- display the update link --> <a href="${updateLink}"
									class="btn btn-success">Update</a> | <a href="${deleteLink}"
									class="btn btn-danger"
									onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a>
								</td>

							</security:authorize>

						</tr>

					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>


</body>

</html>

