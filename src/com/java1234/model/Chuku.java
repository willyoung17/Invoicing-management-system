package com.java1234.model;

import java.util.Date;

public class Chuku {
	private int number;
	 private String kh;
	 private String lxr;
	 private String jsfs;
	 private Date xssj;
	 private String spId;
	 private String spName;
	 private int spDj;
	 private int spSl;
	 private int zje;
	 private String ysjl;
	 private String czy;
	 public Chuku(){
		 super();
	 }
	 public Chuku(
				 String kh, String lxr, String jsfs, Date xssj, String spId, String spName, int spDj,
				int spSl, int zje, String ysjl, String czy) {
			super();
			this.kh = kh;
			this.lxr = lxr;
			this.jsfs = jsfs;
			this.xssj = xssj;
			this.spId = spId;
			this.spName = spName;
			this.spDj = spDj;
			this.spSl = spSl;
			this.zje = zje;
			this.ysjl = ysjl;
			this.czy = czy;
		}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
	public String getKh() {
		return kh;
	}
	public void setKh(String kh) {
		this.kh = kh;
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
	public Date getXssj() {
		return xssj;
	}
	public void setXssj(Date xssj) {
		this.xssj = xssj;
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
	public int getSpDj() {
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
	public int getZje() {
		return zje;
	}
	public void setZje(int zje) {
		this.zje = zje;
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
