<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Deactivate/Reactivate User</title>
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
<body>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>
 <a href="../ExitAdmin.jsp" style="color:black">Logout</a></td></tr><br>
<h1>Deactivate and Reactivate Users<br>
</h1>
<form style="font-family: Arial Black;" method="post"
action="DeactivateUser_Action.jsp" name="DeactivateForm">
Username&nbsp;&nbsp; &nbsp; &nbsp;
<input name="username" value=""> <br>
</div>
<input style="color: black;" name="Deactivate" value="Deactivate" type="submit">		
</tbody>
</table>

</form>
<form style="font-family: Arial Black;" method="post"
action="ReactivateUser_Action.jsp" name="ReactivateForm">
Username&nbsp;&nbsp; &nbsp; &nbsp;
<input name="username" value=""> <br>
</div>
<input style="color: black;" name="Reactivate" value="Reactivate" type="submit">		
</tbody>
</table>
</form>
</body>
</html>

