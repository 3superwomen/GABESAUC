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
	
	public int getDelivery() {
		return this.delivery;
	}
	
	public void setRating(int delivery) {
		this.delivery = delivery;
	}
	
	public int getRating() {
		return this.delivery;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public String getComments() {
		return this.comments;
	}
	
	public void setQuality(int quality) {
		this.quality = quality;
	}
	
	public int getQuality() {
		return this.quality;
	}
	
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	
	public int getItemNo() {
		return this.itemNo;
	}
	
	public void setBidderNo(int bidderNo) {
		this.bidderNo = bidderNo;
	}
	
	public int getBidderNo() {
		return this.bidderNo;
	}
	
	/**
	   * This method and creates and returns a Connection object to the database. 
	   * All other methods that need database access should call this method.
	   * @return a Connection object to Oracle
	   * 
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
	   * When this method rateSeller() is called, the customer can rate a seller and this info will be inserted in Rates. 
	   */ 
	  public void rateSeller() throws SQLException {
				try {
					con = openDBConnection();
					 stmt = con.createStatement();
					String queryString = "insert into RATES values(" + "'" + this.getDelivery() + "'," + "'"
							+ this.getRating() + "'," + "'" + this.getComments() + "'," + "'" + this.getQuality() + "'," +"'" + this.getItemNo() 
							+ "'," + "'" + this.getBidderNo() + "' )";
					stmt.executeUpdate(queryString);
					stmt.close();
			 } catch (SQLException E) {
					    if(E.getErrorCode() == 1)
					    { 
					    	
						   throw new SQLException("YOU HAVE ALREADY RATED THIS ITEM");
					}
				}
}
}


