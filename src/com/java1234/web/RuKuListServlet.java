package com.java1234.web;


import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java1234.dao.RuKuDao;
import com.java1234.model.PageBean;
import com.java1234.model.RuKu;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@WebServlet("/rukulist")
public class RuKuListServlet extends HttpServlet{
	
	DbUtil dbUtil=new DbUtil();
	RuKuDao ruKuDao=new RuKuDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String spname=request.getParameter("spname");
		String spId=request.getParameter("spId");
		
		RuKu ruku=new RuKu();
		if(spname!=null){
			ruku.setSpName(spname);
			ruku.setSpId(spId);

		}
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(ruKuDao.searchRuku(con, pageBean, ruku));
			int total=ruKuDao.RuKuCount(con, ruku);
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
