package com.java1234.model;

import java.util.Date;

public class RuKu {
  
	private int id;
	private String gys;
	private String lxr;
	private String jsfs;
	private Date  jhsj; 
	private String spId;
	private String spName;
	private String spJc;
	private String spScdz;
	private String spGg;
	private String spDw;
	private int spDj;
	private int spSl;
	private String ysjl;
	private String czy;
	public RuKu() {
		super();
	}
	
	
	public RuKu(String gys, String lxr, String jsfs, Date jhsj, String spId, String spName, String spJc, String spScdz,
			String spGg, String spDw, int spDj, int spSl, String ysjl, String czy) {
		super();
		this.gys = gys;
		this.lxr = lxr;
		this.jsfs = jsfs;
		this.jhsj = jhsj;
		this.spId = spId;
		this.spName = spName;
		this.spJc = spJc;
		this.spScdz = spScdz;
		this.spGg = spGg;
		this.spDw = spDw;
		this.spDj = spDj;
		this.spSl = spSl;
		this.ysjl = ysjl;
		this.czy = czy;
	}

	public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public String getLxr() {
		return lxr;
	}
	public void setLxr(String lxr) {
		this.lxr = lxr;
	}
	public String getJsfs() {
		return jsfs;
	}
	public void setJsfs(String jsfs) {
		this.jsfs = jsfs;
	}
	public Date getJhsj() {
		return jhsj;
	}
	public void setJhsj(Date jhsj) {
		this.jhsj = jhsj;
	}
	public String getSpId() {
		return spId;
	}
	public void setSpId(String spId) {
		this.spId = spId;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public String getSpJc() {
		return spJc;
	}
	public void setSpJc(String spJc) {
		this.spJc = spJc;
	}
	public String getSpScdz() {
		return spScdz;
	}
	public void setSpScdz(String spScdz) {
		this.spScdz = spScdz;
	}
	public String getSpGg() {
		return spGg;
	}
	public void setSpGg(String spGg) {
		this.spGg = spGg;
	}
	public String getSpDw() {
		return spDw;
	}
	public void setSpDw(String spDw) {
		this.spDw = spDw;
	}
	public double getSpDj() {
		return spDj;
	}
	public void setSpDj(int spDj) {
		this.spDj = spDj;
	}
	public int getSpSl() {
		return spSl;
	}
	public void setSpSl(int spSl) {
		this.spSl = spSl;
	}
	public String getYsjl() {
		return ysjl;
	}
	public void setYsjl(String ysjl) {
		this.ysjl = ysjl;
	}
	public String getCzy() {
		return czy;
	}
	public void setCzy(String czy) {
		this.czy = czy;
	}
	
}
