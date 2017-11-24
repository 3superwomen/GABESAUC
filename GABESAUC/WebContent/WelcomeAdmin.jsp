
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form method="post" action="UserManagement/AddUser.jsp""> <input
style="font-family: Arial Black; color: black;" name="User Management"
value="User Management" type="Submit"><br>
</form>
<form method="post" action="ViewReports.jsp"> <input
style="font-family: Arial Black; color: black;" name="View Reports"
value="View Reports" type="Submit"><br>
</form>
<form method="post" action="Exit.jsp"> <input
style="font-family: Arial Black; color: black;" name="Exit"
value="Exit" type="Submit"><br>
</form>
</body>
</html>

