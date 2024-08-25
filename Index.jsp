<%@page import="com.entity.Users"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ebook</title>
<%@include file="component/all_css.jsp"%>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Nothing+You+Could+Do&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Edu+AU+VIC+WA+NT+Hand:wght@400..700&display=swap')
	;

.back-img {
	background: url("img/b.png");
	height: 95vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.crd-ho:hover {
	background-color: #f7f7f7;
}

.custom-font {
	font-family: 'Nothing You Could Do', cursive;
	font-size: 65px;
}

.text-wrapper {
	position: absolute;
	top: 40%; /* Adjust this value to position the text vertically */
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;


}
</style>

</head>
<body style="background-color: #EAECEE; background-image:url('img/shelf.png')">

	<%
	Users u = (Users) session.getAttribute("userobj");
	%>

	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-wrapper">
			<h2 class="text-center text-white custom-font">Welcome to EBook
				Haven!</h2>
			<p class="text-center text-white"
				style="font-size: 25px; font-family: 'Edu AU VIC WA NT Hand', cursive;">Dive
				into a world of stories and knowledge at EBook Haven. Happy reading!</p>
		</div>
	</div>

	<!-- Start of Recent Book -->
	<div class="container">
		<h3 class="text-center p-2">Recent Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao2 = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center text-white"
						style="background-color: #273746">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-5">View details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign mx-1"></i><%=b.getPrice()%></a>
						</div>

						<p>
							<%
							} else {
							%>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus mx-1"></i>Add to cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus mx-1"></i>Add to cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-1">View</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign mx-1"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>

		<div class="text-center my-2">
			<a href="all_recent_book.jsp" class="btn btn-primary">View all</a>
		</div>
	</div>

	<!-- End of Recent Book -->
	<hr>
	<!-- Start of New Book -->
	<div class="container">
		<h3 class="text-center p-2">New Book</h3>
		<div class="row">


			<%
			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> list = dao.getNewBook();

			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p>
							<%=b.getBookName()%>
						</p>
						<p>
							<%=b.getAuthor()%>
						</p>
						<p>
							Category:<%=b.getBookCategory()%>
						</p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus mx-1"></i>Add to cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus mx-1"></i>Add to cart</a>

							<%
							}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-1">View</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign mx-1"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center my-2">
			<a href="all_new_book.jsp" class="btn btn-primary">View all</a>
		</div>
	</div>

	<!-- End of New Book -->
	<hr>

	<!-- Start of Old Book -->
	<div class="container">
		<h3 class="text-center p-2">Old Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao3 = new BookDAOimpl(DBconnect.getConn());
			List<BookDtls> list3 = dao2.getOldBooks();

			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign mx-1"></i><%=b.getPrice()%></a>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>

		<div class="text-center my-2">
			<a href="all_old_book.jsp" class="btn btn-primary">View all</a>
		</div>
	</div>

	<!-- End of Old Book -->

	<%@include file="component/footer.jsp"%>
</body>
</html>
