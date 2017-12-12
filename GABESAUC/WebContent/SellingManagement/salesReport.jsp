<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
 }</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sales Report</title>
</head>
<%@ page language="java" import="java.sql.*" %>
<%@page import="gabes.Customer"%>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<body bgcolor = "#ccffcc">
<div class ="container">
 <header>
 <h1> WELCOME TO GABES </h1>
 </header>
 </div>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
               <h1>Sales Report</h1>
            <tbody>
                <tr>

                    <td style="vertical-align: top; text-align: center;">Item ID</td>
                    <td style="vertical-align: top; text-align: center;">Item Name</td>
                    <td style="vertical-align: top; text-align: center;">Auction Start Time</td>
                    <td style="vertical-align: top; text-align: center;">Auction End Time</td>
                    <td style="vertical-align: top; text-align: center;">Start Price</td>
                    <td style="vertical-align: top; text-align: center;">Final Price</td>
                    <td style="vertical-align: top; text-align: center;">Profit</td>
                </tr>
                <%
                String customerId = Integer.toString(customer.getId());
                try{
                	int sum =0;
                	ResultSet rs= customer.getItemListForSold();
                	while(rs.next()){
                		%>
                		<tr>
                	 <td style="vertical-align: top; text-align: center;"><%=rs.getInt("INUMBER")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("INAME")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_start")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_end_date")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("startbid")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("currentbid")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt(7)%></td>	
                 	
                        </tr>  	
                		<%  sum=sum+rs.getInt(7);
                		}%>
                		
                		</tbody></table>
                		<tr>
                		<td style="vertical-align: top; text-align: center;"><Strong>Total Profit: </Strong></td>
                		<td style="vertical-align: top; text-align: center;"><Strong><%=sum%></Strong></td></tr>
                		<form method="post" action="sellingMg.jsp">
                            <input name="cusnumber" type="hidden" value ="<%=customerId%>">
                            <button class="button" type = "submit" value = "return">Return Back to Main Page</button>
                        </form>
              <%} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>
</body>
</html>