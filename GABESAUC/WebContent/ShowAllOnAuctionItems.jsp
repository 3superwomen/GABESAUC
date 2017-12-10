<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<style type="text/css">
.button{
	background-color: #003300;
}</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Items On Auction</title>
</head>
<body>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
               <h1>Item List</h1>
            <tbody>
                <tr>

                    <td style="vertical-align: top; text-align: center;">Item ID</td>
                    <td style="vertical-align: top; text-align: center;">Item Name</td>
                    <td style="vertical-align: top; text-align: center;">Category</td>
                    <td style="vertical-align: top; text-align: center;">Auction Start Time</td>
                    <td style="vertical-align: top; text-align: center;">Auction End Time</td>
                    <td style="vertical-align: top; text-align: center;">Start Price</td>
                    <td style="vertical-align: top; text-align: center;">Current Bid</td>
                </tr>
                <%
                try{
                	ResultSet rs= customer.getItemsOnAuction();
                	while(rs.next()){
                		%>
                	<tr>
                	 <td style="vertical-align: top; text-align: center;"><%=rs.getInt("INUMBER")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("INAME")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("CATEG")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_start")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_end_date")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("startbid")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("currentbid")%></td>
              <%} }catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>
</body>
</html>