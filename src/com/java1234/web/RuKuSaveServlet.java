package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.KuCunDao;
import com.java1234.dao.RuKuDao;
import com.java1234.dao.StudentDao;
import com.java1234.model.Student;
import com.java1234.model.KuCun;
import com.java1234.model.PageBean;
import com.java1234.model.RuKu;
import com.java1234.util.DateUtil;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;
@WebServlet("/ruku")
public class RuKuSaveServlet extends HttpServlet{
	DbUtil dbUtil=new DbUtil();
	RuKuDao ruKuDao = new RuKuDao();
	KuCunDao kuCunDao = new KuCunDao();
 	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		System.out.println(333);
		String gys =request.getParameter("gys");
		String lxr =request.getParameter("lxr");
		String jsfs =request.getParameter("js");
		String  jhsj=request.getParameter("jhsj") ; 
		String spId=request.getParameter("spId");
		String spName=request.getParameter("spName");
		String spJc=request.getParameter("spJc");
		String spCd=request.getParameter("spScdz");
		String spGg=request.getParameter("spGg");
		String spBz=request.getParameter("spBz");
		String spDw=request.getParameter("spDw");
		String spDj=request.getParameter("spDj");
		String spSl=request.getParameter("spSl");
	    String ysjl=request.getParameter("ysjl");
	    String czy=request.getParameter("czy");
		RuKu ruku = null;
	    KuCun kucun = null;
		try {
			ruku = new RuKu(gys, lxr, jsfs, DateUtil.formatString(jhsj, "yyyy-MM-dd"),spId,spName,
					spJc,spCd,spGg,spDw,Integer.parseInt(spDj),Integer.parseInt(spSl),ysjl,czy
					);

			
		}  catch (Exception e1) {
			e1.printStackTrace();
		} 
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			saveNums=ruKuDao.ruKuAdd(con, ruku);
			if(saveNums>0){
				result.put("success", "true");
				kucun=new KuCun();
				if(spName!=null){
					kucun.setSpname(spName);
					kucun.setId(spId);
					int total=kuCunDao.shangpinCount(con, kucun);
					if(total>0){
						kucun.setKcsl(Integer.parseInt(spSl));
						kuCunDao.shuliangModify(con, kucun);
					}else{
					    KuCun ku = new KuCun();
						ku.setId(spId);
						ku.setSpname(spName);
						ku.setJc(spJc);
						ku.setCd(spCd);
						ku.setGg(spGg);
						ku.setBz(spBz);
						ku.setDw(spDw);
						ku.setDj(Integer.parseInt(spDj));
						ku.setKcsl(Integer.parseInt(spSl));
						kuCunDao.KuCunAdd(con, ku);
					}
				}
				
				
			}else{
				result.put("success", "true");
				result.put("errorMsg", "±£¥Ê ß∞‹");
			}
			ResponseUtil.write(response, result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
