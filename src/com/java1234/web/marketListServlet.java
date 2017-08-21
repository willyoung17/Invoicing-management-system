package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.MarketDao;
import com.java1234.model.Market;
import com.java1234.model.PageBean;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;

public class marketListServlet extends HttpServlet{
	DbUtil dbUtil=new DbUtil();
	MarketDao marketDao = new MarketDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		String size = request.getParameter("size");
		
		Market market = new Market();
		if(num!=null){
			market.setNum(num);
			market.setName(name);
			market.setSize(size);
		}
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(marketDao.marketList(con, pageBean, market));
			int total=marketDao.marketCount(con, market);
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
