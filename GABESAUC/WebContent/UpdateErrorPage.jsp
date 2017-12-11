<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Profile Error</title>
</head>
<body>
<h2>An exception has occurred!</h2>
<table><tr>
<td>Exception Class:</td>
<td><%=exception.getClass() %></td>
</tr>
<tr>
<td>Message: </td>
<td><%=exception.getMessage() %></td>
</tr>
</table>
<br>
<hr>
Go back to update profile correctly!
<form name ="update2" action="UpdateProfile.jsp">
<input type="submit" name="button2" value="Update Profile Again">
</form>
<br>
<hr>

</body>
</html>