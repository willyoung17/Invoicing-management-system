package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.MarketDao;
import com.java1234.dao.StudentDao;
import com.java1234.model.Student;
import com.java1234.model.Market;
import com.java1234.model.PageBean;
import com.java1234.util.DateUtil;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

public class MarketSaveServlet extends HttpServlet{
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
		request.setCharacterEncoding("utf-8");
		System.out.println("π˛π˛π˛");
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		System.out.println(num);
		System.out.println(name);
		System.out.println(request.getParameter("unit"));
		String size=request.getParameter("size");
		int amount=Integer.parseInt(request.getParameter("amount"));
		String unit=request.getParameter("unit");
		double price=Double.parseDouble(request.getParameter("price"));
		String comment=request.getParameter("comment");
		String  id = request.getParameter("Id");
		System.out.println(id);
		Market market = new Market();
		try {
			market.setNum(num);
			market.setName(name);
			market.setSize(size);
			market.setAmount(amount);
			market.setUnit(unit);
			market.setPrice(price);
			market.setComment(comment);
		}  catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(StringUtil.isNotEmpty(id)){
			market.setId(Integer.parseInt(id));
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(id)){
				saveNums=marketDao.marketModify(con, market);
			}else{
				saveNums=marketDao.marketAdd(con, market);
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
