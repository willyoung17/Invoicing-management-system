package com.java1234.model;

/**
 * ”√ªßModel¿‡
 * @author www.java1234.com
 *
 */
public class User {

	private int id;
	private String num;
	private String userName;
	private String password;
	private String salt;
	private String type;
	private String blacklist;
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userName) {
		super();
		this.userName = userName;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	
	
}
