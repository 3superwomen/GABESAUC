<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Item</title>
</head>
<body>
<form  method="post" action="addItem_action.jsp">
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
           
                        <h1>Add Item</h1>
                    <tbody>
                        <tr>
                            <td style="vertical-align: top;text-align: center;">Item Name<br>
                            </td>
                            <td style="vertical-align: top;text-align: center;">
                                <input name="itemName" value=""> </td>
                        </tr>
                        <tr>
                <td style="vertical-align: top; text-align: center;">Category</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemCat" value=""> </td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Start Price</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemSPrice" value=""> </td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Auction Start Time</td>
				<td style="vertical-align: top; text-align: center;"><p id="demo"></p> </td>
				<script>var d = new Date();
				document.getElementById("demo").innerHTML = d.toDateString();</script>
                <tr>
                <td style="vertical-align: top; text-align: center;">Auction End Time (YYYY-MM-DD)</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemAucEY" value=""></td>
                <td style="vertical-align: top; text-align: center;">-</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemAucEM" value=""></td>
                <td style="vertical-align: top; text-align: center;">-</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemAucED" value=""></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Description</td>
                <td style="vertical-align: top; text-align: center;"><textarea rows="4" cols="50" name="itemDesc">Enter description here...</textarea></td>
                    </tbody>
                </table><br>
                <input value="Add" type="submit">&nbsp; 
                <input value="Reset" type="reset">
                
               
</form>
<form method="post" action="sellingMg.jsp">
<%
                String customerId = Integer.toString(customer.getId());%>
                          <input name="cusnumber" type="hidden" value ="<%=customerId%>">
                            <button class="button" type = "submit" value = "return">Return Back to Main Page</button>
                        </form>
</body>
</html>