package com.java1234.model;

import java.util.Date;

public class Role {
	private int id;
	
	private String rolename;
	
	private String menu;
	
	private Date createTime;
	
	private String isForb;
	
	public Role(String rolename){
		this.rolename = rolename;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date date) {
		this.createTime = date;
	}

	public String getIsForb() {
		return isForb;
	}

	public void setIsForb(String isForb) {
		this.isForb = isForb;
	}
}
