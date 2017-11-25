
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form method="post" action="UpdateProfile.jsp""> <input
style="font-family: Arial Black; color: black;" name="UpdateProfile"
value="Update Profile" type="Submit"><br>
</form>
<form method="post" action="SellingManagement.jsp"> <input
style="font-family: Arial Black; color: black;" name=SellingManagement"
value="Selling Management" type="Submit"><br>
</form>
<form method="post" action="ExitCustomer.jsp"> <input
style="font-family: Arial Black; color: black;" name="Exit"
value="Exit" type="Submit">
<form method="post" action="ViewFeedback.jsp"> <input
style="font-family: Arial Black; color: black;" name="ViewFeedback"
value="View My Feedback" type="Submit">
</form>
</body>
</html>

