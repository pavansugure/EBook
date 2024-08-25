<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="all_css.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>

						<c:if test="${ not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${ not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<form action="../add_books" method=post
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputName">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="bname">
							</div>

							<div class="form-group">
								<label for="exampleInputName">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="author">
							</div>

							<div class="form-group">
								<label for="exampleInputName">Price*</label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="price">
							</div>

							<div class="form-group">
								<label for="exampleInputName">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 60px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>