package gabes;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;


/**
 * Use the SQL script file provided in this folder to create a NEW (slightly different) 
 * version of the ProductDeals database on Oracle and insert data into all tables. The 
 * script also creates an SQL function.
 */
public class Customer implements Serializable {
  /**
   * The following fields correspond to the ADMINS table in the Oracle database
   */
  private int phoneno;
  private String emailad;
  private String fname;
  private String lname;
  private char isSeller;
  private char isBidder;
  private String username;
  private String password;
  private String adminUsername;
  private int id;
  private int commission;
  private int sumratings;
  private int noofratings;
  private PreparedStatement pstmt;
  private Statement stmt;
  private ResultSet result;
  private Connection con;
  /**
   * The following stores whether or not the customer has successfully logged
   * to the System
   */    
  private boolean loggedIn = false;
  
  /**
   * A default constructor ... no need for other constructors
   */
  public Customer(){
	  
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
      Connection myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
                                                            "csci.cscioraclesrv.ad.csbsju.edu","TEAM5", "mnz");
      return myConnection;
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
  
  public void addCustomer()  throws IllegalStateException{
	   
	
	   try{
		      con = openDBConnection();
	          stmt = con.createStatement(); 
	         String queryString = "insert into CUSTOMER (id, username, fname, lname, emailad, password, adminusername) values('" + this.id+ "'," + "'" + this.username+ "'," + "'"+ this.fname + "'," + "'" + this.lname + "'," + "'"
	        + this.emailad + "'," +  "'" + this.password + "'," +"'" + this.adminUsername + "')";
	         stmt.executeUpdate(queryString);
	         stmt.close();
	   } catch (Exception E) {
	    E.printStackTrace();
	   }
	    }
  
 
  
  /**
   * When called, this method uses a Statement object to query table CUSTOMER
   * for the customer whose id is stored in class instance
   * fields id.
   * If a match is found, the method sets loggedIn class field to true and 
   * returns true; otherwise, loggedIn class field is set to false and false is returned 
   * 
   * @return true or false based on whether the login information of the customer
   * stored in class fields last and customerNumber exist in Table Customer
   */
  public boolean login() {
	     String usern;
	     try{
	     con = openDBConnection();
	     stmt = con.createStatement();
	     String queryString = "SELECT username "+ "FROM CUSTOMER "+"WHERE username= '"+this.username+"' and password= '"+ this.password+ "'";
	     result = stmt.executeQuery(queryString);
	     while(result.next()){
	        usern= result.getString("username");
	        if(usern.equals(this.username)){
	         loggedIn = true;
	       }
	     }
	     result.close(); 
	    
	      } catch (Exception E) {
	       E.printStackTrace();
	     }
	     
	      return loggedIn;
	  
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
  
  /**
   * This method uses a Statement object to query the Customer tab;e
   * for the customer whose id is stored in class field id
   * 
   * @return a ResultSet object containing the record for the matching customer from 
   * the Customer table
   * 
   * @throws IllegalStateException if then method is called when loggedIn = false
   */
  public ResultSet getCustomerInfo() throws IllegalStateException{
    
    if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
    try{
    stmt = con.createStatement();
    String queryString = "SELECT *" + "FROM CUSTOMER" + " WHERE id = " + this.id +" ";
    result = stmt.executeQuery(queryString);
   
    }
    catch (Exception E) {
      E.printStackTrace();
    }
     return result; 
  }
  

  public void editCustomerInfo()  throws IllegalStateException{
 
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
          Statement stmt = con.createStatement();
          String queryString = "update customer set " 
                  + " username='" + this.getUsername() + "',"
                  + " fname='" + this.getFname() + "',"
                  + " lname='" + this.getLname() + "',"
                  + " email='" + this.getEmailad() + "',"
                  + " password='" + this.getPassword() + "',"
                  + " where id='" + this.getId()+ "'";

          stmt.executeUpdate(queryString);
          stmt.close();         
      } catch (Exception E) {
          E.printStackTrace();
      }       
  }
  
  
  public int getPhoneno() {
	return phoneno;
}
public void setPhoneno(int phoneno) {
	this.phoneno = phoneno;
}
public String getEmailad() {
	return emailad;
}
public void setEmailad(String emailad) {
	this.emailad = emailad;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public char getIsSeller() {
	return isSeller;
}
public void setIsSeller(char isSeller) {
	this.isSeller = isSeller;
}
public char getIsBidder() {
	return isBidder;
}
public void setIsBidder(char isBidder) {
	this.isBidder = isBidder;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getAdminUsername() {
	return adminUsername;
}
public void setAdminUsername(String adminUsername) {
	this.adminUsername = adminUsername;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getCommission() {
	return commission;
}
public void setCommission(int commission) {
	this.commission = commission;
}
public int getSumratings() {
	return sumratings;
}
public void setSumratings(int sumratings) {
	this.sumratings = sumratings;
}
public int getNoofratings() {
	return noofratings;
}
public void setNoofratings(int noofratings) {
	this.noofratings = noofratings;
}


  
}