<%@ page language="java" import="java.sql.*,gabes.*"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="item" class="gabes.Item" scope="session"/> 
<jsp:setProperty name="item" property="*"/> 

<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title></title>
</head>
<body>
<div style="text-align: left;"> </div>
<big style="font-family: Times New Roman,Times,serif;"><big><big>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Leave Feedback for
The Seller</big></big></big><br
style="font-family: Times New Roman,Times,serif;">
<br style="font-family: Times New Roman,Times,serif;">
<form style="font-family: Arial Black;" method="post"
action="RateSeller_Action.jsp" name="RateForm">
<big style="font-family: Times New Roman,Times,serif;"><big>Item
Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%=item.getInumber()%></font> <br>
ItemName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="ItemName" value="<%=item.getIname()%>"readonly> <br>
Overall
Rating&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;
<select>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
<br>Item Quality&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; <input name="itemQuality" type="radio"> 1 <input
name="itemQuality" type="radio"> 2 <input name="itemQuality"
type="radio"> 3 <input name="itemQuality" type="radio"> 4 <input
name="itemQuality" type="radio"> 5 <br>
Delivery&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp; <input name="delivery" type="radio"> 1 <input
name="delivery" type="radio"> 2 <input name="delivery" type="radio">
3 <input name="delivery" type="radio"> 4 <input name="delivery"
type="radio">
5</big></big><big style="font-family: Times New Roman,Times,serif;"><big><br>
Comments</big></big><span
style="font-family: Times New Roman,Times,serif;">&nbsp; </span><big
style="font-family: Times New Roman,Times,serif;"><big><br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; </big></big><textarea
style="font-family: Times New Roman,Times,serif; font-size: 20px;"
rows="20" cols="40" name="comment" form="usrform">Enter your Feedback Here </textarea><big style="font-family: Times New Roman,Times,serif;"><big>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </big></big><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; <br>
</div>
<input style="color: black;" name="Rate" value="Rate" type="submit"><input
style="color: black;" name="Cancel" value="Cancel" type="reset"> </form>
<br>
<br>

</body>
</html>

