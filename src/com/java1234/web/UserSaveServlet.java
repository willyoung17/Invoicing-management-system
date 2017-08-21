package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.UserDao;
import com.java1234.model.User;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSONObject;

public class UserSaveServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	DbUtil dbUtil=new DbUtil();
	UserDao userDao=new UserDao();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName=request.getParameter("username");
		String salt = request.getParameter("salt");
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String blacklist = request.getParameter("blacklist");
		String num=request.getParameter("num");
		String password=request.getParameter("password");
		User user=new User(userName);
		if(StringUtil.isNotEmpty(num)){
			user.setNum(num);
		}
		user.setBlacklist(blacklist);
		user.setType(type);
		if(StringUtil.isNotEmpty(password)){
			user.setPassword(password);
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if("管理员".equals(user.getType())){
				user.setBlacklist("否");
			}
			if(StringUtil.isNotEmpty(id)){
				saveNums=userDao.userModify(con, user);
			}else{
				saveNums=userDao.userAdd(con, user);
			}
			if(saveNums>0){ 
				result.put("success", "true");
			}else{
				result.put("success", "true");
				result.put("errorMsg", "保存失败");
			}
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
