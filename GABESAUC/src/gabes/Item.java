package gabes;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

/**
 * Use the SQL script file provided in this folder to create a NEW (slightly different) 
 * version of the ProductDeals database on Oracle and insert data into all tables. The 
 * script also creates an SQL function.
 */
public class Item implements Serializable{

	private int inumber;
	private String iname;
	private String idescription;
	private String category;
	private Date auctionStartDate;
	private Date auctionEndDate;
	private int sellerNo;
	private int startBid;
	private String status;
	private int currentBid;
	private int winner;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet result;
	private Connection con;
	
	/**
	 * Getters and setters of variables
	 * 
	 */
	
	/**
	   * A getter for class field iname
	   * @param iname the iname to set
	   */
	public String getIname() {
		return iname;
	}
	/**
	   * A setter for class field iname
	   * @param iname the iname to set
	   */
	public void setIname(String iname) {
		this.iname = iname;
	}
	/**
	   * A getter for class field inumber
	   * @param inumber the inumber to set
	   */
	public int getInumber() {
		return inumber;
	}
	/**
	   * A setter for class field inumber
	   * @param inumber the inumber to set
	   */
	public void setInumber(int inumber) {
		this.inumber = inumber;
	}
	/**
	   * A getter for class field idescription
	   * @param idescription the idescription to set
	   */
	public String getIdescription() {
		return idescription;
	}
	/**
	   * A setter for class field idescription
	   * @param idescription the idescription to set
	   */
	public void setIdescription(String idescription) {
		this.idescription = idescription;
	}
	/**
	   * A getter for class field category
	   * @param category the category to set
	   */
	public String getCategory() {
		return category;
	}
	/**
	   * A setter for class field category
	   * @param category the category to set
	   */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	   * A getter for class field auctionStartDate
	   * @param auctionStartDate the auctionStartDate to set
	   */
	public Date getAuctionStartDate() {
		return auctionStartDate;
	}
	/**
	   * A setter for class field auctionStartDate
	   * @param auctionStartDate the auctionStartDate to set
	   */
	public void setAuctionStartDate(Date auctionStartDate) {
		this.auctionStartDate = auctionStartDate;
	}
	/**
	   * A getter for class field auctionEndDate
	   * @param auctionEndDate the auctionEndDate to set
	   */
	public Date getAuctionEndDate() {
		return auctionEndDate;
	}
	/**
	   * A setter for class field auctionEndDate
	   * @param auctionEndDate the auctionEndDate to set
	   */
	public void setAuctionEndDate(Date auctionEndDate) {
		this.auctionEndDate = auctionEndDate;
	}
	/**
	   * A getter for class field sellerNo
	   * @param sellerNo the sellerNo to set
	   */
	public int getSellerNo() {
		return sellerNo;
	}
	/**
	   * A setter for class field winId
	   * @param winId the winId to set
	   */
	public void setWinner(int winId)
	{
		this.winner = winId;
	}
	/**
	   * A getter for class field winId
	   * @param winId the winId to set
	   */
	public int getWinner() {
		return winner;
	}
	/**
	   * A setter for class field sellerNo
	   * @param sellerNo the sellerNo to set
	   */
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	/**
	   * A getter for class field sellerNo
	   * @param sellerNo the sellerNo to set
	 * @return 
	   */
	public int getSellerNo(int sellerNo) {
		return sellerNo;
	}
	/**
	   * A setter for class field startBid
	   * @param startBid the startBid to set
	   */
	public int getStartBid() {
		return startBid;
	}
	/**
	   * A getter for class field startBid
	   * @param startBid the startBid to set
	   */
	public void setStartBid(int startBid) {
		this.startBid = startBid;
	}
	/**
	   * A getter for class field wistatusnId
	   * @param status the status to set
	   */
	public String getStatus() {
		return status;
	}
	/**
	   * A setter for class field status
	   * @param status the status to set
	   */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	   * A getter for class field currentBid
	   * @param currentBid the currentBid to set
	   */
	public int getCurrentBid() {
		return currentBid;
	}
	/**
	   * A setter for class field currentBid
	   * @param currentBid the currentBid to set
	   */
	public void setCurrentBid(int currentBid) {
		this.currentBid = currentBid;
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
	  * List items bought by seller- actually won
	  * @return set of rows of items and its information
	  */
	  public ResultSet getListOfItemsBought() throws IllegalStateException {
		try {
		con = openDBConnection();
			stmt = con.createStatement();
			String queryString = "SELECT  INUMBER, INAME, CATEG, AUC_START, AUC_END_DATE,STARTBID, CURRENTBID,USERNAME, Sellerno" + " FROM ITEM, CUSTOMER" + " where '" + this.winner + "' = winner and winner = id " ;
			result = stmt.executeQuery(queryString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result; 
	  }
	  /**
	   * This method uses a Statement object to query the CUSTOMER table
	   * for the seller information
	   * @return a ResultSet object containing the record  that matches the id of the seller **/
	  
	  public ResultSet getSellerInfo() {
		  try {
				   con = openDBConnection();
					stmt = con.createStatement();
					String queryString = "SELECT  USERNAME, EMAILAD" + " FROM CUSTOMER" + " where id = '" + this.getSellerNo() +"'" ;
					result = stmt.executeQuery(queryString);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result; 
	  }
	  
	  /**
	   * This method uses a Statement object to query the ITEM table
	   * to get all customers with no bids that have passed their auction date
	   * @return a ResultSet object containing the list of items with status = "NOT ON AUCTION" **/
	  public ResultSet getItemWithNoBids() {
		  con = openDBConnection();
		    try{
		    	   stmt = con.createStatement();
					String queryString = "SELECT INUMBER,INAME,IDESCRIP, CATEG, STATUS, AUC_START, AUC_END_DATE FROM TEAM5.ITEM WHERE status = 'NOT ON AUCTION'" ;
					result = stmt.executeQuery(queryString);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result; 
	  }
	  
	  
		public void deleteItem() {
			con = openDBConnection();
			try {
				pstmt = con.prepareStatement("delete from TEAM5.ITEM where inumber = ?");
				 pstmt.clearParameters();
		         pstmt.setInt(1,this.inumber);
				pstmt.executeQuery();
				pstmt.close();
			} catch (Exception E) {
				E.printStackTrace();
			}
		}
		  
	  
		/**
		 * This function returns resultset with sales sub totals onto the view reports page
		 * @return resultset 
		 * @throws IllegalStateException
		 */
	  public ResultSet getSalesSubTotals() throws IllegalStateException
	  {
	 	 try {
	 		 con = openDBConnection();
	 		 stmt = con.createStatement();
	 		 String queryString = "SELECT categ, sum(currentbid) as subtotal, sum(currentbid*0.05) as finalcommission" +
	 				 " FROM ITEM" + 
	 				 " where status = 'SOLD'"
	 				 +" group by categ order by categ";
	         result = stmt.executeQuery(queryString);
	 	 } catch (Exception e) {
	 		 e.printStackTrace();
	 	 }
	 	 return result; 
	  }
	
}

