<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View Feedback</title>
</head>
<body>
<h2>View Feedback</h2>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2" cellspacing="2">
<tbody>
	<tr>
	<td style="vertical-align: top; text-align: center;">User Username</td>
    <td style="vertical-align: top; text-align: center;">Item ID</td>
    <td style="vertical-align: top; text-align: center;">Overall Rating</td>
    <td style="vertical-align: top; text-align: center;">Item Quality</td>
    <td style="vertical-align: top; text-align: center;">Delivery</td>
    <td style="vertical-align: top; text-align: center;">Comments</td>
	</tr>
				<%
                try{
                	ResultSet rs= customer.viewFeedback();
                	while(rs.next()){
                %>
                <tr>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("bidderno")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("itemno")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("rating")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("quality")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("delivery")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("comments")%></td>
                </tr>
        <%}%>       		
        <%} catch(IllegalStateException ise){
        out.println(ise.getMessage());
        }%>
        
</tbody>
</table>
</body>
</html>