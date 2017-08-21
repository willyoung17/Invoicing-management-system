package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.java1234.dao.XiaoshoutuihuoDao;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSONObject;
@WebServlet("/xsthsave")
public class XSTHsaveServlet extends HttpServlet{
	
	DbUtil dbUtil=new DbUtil();
	XiaoshoutuihuoDao xsthd=new XiaoshoutuihuoDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String number = request.getParameter("number");
		String xsthID=request.getParameter("xsthID");
		String pzs=request.getParameter("pzs");
		String ysjl=request.getParameter("ysjl");
		String thdate=request.getParameter("thdate");
		String je=request.getParameter("je");
		String khname=request.getParameter("khname");
		String czy=request.getParameter("czy");
		String jsr=request.getParameter("jsr");
		String jsfs=request.getParameter("jsfs");
		
		Map<String, String> map=null;
		try {
			map = new HashedMap();
			map.put("xsthID", xsthID);
			map.put("pzs", pzs);
			map.put("ysjl", ysjl);
			map.put("thdate", thdate);
			map.put("je", je);
			map.put("khname", khname);
			map.put("czy", czy);
			map.put("jsr", jsr);
			map.put("jsfs", jsfs);
		}  catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(StringUtil.isNotEmpty(number)){
			map.put("number", number);
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(number)){
				saveNums=xsthd.XSTHModify(con, map);
			}else{
				saveNums=xsthd.XSTHAdd(con, map);
			}
			if(saveNums>0){
				result.put("success", "true");
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
		
	
}
