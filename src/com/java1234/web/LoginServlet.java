package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java1234.dao.UserDao;
import com.java1234.model.User;
import com.java1234.util.DbUtil;
import com.java1234.util.MD5;
import com.java1234.util.StringUtil;

public class LoginServlet extends HttpServlet{
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
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		request.setAttribute("userName", userName);
		request.setAttribute("password", password);
		if(StringUtil.isEmpty(userName)||StringUtil.isEmpty(password)){
			request.setAttribute("error", "用户名或密码为空！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		User user=new User(userName);
		Connection con=null;
		try {
			con=dbUtil.getCon();
			User currentUser=userDao.login(con, user);
			String salt = currentUser.getSalt();
			
			String md5 =MD5.getMD5Str(password, salt);
			System.out.println(salt);
			System.out.println(md5);
			System.out.println(currentUser.getPassword());
			if(("是").equals(currentUser.getBlacklist())){
				request.setAttribute("error", "你已被系统拉黑！");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			if(!md5.equals(currentUser.getPassword())){
				request.setAttribute("error", "用户名或密码错误！");
				// 服务器跳转
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else if(!userName.equals(currentUser.getUserName())){
				request.setAttribute("error", "用户名或密码错误！");
				// 服务器跳转
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				// 获取Session
				HttpSession session=request.getSession();
				session.setAttribute("currentUser", currentUser);
				// 客户端跳转
				if("管理员".equals(currentUser.getType())){
					response.sendRedirect("mian.jsp");
				}else{
					response.sendRedirect("main.jsp");
				}
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
