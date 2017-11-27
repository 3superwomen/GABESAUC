package gabes;


import java.io.*;
import java.sql.*;
import oracle.jdbc.*;


/**
 * Use the SQL script file provided in this folder to create a NEW (slightly different) 
 * version of the ProductDeals database on Oracle and insert data into all tables. The 
 * script also creates an SQL function.
 */
public class Rates implements Serializable{
	private int delivery;
	private int rating;
	private String comments;
	private int quality;
	private int itemNo;
	private int bidderNo;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet result;
	private Connection con;
	
	/**
	   * A default constructor ... no need for other constructors
	   */
	public Rates(){
		  
	}
	
	public void setDelivery(int delivery) {
		this.delivery = delivery;
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
	  
	  
	  
	  
	  
}
