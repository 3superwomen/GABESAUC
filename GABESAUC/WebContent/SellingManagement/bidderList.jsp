<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bidders List</title>
<style type="text/css">
.button{
	background-color: #003300;
}
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
 }	</style>
</head>
<body bgcolor = "#ccffcc">
<div class ="container">
 <header>
 <h1> WELCOME TO GABES </h1>
 </header>
 </div>
<h1>List of Bidders</h1>
<%
               int itemno =Integer.parseInt(request.getParameter("itemNum"));

try{
	
	ResultSet rs= customer.getItemInfo(itemno);
	
	while(rs.next()){%>
		<h2>Item ID: <%=rs.getInt("INUMBER") %></h2>
		<h3>(<%=rs.getDate("auc_start") %> --- <%=rs.getDate("auc_end_date")%>)</h3>
	<%}rs.close();} catch(IllegalStateException ise){
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
                		
              <%rs.close();} catch(IllegalStateException ise){
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
String winner ="" ;
%>
<td style="vertical-align: top; text-align: center;">Winner</td>

<%
if(num==0){
	%>
	<td style="vertical-align: top; text-align: center;"><%="N/A"%></td>
	<td style="vertical-align: top; text-align: center;"><%="N/A"%></td>
	</tbody></table>
	            <form method="post" action="listItems.jsp">
                            <input name="itemnumber" type="hidden" value ="<%=itemno%>">
                            <button class="button" type = "submit" value = "return">Return Back to Item List</button>
                        </form>
<%}
else{
try{
	
	ResultSet rs= customer.getCustomerInfo(num);
	
	while(rs.next()){
	%>
	
		<td style="vertical-align: top; text-align: center;"><%=rs.getString("USERNAME")%></td>
		<td style="vertical-align: top; text-align: center;"><%=curbid%></td>
		
	<%}%></tbody></table>
            <form method="post" action="listItems.jsp">
                            <input name="itemnumber" type="hidden" value ="<%=itemno%>">
                            <button class="button" type = "submit" value = "return">Return Back to Item List</button>
                        </form>

	<%rs.close();} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }}%>  
</body>
</html>