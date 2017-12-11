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
<title>Selling Homepage</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<form method="post" action="listItems.jsp" name="listIt">
<button class="button" type = "submit" value = "ListItems">List Items</button>
</form>
<form method="post" action="salesReport.jsp" name="sales">
<button class="button" type = "submit" value = "sales">Sales Report</button>
</form>
<form method="post" action="sellerSearch.jsp" name="search">
<button class="button" type = "submit" value = "searchIt">Check Maketing Price</button>
</form>
<form method="post" action="addItem.jsp" name="addIt">
<button class="button" type = "submit" value = "addItem">Add Items</button>
</form>
<form method="post" action="http://localhost:8080/GABESAUC/WelcomeCustomer.jsp" name="menu">
<button class="button" type = "submit" value = "bMenu">Back to Menu</button>
</form>
</body>
</html>