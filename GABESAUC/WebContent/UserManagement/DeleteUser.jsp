<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Delete User</title>
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
  .content form{
float: left;
width: 266px;
}
table#t01{
color:black;
background-color:#f1f1c1;
}
.content marquee{
	color:#ff4719
}
 </style>
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

