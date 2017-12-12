<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Item Information</title>
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
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
               <h1>Item Information</h1>
               <%
               int itemno =Integer.parseInt(request.getParameter("itemNum"));

                try{
                	
                	ResultSet rs= customer.getItemInfo(itemno);
               
                	while(rs.next()){
                	//	out.println(rs.getInt("INUMBER"));
                		%>
            <tbody>
                <tr>
                <td style="vertical-align: top; text-align: center;">Item ID</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getInt("INUMBER")%></td>
          		<tr>
                <td style="vertical-align: top; text-align: center;">Item Name</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getString("INAME")%></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Category</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getString("CATEG")%></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Start Price</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getInt("startbid")%></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Auction Start Time</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_start")%></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Auction End Time</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_end_date")%></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Description</td>
                <td style="vertical-align: top; text-align: center;"><%=rs.getString("IDESCRIP")%></td>
               <%}%></tbody></table>
            <form method="post" action="listItems.jsp">
                            <input name="itemnumber" type="hidden" value ="<%=itemno%>">
                            <button class="button" type = "submit" value = "return">Return Back to Item List</button>
                        </form>
              <%} catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>    
              
</body>
</html>