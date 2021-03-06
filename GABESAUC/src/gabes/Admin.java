package gabes;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

/**
 * Use the SQL script file provided in this folder to create a NEW (slightly different) 
 * version of the ProductDeals database on Oracle and insert data into all tables. The 
 * script also creates an SQL function.
 */
public class Admin implements Serializable {
  /**
   * The following fields correspond to the ADMINS table in the Oracle database
   */
  private String username;
  private String password;
  private PreparedStatement pstmt;
  private Statement stmt;
  private ResultSet result;
  private Connection con;
  private CallableStatement callStmt;
  /**
   * The following stores whether or not the admin has successfully logged
   * to the System
   */    
  private boolean loggedIn = false;
  
  
  /**
   * A setter for class field username
   * @param username the username to set
   */
  public void setUsername(String username) {
    this.username= username;
  }
  
  /**
   * A getter for class field username
   * @return the username
   */
  public String getUsername() {
    return username;
  }
  
  /**
   * A setter for class field password
   * @param password the password to set
   */
  public void setPassword(String password) {
    this.password = password;
  }
  
  /**
   * A getter for class field password
   * @return the password
   */
  public String getPassword() {
    return password;
  }
  
  
  /**
   * A default constructor ... no need for other constructors
   */
  public Admin() {
  }
  
  /**
   * This method and creates and returns a Connection object to the database. 
   * All other methods that need database access should call this method.
   * @return a Connection object to Oracle
   */
  public Connection openDBConnection() {
    try {
      // Load driver and link to driver manager
      Class.forName("oracle.jdbc.OracleDriver");
      // Create a connection to the specified database
      con = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
                                                            "csci.cscioraclesrv.ad.csbsju.edu","TEAM5", "mnz");
      return con;
    } catch (Exception E) {
      E.printStackTrace();
    }
    return null;
  }
  
  /**
   * A getter for class field loggedIn
   * @return whether the Customer is logged in or not
   */
  public Boolean isLoggedIn() {
    return this.loggedIn;
  }
  
  /**
   * When called, this method uses a Statement object to query table Admins
   * for the admin whose username and password are stored in class instance
   * fields username and password, respectively.
   * If a match is found, the method sets loggedIn class field to true and 
   * returns true; otherwise, loggedIn class field is set to false and false is returned 
   * 
   * @return true or false based on whether the login information of the admin
   * stored in class fields username and password exist in Table ADMINS
   */
  public boolean login() {
	  con = openDBConnection();
    try{
     pstmt=  con.prepareStatement("SELECT * FROM TEAM5.ADMINS WHERE USERNAME =? AND PASSWORD=?");
     pstmt.clearParameters();
     pstmt.setString(1,this.username);
     pstmt.setString(2, this.password);
     result= pstmt.executeQuery();
    if(result.next()) {
   	   this.loggedIn = true;  
    }
     return this.loggedIn;
    }
    catch (Exception E) {
           E.printStackTrace();
           return false;
       }
   }
      
  /**
   * When called, this method uses a Preparestatement object to call the customer sequence to create a new unique customer id 
   * 
   * @return the unique int if **/ 
  public int seqcustId()  {
	  int nextId =0;
	  con = openDBConnection();
	       try{
	    	   String custId = "select CUST_ID.NEXTVAL from DUAL";
	    	   pstmt = con.prepareStatement(custId);
	    	   result= pstmt.executeQuery();
	    	   while(result.next()) {
	    	       nextId = result.getInt(1); 
	    	   }
	    	  
			} catch (Exception E) {
				E.printStackTrace();
			}
	       return nextId;
	   }
       
  
  public void deactivateUser(String username) throws SQLException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");  
	    callStmt = con.prepareCall(" {call team5.ADMIN_DEACTIVATE_USER(?,?,?)}");
	    callStmt.setString(1,String.valueOf('N'));
	    callStmt.setString(2,String.valueOf('N'));
	    callStmt.setString(3,username);
	    callStmt.execute();
	    callStmt.close();
	  } 
  
  /**
   * This method uses a Statement object to retrieve all customers
   * @return a ResultSet containing all customers 
   * @throws IllegalStateException if then method is called when loggedIn = false**/
 
  public void reactivateUser(String username) throws SQLException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");  
	    callStmt = con.prepareCall(" {call team5.ADMIN_DEACTIVATE_USER(?,?,?)}");
	    callStmt.setString(1,String.valueOf('Y'));
	    callStmt.setString(2,String.valueOf('Y'));
	    callStmt.setString(3,username);
	    callStmt.execute();
	    callStmt.close();
	  } 
  public ResultSet getCustomers()  throws IllegalStateException{
	   
      if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
       try{
    	   stmt = con.createStatement();
          String queryString = "Select id, username,fname,lname,emailad,password FROM CUSTOMER";
          result = stmt.executeQuery(queryString);
         
  }       
       
       
    catch (Exception E) {
      E.printStackTrace();
    }
      return  result;
  }
  
  /**
   * Sales summary report returns category, item id, item name, final selling price, and commission
   * @return view
   */
  
 public ResultSet getSalesSummaryReport() throws IllegalStateException{
	 if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
		 stmt = con.createStatement();
		 String queryString = "SELECT categ,inumber,iname,currentbid,(currentBid*0.05) as commision" +
				 " FROM ITEM" + 
				 " where status = 'SOLD'"
				 +" group by categ, inumber, iname, currentbid, (currentBid*0.05) order by categ";
        result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
 }
 
 
 public ResultSet getSalesTotals() throws IllegalStateException
 {
	 if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
		 stmt = con.createStatement();
		 String queryString = "SELECT sum(currentbid) as total, sum(currentbid*0.05) as finalcommission" +
				 " FROM ITEM" + 
				 " where status = 'SOLD'";
        result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result; 
 }
 
 public ResultSet getOverallCommissionTotal() throws IllegalStateException
 {
	 if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
		 stmt = con.createStatement();
		 String queryString = "SELECT sum(currentbid*0.05) as finalcommission" +
				 " FROM ITEM" + 
				 " where status = 'SOLD'";
        result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result; 
 }
 
 /**
  * Overall Commission Report returns the user id, username, first name, last name, 
  * email, seller rating, commissions, and total income.
  * @return view
  */
 public ResultSet getOverallCommissionReport() throws IllegalStateException{
	 if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
	 String queryString = "SELECT id,username,fname,lname,emailad, avg(rating) as sellerrating,sum(currentbid*0.05)/2 as finalcommission" + 
	 		" FROM ITEM ,customer, rates" + 
	 		" where status = 'SOLD' and isSeller = 'Y' and sellerno = id" + 
	 		" group by fname, id, username, lname, emailad order by id";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
 }

   /**
   * sets loggedIn class field to false
   * @throws IllegalStateException if then method is called when loggedIn = false
   */
  public void logout() throws IllegalStateException {
    if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
    
    this.loggedIn = false;
  }

}