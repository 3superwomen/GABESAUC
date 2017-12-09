<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="rates" class="gabes.Rates" scope="session"/> 
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="rates" property="itemNo"/>
<% 
int value = 0;
String rating  = request.getParameter("rating");
String quality = request.getParameter("quality");
String delivery = request.getParameter("delivery");
StringBuffer text = new StringBuffer(request.getParameter("comments"));
String comments = text.toString();
if((quality == null))
{   
	value = 1;
	 
}
 if((delivery == null))
{  
 value = 2;

 }
if((comments.equals("")))
{
	value =3;
}
 
 if(value!=0)
 {
	 response.sendRedirect("RateSeller.jsp?value="+ value);
 }
 else
 {
	 
    try{
	             	int r = Integer.parseInt(rating);
	                int q= Integer.parseInt(quality);
	                int d = Integer.parseInt(delivery);
	             	rates.setDelivery(d);
	            	rates.setRating(r);
	      			rates.setBidderNo(customer.getId());
				    rates.setQuality(q);
	                rates.setComments(comments);
	                rates.rateSeller();
	                response.sendRedirect("RateSeller.jsp");
     }
 
 
	catch(SQLException e){
	          String error = e.getMessage();
	         response.sendRedirect("RateSeller.jsp?Error="+ error);
  }
    
	
 }
%>