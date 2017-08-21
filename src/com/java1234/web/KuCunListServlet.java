package com.java1234.web;


import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.KuCunDao;

import com.java1234.model.KuCun;
import com.java1234.model.PageBean;

import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@WebServlet("/kucun")
public class KuCunListServlet extends HttpServlet{
	
	DbUtil dbUtil=new DbUtil();
	KuCunDao spd=new KuCunDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String spname=request.getParameter("spname");
		String id=request.getParameter("spId");
		System.out.println(id+"ggg");
		KuCun kucun=new KuCun(); 
		if(spname!=null){ 
			kucun.setSpname(spname);
			kucun.setId(id);
		}
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(spd.searchSp(con, pageBean, kucun));
			int total=spd.shangpinCount(con, kucun);
			result.put("rows", jsonArray);
			result.put("total", total);
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
