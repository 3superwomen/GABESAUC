<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="item" class="gabes.Item" scope="session"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Monthly Commission Income Reports</title>
</head>
<body>
<h2>Sales Summary Report </h2>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2" cellspacing="2">
<tbody>
	<tr>
	<td style="vertical-align: top; text-align: center;">Category</td>
    <td style="vertical-align: top; text-align: center;">Item ID</td>
    <td style="vertical-align: top; text-align: center;">Item Name</td>
    <td style="vertical-align: top; text-align: center;">Current Bid</td>
<!--     <td style="vertical-align: top; text-align: center;">Commission</td> -->
<!--     <td style="vertical-align: top; text-align: center;">Sub Total</td>  -->
	</tr>
	<% 
                 try{ 
                 	ResultSet rs= item.getSalesSummaryReport(); 
               	while(rs.next()){
               		%>
             <tr> 
    			<td style="vertical-align: top; text-align: center;"><%=rs.getString(1)%></td>
               	<td style="vertical-align: top; text-align: center;"><%=rs.getInt(2)%></td>
               	<td style="vertical-align: top; text-align: center;"><%=rs.getString(3)%></td>
               	<td style="vertical-align: top; text-align: center;"><%=rs.getInt(4)%></td>
<%--                 <td style="vertical-align: top; text-align: center;"><%=rs.getDouble(5)%></td>  --%>
<%--                 <td style="vertical-align: top; text-align: center;"><%=rs.getInt(5)%></td> --%>
             </tr>
       
   <%}%>
   <%}catch(IllegalStateException ise){
         out.println(ise.getMessage());} %>
</tbody>
</table>
<h3>Overall Commission Report </h3>


<body>

</body>
</body>