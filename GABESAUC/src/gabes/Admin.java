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
    String usern;
    try{
     con = openDBConnection();
    stmt = con.createStatement();
    String queryString = "SELECT username "+ "FROM ADMINS "+"WHERE username= '"+this.username+"' and password= '"+ this.password+ "'";
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
   * sets loggedIn class field to false
   * @throws IllegalStateException if then method is called when loggedIn = false
   */
  public void logout() throws IllegalStateException {
    if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
    
    this.loggedIn = false;
  }

}