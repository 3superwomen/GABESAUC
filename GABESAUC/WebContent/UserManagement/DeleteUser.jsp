<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Delete User</title>
</head>
<body>
<form style="font-family: Arial Black;" method="post"
action="DeleteUser_Action.jsp" name="Delete">
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>
<%  String value = request.getParameter("value");
if(value!=null)
   out.println("PASSWORD DOES NOT MATCH RETYPE PASSWORD");%>			
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Delete User</h1>
<table style="text-align: left; width: 653px; height: 100px;" border="1">			
	<tbody>
    		<tr>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">User ID</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">User Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">First </span><br
    			style="font-family: Arial Black;">
    			<span style="font-family: Arial Black;">Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Last Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Email</span> </td>
    			<td style="vertical-align: top; font-family: Arial Black;">Delete<br>
    			</td>
    		</tr>
	<%try{ 
          ResultSet rs = admin.getCustomers();
         while (rs.next()) { %>
  		     <tr>
    				 <td style="vertical-align: top; text-align: center;"><%=rs.getInt("id")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><input name="username" value="<%=rs.getString("username")%>"><br>
    				</td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("fname")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("lname")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("emailad")%><br>
    				</td>
             		<td style="vertical-align: top; text-align: center;"><input style="color: black;" name="Delete" value="Delete" type="submit"></input>
    				</td>
              </tr>
                
  <%}%>
  <% rs.close();}

    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    } %>
</tbody>
</table>
</form>
</body>
</html>

