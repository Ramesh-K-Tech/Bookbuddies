<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BookBuddies: Order Successful</title>
<%@include file="all_Components/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_Components/navbar.jsp"%>
	
     <%  User us=(User)session.getAttribute("userobj");
         CartDAO dao=new CartDAOImpl(DBConnect.getConn());
         dao.deleteCart(us.getId());
     %>

	<div class="contain text-center mt-5">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully</h2>
		<h5>With in 7 days Your Product will be Delivered In Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>
</body>
</html>