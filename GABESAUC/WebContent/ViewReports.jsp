<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/> 
<jsp:useBean id="item" class="gabes.Item" scope="session"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Monthly Commission Income Reports</title>
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
 </head>
 <body bgcolor = "#99ff66">
 <div class ="container"></div>
</head>
<body>
<h2>Sales Summary Report </h2>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2" cellspacing="2">
<tbody>
	<tr>
	<td style="vertical-align: top; text-align: center;">Category</td>
    <td style="vertical-align: top; text-align: center;">Item ID</td>
    <td style="vertical-align: top; text-align: center;">Item Name</td>
    <td style="vertical-align: top; text-align: center;">Final Selling Price</td>
    <td style="vertical-align: top; text-align: center;">Commission</td> 
	</tr>
	<% 
                 try{ 
                 	ResultSet rs = admin.getSalesSummaryReport(); 
                 	ResultSet rs2 = admin.getSalesTotals();
                 	ResultSet rs3 = item.getSalesSubTotals();
                 	while(rs.next()){
               		%>
             	<tr> 
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString(1)%></td>
               		<td style="vertical-align: top; text-align: center;"><%=rs.getInt(2)%></td>
               		<td style="vertical-align: top; text-align: center;"><%=rs.getString(3)%></td>
               		<td style="vertical-align: top; text-align: center;"><%=rs.getInt(4)%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDouble(5)%></td>  
             	</tr>
             	<%}%>
             		<%while(rs3.next()){
             			%>
             		<tr>
             			<td style="vertical-align: top; text-align: center;"><%=rs3.getString(1) + " Subtotal"%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%=rs3.getDouble(2)%></td>
             			<td style="vertical-align: top; text-align: center;"><%=rs3.getDouble(3)%></td>
             		</tr>
             	 	<%}%>
             	 	
  			 	<%while(rs2.next()){
              	%>
             		<tr>
             			<td style="vertical-align: top; text-align: center;"><%="Total:      "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%=rs2.getDouble(1)%></td>
             			<td style="vertical-align: top; text-align: center;"><%=rs2.getDouble(2)%></td>
             		</tr>
             	 	<%}%>
  				
   <%} catch(IllegalStateException ise){
         out.println(ise.getMessage());} %>
</tbody>
</table>
<h3>Overall Commission Report </h3>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2" cellspacing="2">
<tbody>
	<tr>
	<td style="vertical-align: top; text-align: center;">User ID</td>
    <td style="vertical-align: top; text-align: center;">Username</td>
    <td style="vertical-align: top; text-align: center;">First Name</td>
    <td style="vertical-align: top; text-align: center;">Last Name</td>
    <td style="vertical-align: top; text-align: center;">Email</td> 
    <td style="vertical-align: top; text-align: center;">Seller Rating</td> 
    <td style="vertical-align: top; text-align: center;">Commissions</td> 
	</tr>
	<% 
                 try{ 
                 	ResultSet rs= admin.getOverallCommissionReport(); 
                 	ResultSet rs2 = admin.getOverallCommissionTotal();
               	while(rs.next()){
               		%>
             <tr> 
    			<td style="vertical-align: top; text-align: center;"><%=rs.getInt(1)%></td>
               	<td style="vertical-align: top; text-align: center;"><%=rs.getString(2)%></td>
               	<td style="vertical-align: top; text-align: center;"><%=rs.getString(3)%></td>
               	<td style="vertical-align: top; text-align: center;"><%=rs.getString(4)%></td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getString(5)%></td> 
                <td style="vertical-align: top; text-align: center;"><%=rs.getInt(6)%></td> 
                <td style="vertical-align: top; text-align: center;"><%=rs.getDouble(7)%></td>  
             </tr>
             <%}%>
             <%while(rs2.next()){
              	%>
             		<tr>
             			<td style="vertical-align: top; text-align: center;"><%="Total:"%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%="                    "%></td>
             			<td style="vertical-align: top; text-align: center;"><%=rs2.getDouble(1)%></td>
             		</tr>
             <%}%>
   <%}%><% catch(IllegalStateException ise2){
         out.println(ise2.getMessage());} %>
</tbody>
</table>

<body>

</body>
</body>