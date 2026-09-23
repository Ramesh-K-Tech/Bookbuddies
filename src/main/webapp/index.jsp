<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*"%>
<%@page import="com.DB.*"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookBuddies</title>
<%@include file="all_Components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/ebook.png");
	height: 80vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho-hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body style="background-color: #cacccb;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_Components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center">BookBuddies</h2>
	</div>


	<!-- start Recent Book-->

	<div class="container-fluid">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=" " src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<b><%=b.getAuthor()%></b>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
						
						<p>
							<b>Categories : <%=b.getBookCategory()%></b>
						</p>
						<div class="row">
						    <a href=" " class="ml-5"></a>
							<a href="view_books.jsp?bid=<%=b.getBookId()%> "
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=" "
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<p>
							<b>Categories : <%=b.getBookCategory()%></b>
						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-5"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%> "
								class="btn btn-success btn-sm ml-1">View Details</a><a href=" "
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
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
		<div class="text-center mt-3">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<!-- End Recent Book -->
	<hr>
	<!-- start New Book-->

	<div class="container-fluid">
		<h3 class="text-center">New Books</h3>
		<div class="row">

			<%
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=" " src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<p>
							<b><%=b.getAuthor()%></b>
						</p>
						<p>
							<b>Categories:<%=b.getBookCategory()%></b>
						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-5"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=" "
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%> </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>

	<!-- End New Book -->
	<hr>
	<!-- start Old Book-->

	<div class="container-fluid">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			List<BookDtls> list3 = dao.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=" " src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<p>
							<b><%=b.getAuthor()%></b>
						</p>
						<p>
							<b>Categories:<%=b.getBookCategory()%></b>
						</p>
						<div class="row">
							<a href=" " class="ml-5"></a> <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=" "
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- End Old Book -->
	<hr>
	<%-- 	<%@include file="all_component/footer.jsp"%> --%>
</body>
</html>