
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="admin" class= "gabes.Admin" scope="session"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
div.container{
   width:100%
   border: 1px solid gray
 }
 header,footer{
 padding: lem;
 color:white;
 background-color: black;
 clear:left;
 text-align:center
 }
 </style>
 </head>
 <body bgcolor = "#99ff66">
  <%if(!admin.isLoggedIn())
     { response.sendRedirect("Login.jsp");} %>
 <div class ="container"></div>
<h1>Welcome!</h1>
<tr>
<td align="right" width="690"><a href="ExitAdmin.jsp">Logout</a></td></tr><br>
<jsp:include page="printdate.jsp" /> 
<form method="post" action="UserManagement/AddUser.jsp""> <input
style="font-family: Arial Black; color: black;" name="User Management"
value="User Management" type="Submit"><br>
</form>
<form method="post" action="UserManagement/DeactivateUser.jsp""> <input
style="font-family: Arial Black; color: black;" name="Deactivate User"
value="Deactivate/Reactivate Users" type="Submit"><br>
</form>
<form method="post" action="ViewReports.jsp"> <input
style="font-family: Arial Black; color: black;" name="View Reports"
value="View Reports" type="Submit"><br>
</form>
<form method="post" action="ItemManagement/DeleteItem.jsp"> <input
style="font-family: Arial Black; color: black;" name="Delete Item"
value="Delete Item" type="Submit"><br>
</form>
</body>
</html>

