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
<form style="font-family: Arial Black;" method="post" action="addItem_action.jsp">
<table style="text-align: left; width: 100%;" border="1"
                       cellpadding="2" cellspacing="2">
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
                <td style="vertical-align: top; text-align: center;"><input type="date" name= "itemAucS"value="<?php echo date('Y-m-d');?>" readonly></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Auction End Time</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemAucE" value=""></td>
                <tr>
                <td style="vertical-align: top; text-align: center;">Description</td>
                <td style="vertical-align: top; text-align: center;"><input name="itemDesc" value=""></td>
                    </tbody>
                </table><br>
                <input value="Add" type="submit">&nbsp; 
                <input value="Reset" type="reset"><br>
                <br>
</form>
</body>
</html>