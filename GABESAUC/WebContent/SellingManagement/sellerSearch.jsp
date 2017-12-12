<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Marketing Price</title>
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
<form  method="post" action="relevantProducts.jsp">
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
           
                        <h1>Find Marketing Price</h1>
                    <tbody>
                        <tr>
                            <td style="vertical-align: top;text-align: center;">Item Name<br>
                            </td>
                            <td style="vertical-align: top;text-align: center;">
                                <input name="itemName" value="" required> </td>
                        </tr>
                        <tr>
                <td style="vertical-align: top; text-align: center;">Category</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemCat" value="" required> </td>
                <tr>
                </tbody>
                </table><br>
                <button class="button" type = "submit" value = "add">Search</button>
                <button class="button" type = "reset" value = "return">Reset</button>
                
               
</form>
<form method="post" action="sellingMg.jsp">
<%
                String customerId = Integer.toString(customer.getId());%>
                          <input name="cusnumber" type="hidden" value ="<%=customerId%>">
                            <button class="button" type = "submit" value = "return">Return Back to Main Page</button>
                        </form>
</body>
</html>