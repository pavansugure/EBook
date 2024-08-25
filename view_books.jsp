<%@page import="com.entity.Users"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/all_css.jsp"%>

</head>

<body style="background-color: #f0f1f2">
	<%
	Users u = (Users) session.getAttribute("userobj");
	%>
	<%@include file="component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="width: 100px; height: 150px"><br>
				<h4 class="mt-2">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>

				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>

				<%
				}
				%>




				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="text-center p-3">
					<a href="Index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-plus mx-1"></i>Continue Shopping</a> <a
						href="" class="btn btn-danger mx-1"><i
						class="fa-solid fa-indian-rupee-sign mx-1"></i>200</a>
				</div>

				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						style="font-size: 19px;" class="btn btn-primary btn-sm ml-2"><i
						class="fa-solid fa-cart-plus mx-1"></i>Add to cart</a><a href=""
						class="btn btn-danger mx-1"><i
						class="fa-solid fa-indian-rupee-sign mx-1"></i>200</a>
				</div>

				<%
				}
				%>

			</div>

		</div>
	</div>
</body>
</html>