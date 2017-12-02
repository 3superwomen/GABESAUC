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
	private static final long serialVersionUID = 1L;
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
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public int getInumber() {
		return inumber;
	}
	public void setInumber(int inumber) {
		this.inumber = inumber;
	}
	public String getIdescription() {
		return idescription;
	}
	public void setIdescription(String idescription) {
		this.idescription = idescription;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getAuctionStartDate() {
		return auctionStartDate;
	}
	public void setAuctionStartDate(Date auctionStartDate) {
		this.auctionStartDate = auctionStartDate;
	}
	public Date getAuctionEndDate() {
		return auctionEndDate;
	}
	public void setAuctionEndDate(Date auctionEndDate) {
		this.auctionEndDate = auctionEndDate;
	}
	public int getSellerNo() {
		return sellerNo;
	}
	
	public void setWinner(int winId)
	{
		this.winner = winId;
	}
	public int getWinner() {
		return winner;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public int getStartBid() {
		return startBid;
	}
	public void setStartBid(int startBid) {
		this.startBid = startBid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCurrentBid() {
		return currentBid;
	}
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
	   * Sales summary report returns category, item id, item name, final selling price, and commission
	   * @return view
	   */
	  
	 public ResultSet getSalesSummaryReport() {
		 try {
			 con = openDBConnection();
			String queryString = "SELECT i.categ, i.INUMBER, i.INAME, b.maximumbidlimit AS FINALSELLINGPRICE,((currentBid+1)*0.05) AS Commission, SUM(maximumbidlimit) AS Subtotal" +
	        "FROM ITEM i, BIDS b" +
	        "WHERE b.itemid=" + this.inumber +  "AND " + this.status + "= 'SOLD' AND "
	        		+ "b.maximumbidlimit >= ANY (select max(maximumbidlimit)" +
	         "from BIDS" +
	         "where itemid = b.itemid" + 
	         "Group by i.categ, i.INUMBER, i.INAME, b.maximumbidlimit, ((currentBid+1)*0.05)" +
	         "ORDER BY i.categ desc, i.inumber";
	        stmt = con.createStatement();
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
	 public ResultSet getOverallComissionReport() {
		 try {
			 con = openDBConnection();
		 String queryString = "SELECT c.ID, c.username, c.fname, c.lname, c.emailad, AVG(r.rating) AS sellerrating, ((currentBid+1)*0.05) AS Commissions"
	        + "FROM Customer c, RATES r, BIDS b, Item i"
	        + "WHERE c.isseller = 'Y' AND" + this.sellerNo + "= c.id  AND " + this.auctionEndDate + " <= Current_date AND b.bidderid = r.bidderno AND" + this.status + "='SOLD'"
	        + "AND b.itemid =" + this.inumber + "AND r.itemno =" + this.inumber + "AND maximumbidlimit = (SELECT max(maximumbidlimit)" +
	                                                                        "FROM BIDS b2" + 
	                                                                        "WHERE b.bidderid = b2.bidderid and b.itemid = b2.itemid)"+
	        "group by c.ID, c.username, c.fname, c.lname, c.emailad, ((currentBid+1)*0.05)"+
	        "ORDER BY c.ID";
		 stmt = con.createStatement();
		 result = stmt.executeQuery(queryString);
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return result;
	 }
}
