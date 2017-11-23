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
public Connection getCon() {
	return con;
}
public void setCon(Connection con) {
	this.con = con;
}

  
}