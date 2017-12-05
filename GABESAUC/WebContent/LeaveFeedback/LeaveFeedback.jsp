
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/>
<jsp:useBean id="item" class="gabes.Item" scope= "session"/>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">

</head>
<body>

    			
    <br>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
List of Items Bought</h1>
	
	<table style="text-align: left; width: 653px; height: 100px;" border="1"
    			cellpadding="2" cellspacing="2">
        	       <tbody>
    		<tr>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Item ID</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Item Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Category</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Auction Start Date</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Auction End time</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Start Price</span> </td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Sold Price</span> </td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Seller Username</span> </td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Seller Email</span> </td>
                
    			</tr>
    			
    			  	
	<% boolean validUser = customer.isLoggedIn();
           if(!validUser) { 	
              response.sendRedirect("../Login.jsp");}
      else
       {
    	try{
 
		  item.setWinner(customer.getId());
          ResultSet rs = item.getListOfItemsBought();
          
         while (rs.next()) { 
        	  item.setSellerNo(rs.getInt("sellerno"));
        	      %>    
  		           	
    				 <td style="vertical-align: top; text-align: center;"><%=rs.getInt("inumber")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("iname")%><br>
    				</td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("categ")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_start")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getDate("auc_end_date")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getDouble("startbid")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getDouble("currentbid")%><br>
    				</td>
    				
    			   
                       
    				<% 
                         ResultSet rs1 = item.getSellerInfo();         
                         while (rs1.next()) { %>
                         
    				   <td style="vertical-align: top; text-align: center;"><%=rs1.getString("username")%><br>
    				   </td>
    				   <td style="vertical-align: top; text-align: center;"><%=rs1.getString("emailad")%><br>
    				   </td>
    				       <td style="vertical-align: top;"><span
    			style="font-family: Arial Black;"> <a href="RateSeller.jsp?inumber=<%=rs.getInt("inumber")%>&iname=<%=rs.getString("iname")%>">
                   rate seller </a><br></span> </td>
                 
    			
             
              </tr>
              <tr>
                
  <%}%>

              

<% rs1.close();%>
 <%  }%> </tbody>
  	</table>
    				
	<% rs.close();}

    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }
    }
    

%>

</body>

</html>



