<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="item" class="gabes.Item" scope="session"/>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>
<title>User Management</title>
</head>
<body>

 <%if(!admin.isLoggedIn())
     { response.sendRedirect("../Login.jsp");} %>

<table style="text-align: left; width: 653px; height: 100px;" border="1"
    			cellpadding="2" cellspacing="2">
    			
    <br>

<h1>ITEMS NOT ON AUCTION </h1>			
	<tbody>
    		<tr>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">ITEM NUMBER</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">ITEM NAME</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">IDESCRIP </span><br> </td>
    			<td style="font-family: Arial Black;">
    			<span style="font-family: Arial Black;">CATEG</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">STATUS</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">AUC_START</span> </td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">AUC-END_date</span> </td>
    			
    		</tr>
	<%try{ 
          ResultSet rs = item.getItemWithNoBids();
         while (rs.next()) {  
        
             %>
  		     <tr>
    				 <td style="vertical-align: top; text-align: center;"><%=rs.getInt("inumber")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("iname")%><br>
    				</td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("idescrip")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("categ")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("status")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("AUC_START")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("AUC_END_DATE")%><br>
    				</td>
    				 <td style="vertical-align: top;"><span
    			style="font-family: Arial Black;"> <a href="DeleteItem_Action.jsp?inumber=<%=rs.getInt(1)%>">
                   DELETE </a><br></span> </td>
                   </tr>
    				
  	
                
 
              
       
<% }rs.close();}

    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }

%>
</body>
</html>

