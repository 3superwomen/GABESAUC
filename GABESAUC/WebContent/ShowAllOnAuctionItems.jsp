<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<head>
<style type="text/css">username
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Items On Auction</title>
</head>
<jsp:include page="printdate.jsp" /> 
<body>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
               <h1>Item List - On Auction</h1>
            <tbody>
                <tr>

                    <td style="vertical-align: top; text-align: center;">Item ID</td>
                    <td style="vertical-align: top; text-align: center;">Item Name</td>
                    <td style="vertical-align: top; text-align: center;">Category</td>
                    <td style="vertical-align: top; text-align: center;">Auction Start Date</td>
                    <td style="vertical-align: top; text-align: center;">Auction End Date</td>
                    <td style="vertical-align: top; text-align: center;">Start Price</td>
                    <td style="vertical-align: top; text-align: center;">Current Bid</td>
                    <td style="vertical-align: top; text-align: center;">Days Left</td>
                </tr>
                <%
                try{
                	ResultSet rs= customer.getItemsOnAuction();
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
                	<td style="vertical-align: top; text-align: center;">
                	<%if (rs.getString("Iname") == "Ralph Lauren dress") {%>
                		<p id="demo"></p>
                		<script>
                		var countDownDate = new Date("Dec 18, 2018").getTime();

                		var x = setInterval(function() {

                	  	var now = new Date().getTime();
                	  	var distance = countDownDate - now;

                	  	var days = Math.floor(distance / (1000 * 60 * 60 * 24));

                	  	document.getElementById("demo").innerHTML = days + "d";

                	  	if (distance < 0) {
                	    	clearInterval(x);
                	    	document.getElementById("demo").innerHTML = "EXPIRED";
                	  	}
                		}, 1000);
                		</script></td>
                <%}%>
                <%if (rs.getString("Iname").equals("Ralph Lauren dress")) {%>
                		<p id="demo"></p>
                		<script>
                		var countDownDate = new Date("Dec 18, 2018").getTime();

                		var x = setInterval(function() {

                	  	var now = new Date().getTime();
                	  	var distance = countDownDate - now;

                	  	var days = Math.floor(distance / (1000 * 60 * 60 * 24));

                	  	document.getElementById("demo").innerHTML = days + "d";

                	  	if (distance < 0) {
                	    	clearInterval(x);
                	    	document.getElementById("demo").innerHTML = "EXPIRED";
                	  	}
                		}, 1000);
                		</script></td>
                <%}%>
                <%if(rs.getString("Iname").equals("Nutribullet PRO")) {%>
                		<p id="demo2"></p>
                		<script>
                		var countDownDate2 = new Date("Jan 25, 2018").getTime();

                		var x2 = setInterval(function() {

                	  	var now2 = new Date().getTime();
                	  	var distance2 = countDownDate2 - now2;

                	  	var days2 = Math.floor(distance2 / (1000 * 60 * 60 * 24));

                	  	document.getElementById("demo2").innerHTML = days2 + "d";

                	  	if (distance2 < 0) {
                	    	clearInterval(x2);
                	    	document.getElementById("demo2").innerHTML = "EXPIRED";
                	  	}
                		}, 1000);
                		</script></td>
                <%}%><%if (rs.getString("Iname").equals("Romeo and Juliet")) {%>
                		<p id="demo3"></p>
                		<script>
                		var countDownDate3 = new Date("Mar 29, 2018").getTime();

                		var x3 = setInterval(function() {

                	  	var now3 = new Date().getTime();
                	  	var distance3 = countDownDate3 - now3;

                	  	var days3 = Math.floor(distance3 / (1000 * 60 * 60 * 24));

                	  	document.getElementById("demo3").innerHTML = days3 + "d";

                	  	if (distance < 0) {
                	    	clearInterval(x);
                	    	document.getElementById("demo3").innerHTML = "EXPIRED";
                	  	}
                		}, 1000);
                		</script></td>
                <%}%>
                
                
                
                <%}}catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }%>
</body>
</html>