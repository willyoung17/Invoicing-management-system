package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.ShangpinDao;
import com.java1234.model.ShangPin;
import com.java1234.model.Student;
import com.java1234.util.DateUtil;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSONObject;
@WebServlet("/saveJiage")
public class JiagetiaozhengServlet extends HttpServlet {
		
	DbUtil dbUtil=new DbUtil();
	ShangpinDao spd=new ShangpinDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String dj=request.getParameter("dj");
		System.out.println(dj);
		String number = request.getParameter("number");
		System.out.println(number);
		ShangPin shangpin=new ShangPin();
		if(StringUtil.isNotEmpty(number)){
			int num = Integer.valueOf(number);
			shangpin.setNumber(num);
			shangpin.setDj(dj);
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(number)){
				saveNums=spd.danjiaModify(con, shangpin);
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
