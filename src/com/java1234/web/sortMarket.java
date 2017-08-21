package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.MarketDao;
import com.java1234.model.Market;
import com.java1234.model.PageBean;
import com.java1234.model.xiaoshou;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class sortMarket extends HttpServlet{
	DbUtil dbUtil=new DbUtil();
	MarketDao marketDao = new MarketDao();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("½øÀ´ÁË");
		String choose = request.getParameter("choose");
		String sort = request.getParameter("sort");
		xiaoshou xiaoshou = new xiaoshou();
		String page=request.getParameter("page");
		System.out.println(page);
		String rows=request.getParameter("rows");
		System.out.println(rows);
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(marketDao.SortMarket(con, pageBean, choose, sort));
			int total=marketDao.sortCount(con, xiaoshou, choose, sort);
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
