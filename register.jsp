<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ebook: Register</title>
<%@include file="component/all_css.jsp"%>
<style>
.transparent-card {
    background-color: rgba(0, 0, 0, 0.5); /* Black with 50% opacity */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    border-radius: 5px; /* Rounded corners */
}

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
}

.form-group label, .form-check-label {
    color: #e0e0e0; /* Light grey text for labels */
}

h4, p {
    color: #ffffff; /* White text for headings and messages */
}

.btn-primary {
    background-color: #3a3a3a; /* Dark grey button */
    border-color: #3a3a3a; /* Dark grey border */
}

.btn-primary:hover {
    background-color: #4d4d4d; /* Lighter dark grey on hover */
    border-color: #4d4d4d; /* Lighter dark grey border on hover */

.container-fluid {
	margin-left: 140px; /* Adjust the container position as needed */
}
}
</style>
</head>
<body
    style="background-color: #101010; background-image: url('img/p2.png'); background-size: cover;">
    <%@include file="component/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card p-1 mt-5 transparent-card">
                    <div class="card-body">

                        <h4 class="text-center mt-1">Register here</h4>

                        <c:if test="${not empty succMsg }">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty failedMsg }">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>

                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="exampleInputName">Name</label>
                                <input type="text" class="form-control" id="exampleInputName"
                                    aria-describedby="emailHelp" placeholder="Enter name"
                                    required="required" name="fname">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email</label>
                                <input type="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" placeholder="Enter email"
                                    required="required" name="email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPhone">Phone</label>
                                <input type="number" class="form-control" id="exampleInputPhone"
                                    aria-describedby="emailHelp" placeholder="Enter phone"
                                    required="required" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1"
                                    placeholder="Enter password" required="required"
                                    name="password">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input"
                                    id="exampleCheck1" name="check">
                                <label class="form-check-label" for="exampleCheck1">Agree
                                    terms & conditions</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="component/footer.jsp"%>
</body>
</html>
