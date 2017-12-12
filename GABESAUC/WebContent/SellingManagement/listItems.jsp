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
<title>Item List</title>
</head>
<body bgcolor = "#ccffcc">
<div class ="container">
 <header>
 <h1> WELCOME TO GABES </h1>
 </header>
 </div>
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
                    <td style="vertical-align: top; text-align: center;">Status</td>
                    <td style="vertical-align: top; text-align: center;"></td>
                    <td style="vertical-align: top; text-align: center;"></td>
                </tr>
                <%
                String customerId = Integer.toString(customer.getId());
                try{
                	ResultSet rs= customer.getItemList();
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
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("status")%></td>	
                	<td ><form method="post" action="itemInfo.jsp">
                            <input name="itemNum"type="hidden" value ="<%=rs.getInt("INUMBER")%>">
                            <button class="button" type = "submit" value = "itemDetail">Details</button>
                        </form>
                        </td>
                    <td ><form method="post" action="bidderList.jsp">
                    <input name="itemNum"type="hidden" value ="<%=rs.getInt("INUMBER")%>">
                           <button class="button" type = "submit" value = "bidderL">Bidder List</button>
                        </form>
                        </td> 
                        </tr>  	
                		<%}%></tbody></table>
                		<form method="post" action="sellingMg.jsp">
                            <input name="cusnumber" type="hidden" value ="<%=customerId%>">
                            <button class="button" type = "submit" value = "return">Return Back to Main Page</button>
                        </form>
              <%} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>
</body>
</html>