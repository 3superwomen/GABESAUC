package gabes;

import java.io.*;
import java.sql.*;
import java.util.Date;

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
  private CallableStatement callStmt;
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

	     con = openDBConnection();
	     try{
	     String queryString = "SELECT id "+ "FROM CUSTOMER "+"WHERE username= '"+this.username+"' and password= '"+ this.password+ "'";
         stmt = con.createStatement();
	     result= stmt.executeQuery(queryString);
	     if(result.next()) {
	    	   this.setId(result.getInt("id")); 
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
   * sets loggedIn class field to false
   * @throws IllegalStateException if then method is called when loggedIn = false
   */
  public void logout() throws IllegalStateException {
    if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
    
    this.loggedIn = false;
  }
  
  
  public ResultSet getCustomerInfo()  throws IllegalStateException{
	   
      if(!isLoggedIn())
      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
       try{
    	   stmt = con.createStatement();
          String queryString = "Select username,fname,lname,emailad,phoneno,sumofratings,noofratings,password FROM CUSTOMER where"
          		+ " username='" + this.username +"'";
          result = stmt.executeQuery(queryString);
       }       
       catch (Exception E) {
    	   E.printStackTrace();
       }
       return  result;
  	}
  

  public void updateProfile() throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
          Statement stmt = con.createStatement();
          String queryString = "update customer set" 
        		  + " username='" + this.username + "',"
                  + " fname='" + this.fname + "',"
                  + " lname='" + this.lname + "',"
                  + " email='" + this.emailad + "',"
                  + " phoneno='" + this.phoneno + "',"
                  + " password='" + this.password + "',"
                  + " where username='" + this.username+ "'";
          stmt.executeUpdate(queryString);
          stmt.close();         
      } catch (Exception E) {
          E.printStackTrace();
      }       
  }

  public void editProfile(String username, String fname, String lname, String email, String phoneno, String newpw) throws SQLException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");  
	    callStmt = con.prepareCall(" {call team5.customer_updateProfile_Proc(?,?,?,?,?,?,?,?,?)}");
	    callStmt.setString(1,phoneno);
	    callStmt.setString(2,email);
	    callStmt.setString(3,fname);
	    callStmt.setString(4,lname);
	    callStmt.setString(5,"Y");
	    callStmt.setString(6,"Y");
	    callStmt.setString(7,username);
	    callStmt.setString(8,newpw);
	    callStmt.setInt(9,this.id);
	    callStmt.execute();
	    
	    callStmt.close();
	  }  
  

  
public ResultSet getItemList()  throws IllegalStateException{
	  
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	       try{
	    	   stmt = con.createStatement();
          String queryString = "SELECT INUMBER , INAME , CATEG, auc_start, auc_end_date , startbid , currentbid,status " 
          		+ "FROM ITEM "
                + " WHERE SELLERNO = '" + this.id +"' ";

          result = stmt.executeQuery(queryString);
          
	       }
	       catch (Exception E) {
	         E.printStackTrace();
	       }
	        return result; 
	     }
public ResultSet getItemInfo(int ino) throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
	 String queryString = "SELECT * " 
       		+ "FROM ITEM "
			 + " where INUMBER = '"+ino+"'";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
}
public ResultSet getCustomerInfo(int cid)  throws IllegalStateException{
	   
    if(!isLoggedIn())
    throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
     try{
  	   stmt = con.createStatement();
        String queryString = "Select * FROM CUSTOMER where"
        		+ " id= '" + cid +"'";
        result = stmt.executeQuery(queryString);
     }       
     catch (Exception E) {
  	   E.printStackTrace();
     }
     return  result;
	}
public ResultSet getBidderList(int ino) throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 try {
		 con = openDBConnection();
	 String queryString = "SELECT biddate , username , maximumbidlimit " 
     		+ "FROM BIDS, CUSTOMER "
			 + " where id = bidderid and isbidder = 'Y' and itemid = '"+ino+"'";
	 stmt = con.createStatement();
	 result = stmt.executeQuery(queryString);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return result;
}
  
public void addItem(String name, String desc, String cate, Date aucS, Date aucE,String priceS) throws SQLException{
	 if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	 
	callStmt = con.prepareCall(" {call team5.item_add_Proc(?,?,?,?,?,?,?)}");
    callStmt.setInt(1,phoneno);
   //callStmt.setString(2,email);
    callStmt.setString(3,fname);
    callStmt.setString(4,lname);
    callStmt.setString(5,"Y");
    callStmt.setString(6,"Y");
    callStmt.setString(7,username);
    //callStmt.setString(8,newpw);
    callStmt.setInt(9,this.id);
    callStmt.execute();
    
    callStmt.close();
  }  

  public ResultSet viewFeedback() throws IllegalStateException{
	  if(!isLoggedIn())
	      throw new IllegalStateException("MUST BE LOGGED IN FIRST!");
	    try{
	    	stmt = con.createStatement();
	        String queryString = "SELECT bidderno,itemno,rating,quality,delivery,comments" + 
	        		" FROM Rates, Item" + 
	        		" WHERE sellerno = '" + this.getId()+ "' and itemno = INUMBER";
	        result = stmt.executeQuery(queryString);
	    }
	    catch (Exception E) {
	        E.printStackTrace();
	    }
	    return result; 
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
public int getNoOfratings() {
	return noofratings;
}
public void setNoofratings(int noofratings) {
	this.noofratings = noofratings;
}


  
}