<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bidders List</title>
</head>
<body>
<h1>List of Bidders</h1>
<%
               int itemno =Integer.parseInt(request.getParameter("itemNum"));
try{
	
	ResultSet rs= customer.getItemInfo(itemno);
	
	while(rs.next()){%>
		<h2>Item ID: <%=rs.getInt("INUMBER") %></h2>
		<h3>(<%=rs.getDate("auc_start") %> --- <%=rs.getDate("auc_end_date")%>)</h3>
	<%}} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>    

<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
               <tbody>
                <tr>
                <td style="vertical-align: top; text-align: center;">Bidding Time</td>
                <td style="vertical-align: top; text-align: center;">Username</td>
                <td style="vertical-align: top; text-align: center;">Max Bid Limit</td>
                
                </tr>
                 <%
                try{
                	ResultSet rs= customer.getBidderList(itemno);
                	while(rs.next()){
                		%>
                		<tr>
                	 <td style="vertical-align: top; text-align: center;"><%=rs.getTimestamp("BIDDATE")%></td>
                	  <td style="vertical-align: top; text-align: center;"><%=rs.getString("username")%></td>
                	   <td style="vertical-align: top; text-align: center;"><%=rs.getInt("maximumbidlimit")%></td>
                	   <tr>
                	   
                	   <%}%>
                		
              <%} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }
    
    %>

<% int num = 0;
int curbid =0;
try{
	
	ResultSet rs= customer.getItemInfo(itemno);
	
	while(rs.next()){
	 num = rs.getInt("WINNER");
	 curbid =rs.getInt("currentbid");
	}} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    } 
customer.setId(num);
out.println(num);
try{
	
	ResultSet rs= customer.getCustomerInfo();
	
	while(rs.next()){
	%>
	<td style="vertical-align: top; text-align: center;">Winner</td>
		<td style="vertical-align: top; text-align: center;"><%=rs.getString("USERNAME")%></td>
		
		
	<%}} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>  
      <td style="vertical-align: top; text-align: center;"><%=curbid%></td>
  </tbody></table>
<!-- <form method="post" action="listItems.jsp"> -->
               
<!--                             <button class="button" type = "submit" value = "return">Return Back to Item List</button> -->
<!--                         </form> -->
</body>
</html>