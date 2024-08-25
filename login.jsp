<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ebook: Login</title>
<%@include file="component/all_css.jsp"%>
<style>
/* Card background with transparency */
.transparent-card {
	background-color: rgba(0, 0, 0, 0.5); /* Black with 50% opacity */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	border-radius: 5px; /* Rounded corners */
}

/* Form control styles */
.form-control {
	background-color: #1c1c1c; /* Dark grey (near black) background */
	color: #e0e0e0; /* Light grey text */
	border: 1px solid #4d4d4d; /* Dark grey border */
}

.form-control::placeholder {
	color: #8c8c8c; /* Medium grey placeholder text */
}

.form-control:focus {
	background-color: #2a2a2a; /* Slightly lighter dark grey on focus */
	color: #ffffff; /* White text on focus */
	outline: none; /* Remove default outline */
}

/* Label and text styles */
.form-group label, h4, .text-center {
	color: #ffffff; /* White text for labels and headings */
}

/* Button styles */
.btn-outline-light {
	color: #ffffff; /* White text for buttons */
	border-color: #ffffff; /* White border */
	background-color: transparent;
}

.btn-outline-light:hover {
	background-color: #ffffff; /* White background on hover */
	color: #000000; /* Black text on hover */
}

/* Link styles */
.create-account-link {
	color: #ffffff; /* White color for the link */
	text-decoration: none; /* Remove underline */
}

.create-account-link:hover {
	text-decoration: underline; /* Underline on hover */
}

/* Message styles */
.text-danger {
	color: #ff4c4c; /* Light red for error messages */
}

.text-success {
	color: #28a745; /* Green for success messages */
}

body {
	background-color: #101010; /* Very dark grey background */
	background-image: url('img/p2.png');
	background-size: cover;
}

.container {
	margin-left: 140px; /* Adjust the container position as needed */
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-1 mt-4 transparent-card">
					<div class="card-body">
						<h4 class="text-center">Login here</h4>

						<c:if test="${not empty failedMsg}">
							<h6 class="text-center text-danger">${failedMsg}</h6>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h6 class="text-center text-success">${succMsg}</h6>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-light mt-3">Login</button>
								<br> <a href="register.jsp" class="create-account-link">Create
									account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
