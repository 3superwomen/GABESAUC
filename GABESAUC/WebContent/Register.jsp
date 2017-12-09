<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>

<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Login </title>
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
 <div class ="container">
 <header>
 <h1> CREATE YOUR ACCOUNT</h1>
 </header>
<form style=""font-family: Times New Roman,Times,serif";" method="post"action="Register_Action.jsp" name="RegisterForm">
<table align="center">
<tr>
	<th align "right"> ID : </th> 
	<td> <input name="id" size ="25%" height = "100" value= <%=admin.seqcustId()%> readonly></td>
</tr>
<tr>
	<th align "right"> Username : </th> 
	<td> <input name="username" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Firstname : </th> 
	<td> <input name="fname" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Lastname : </th> 
	<td> <input name="lname" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Phone No: </th> 
	<td> <input name="phoneno" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Email Address : </th> 
	<td> <input name="emailad" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Password : </th> 
	<td> <input name="password" size ="25%" height = "100" value= "" ></td>
</tr>
<tr>
	<th align "right"> Retype Password : </th> 
	<td> <input name="password2" size ="25%" height = "100" value= "" ></td>
</tr>
<td colspan="4" align ="right">
   <input style="color: black;" name="Confirm" value="Confirm" type="submit">
</td>
 </div>
 </table>
 </form>
</body>
</html>