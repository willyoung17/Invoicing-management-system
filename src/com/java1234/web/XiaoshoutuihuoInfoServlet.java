package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.java1234.dao.XiaoshoutuihuoDao;
import com.java1234.model.PageBean;
import com.java1234.model.Student;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@WebServlet("/xiaoshoutuihuoServlet")
public class XiaoshoutuihuoInfoServlet extends HttpServlet {
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
		System.out.println("进入servlet");
		String s_xsthID=request.getParameter("s_xsthID");
		String s_khname=request.getParameter("s_khname");
		String s_ysjl=request.getParameter("s_ysjl");
		String s_bthdate=request.getParameter("s_bthdate");
		String s_ethdate=request.getParameter("s_ethdate");
		System.out.println(s_xsthID+s_khname+s_ysjl+s_bthdate);
		Map<String, String> map = new HashMap<>();
			map.put("s_xsthID",s_xsthID);
			map.put("s_khname",s_khname);
			map.put("s_ysjl",s_ysjl);
			map.put("s_khname",s_khname);
		
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
	
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			System.out.println("准备查询");
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(xsthd.queryxiaoshoutuihuoInfo(con, pageBean, map, s_bthdate, s_ethdate));
			System.out.println("查询结束");
			int total=xsthd.xsthcount(con, map, s_bthdate, s_ethdate);
			result.put("rows", jsonArray);
			result.put("total", total);
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
