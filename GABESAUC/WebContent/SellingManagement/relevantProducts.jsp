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
 }
</style>
</head>
<body bgcolor = "#ccffcc">
<div class ="container">
 <header>
 <h1> WELCOME TO GABES </h1>
 </header>
 </div>
<%try{
                	String cat = request.getParameter("itemCat");
                	String inm = request.getParameter("itemName");
                	session.setAttribute("ct", cat );
                	session.setAttribute("im", inm );%>
<h1>Item List</h1>
<a href="relevantProductsByDate.jsp">By Date</a>
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
                <%
                	ResultSet rs= customer.getRelevantProducts(cat, inm);
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