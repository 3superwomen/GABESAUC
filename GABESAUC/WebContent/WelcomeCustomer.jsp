<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form method="post" action="UpdateProfile.jsp"> <input
style="font-family: Arial Black; color: black;" name="UpdateProfile"
value="Update Profile" type="Submit"><br>
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
		<%}
		}
	}
	catch(IllegalStateException ie){
		 out.println(ie.getMessage());
	}%>
<form method="post" action="LeaveFeedback/LeaveFeedback.jsp"> <input
style="font-family: Arial Black; color: black;" name="LeaveFeedback"
value="Leave Feedback" type="Submit">
</form>
<form method="post" action="LeaveFeedback/ViewFeedback.jsp"> <input
style="font-family: Arial Black; color: black;" name="ViewFeedback"
value="View My Feedback" type="Submit">
</form>
<form method="post" action="ExitCustomer.jsp"> <input
style="font-family: Arial Black; color: black;" name="Exit"
value="Exit" type="Submit">
</form>
</body>
</html>

