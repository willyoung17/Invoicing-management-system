package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.XiaoshoutuihuoDao;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONObject;
@WebServlet("/xsthdeleteservlet")
public class XSTHdeleteServlet extends HttpServlet{

	DbUtil dbUtil=new DbUtil();
	XiaoshoutuihuoDao xsthd=new XiaoshoutuihuoDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String number=request.getParameter("number");
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums=xsthd.XSTHDelete(con, number);
			if(delNums>0){
				result.put("success", "true");
				result.put("delNums", delNums);
			}else{
				result.put("errorMsg", "É¾³ýÊ§°Ü");
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
