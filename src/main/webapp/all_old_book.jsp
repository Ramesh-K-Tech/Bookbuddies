<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*"%>
<%@page import="com.DB.*"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_Components/allCss.jsp"%>
<style type="text/css">
.crd-ho-hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
	<%@include file="all_Components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllOldBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=" " src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 180px" class="img-thumblin">
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
							<a href=" " class="btn btn-lg ml-5 "></a> <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
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
	</div>
</body>
</html>