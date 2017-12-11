<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Delete User</title>
</head> 
<body>
<form style="font-family: Arial Black;" method="post"
action="DeleteUser_Action.jsp" name="Delete">
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>
<h1>Delete User<br>
</h1>
<form style="font-family: Arial Black;" method="post"
action="DeleteUser_Action.jsp" name="DeleteForm">
Username&nbsp;&nbsp; &nbsp; &nbsp;
<input name="username" value=""> <br>

</div>
<input style="color: black;" name="Delete" value="Delete" type="submit">		
</tbody>
</table>
</form>
</body>
</html>

