package com.java1234.model;


import java.util.Date;

public class KuCun {
	
	public String getJc() {
		return jc;
	}


	public void setJc(String jc) {
		this.jc = jc;
	}


	private int number;
	private String id;
	private String spname;
	private String jc;
	private String gg;
	private String cd;
	private Date thrq;
	private String bz;
	private String dw;
	private int dj;
	private int kcsl;
	private String kcje;
	private String spbz;
	
	
	
	public KuCun() {
		super();
	}
	
	
	public KuCun(String id,String spname,String gg,String cd,String bz,String dw,
			int dj,int kcsl) {
		super();
		this.id = id;
		this.spname = spname;
		this.gg = gg;
		this.cd = cd;
		this.dw = dw;
		this.bz = bz;
		this.dj = dj;
		this.kcsl = kcsl;
	}


	public int getNumber() {
		return number;
	}


	public void setNumber(int number) {
		this.number = number;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSpname() {
		return spname;
	}


	public void setSpname(String spname) {
		this.spname = spname;
	}


	public String getGg() {
		return gg;
	}


	public void setGg(String gg) {
		this.gg = gg;
	}


	public String getCd() {
		return cd;
	}


	public void setCd(String cd) {
		this.cd = cd;
	}


	public Date getThrq() {
		return thrq;
	}


	public void setThrq(Date thrq) {
		this.thrq = thrq;
	}


	public String getBz() {
		return bz;
	}


	public void setBz(String bz) {
		this.bz = bz;
	}


	public String getDw() {
		return dw;
	}


	public void setDw(String dw) {
		this.dw = dw;
	}


	public int getDj() {
		return dj;
	}


	public void setDj(int dj) {
		this.dj = dj;
	}


	public int getKcsl() {
		return kcsl;
	}


	public void setKcsl(int kcsl) {
		this.kcsl = kcsl;
	}


	public String getKcje() {
		return kcje;
	}


	public void setKcje(String kcje) {
		this.kcje = kcje;
	}


	public String getSpbz() {
		return spbz;
	}


	public void setSpbz(String spbz) {
		this.spbz = spbz;
	}

	
}
