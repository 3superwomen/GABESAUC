<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.button{
	background-color: #003300;
}</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bidding Homepage</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<form method="post" action="ShowAllOnAuctionItems.jsp" name="showAll">
<button class="button" type = "submit" value = "searchIt">Show All On Auction Items</button>
</form>
</body>
</html>