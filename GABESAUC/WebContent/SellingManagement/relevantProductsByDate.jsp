<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Relevant Products</title>
<style type="text/css">
	</style>
</head>
<body>
<h1>Item List</h1>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
            <tbody>
                <tr>

                   
                    <td style="vertical-align: top; text-align: center;">Item Name</td>
                    <td style="vertical-align: top; text-align: center;">Category</td>
                    <td style="vertical-align: top; text-align: center;">Auction Start Time</td>
                    <td style="vertical-align: top; text-align: center;">Auction End Time</td>
                    <td style="vertical-align: top; text-align: center;">Status</td>
                    <td style="vertical-align: top; text-align: center;">Start Price</td>
                    <td style="vertical-align: top; text-align: center;">Current/Final Bid</td>
                </tr>
                <%try{
                	String cat = (String)session.getAttribute("ct");
                	String inm = (String)session.getAttribute("im");
                	ResultSet rs= customer.getRelevantProductsByDate(cat, inm);
                	while(rs.next()){ %>
                	
                	<tr>
                
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("INAME")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("CATEG")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_start")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_end_date")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getString("status")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("startbid")%></td>
                	<td style="vertical-align: top; text-align: center;"><%=rs.getInt("currentbid")%></td>
                	 </tr>  	
                		<%}%></tbody></table>
                		
              <%} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>
    <form method="post" action="addItem.jsp">
<%
                String customeri = Integer.toString(customer.getId());%>
                          <input name="cusnumber" type="hidden" value ="<%=customeri%>">
                            <button class="button" type = "submit" value = "return">Go To Add an Item</button>
                        </form>
                        <form method="post" action="sellerSearch.jsp">
<%
                String cusId = Integer.toString(customer.getId());%>
                          <input name="cusnumber" type="hidden" value ="<%=cusId%>">
                            <button class="button" type = "submit" value = "return">Search Another Item</button>
                        </form>
 <form method="post" action="sellingMg.jsp">
<%
                String customerId = Integer.toString(customer.getId());%>
                          <input name="cusnumber" type="hidden" value ="<%=customerId%>">
                            <button class="button" type = "submit" value = "return">Return Back to Main Page</button>
                        </form>   
    
</body>
</html>
                
</body>
</html>