package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.UserDao;
import com.java1234.model.Grade;
import com.java1234.model.PageBean;
import com.java1234.model.User;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.MD5;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */

public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbUtil dbUtil=new DbUtil();
	UserDao userDao = new UserDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String num = request.getParameter("num");
		String salt = request.getParameter("salt");
		String type = request.getParameter("type");
		String blacklist = request.getParameter("blacklist");
		User user=new User();
		user.setUserName(username);
		user.setPassword(password);
		user.setSalt(salt);
		user.setType(type);
		user.setBlacklist(blacklist);
		user.setNum(num);
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(userDao.userList(con, pageBean, user));
			int total=userDao.userCount(con,user);
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
