<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
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
  .content form{
float: left;
width: 266px;
}

table#t01{
color:black;
background-color:#f1f1c1;
}
.content marquee{
	color:#ff4719
}
 </style>
 </head>
 <body bgcolor = "#99ff66">

 <%if(!customer.isLoggedIn())
     { response.sendRedirect("Login.jsp");} %>
 <div class ="container"></div>
<h1>Welcome!</h1>
<tr>
<td align="right" width="690"><a href="ExitCustomer.jsp">Logout</a></td></tr><br>
<jsp:include page="printdate.jsp" />  	

<form method="post" action="EditProfile.jsp"> <input
style="font-family: Arial Black; color: black;" name="EditProfile"
value="Edit Profile" type="Submit"><br>
</form>
<%
try {
	ResultSet rs2 = customer.getCustomerInfo2();
	while(rs2.next()){
		if(rs2.getString("isSeller").charAt(0) == 'Y'){%>
			<form method="post" action="SellingManagement/sellingMg.jsp"> <input
					style="font-family: Arial Black; color: black;" name=SellingManagement"
					value="Selling Management" type="Submit"><br>
		    </form>
		<%}%>
		<%if(rs2.getString("isBidder").charAt(0) == 'Y'){%>
			<form method="post" action="BiddingManagement.jsp"> 
			<input style="font-family: Arial Black; color: black;" name="BiddingManagement" 
			value="Bidding Management" type="Submit">
		</form> 
		<%}%>
		 <%if(rs2.getString("isSeller").charAt(0) == 'Y'){%>
		<form method="post" action="LeaveFeedback/ViewFeedback.jsp">
		<input
		style="font-family: Arial Black; color: black;" name="ViewFeedback"
		value="View My Feedback" type="Submit">
		</form>
		<%}%>
	<%} }
	catch(IllegalStateException ie){
		 out.println(ie.getMessage());
	}%>
	
<form method="post" action="LeaveFeedback/LeaveFeedback.jsp"> <input
style="font-family: Arial Black; color: black;" name="LeaveFeedback"
value="Leave Feedback" type="Submit">


</body>
</html>

