package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.RoleDao;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class RoleDeleteServlet
 */
@WebServlet("/roleDelete")
public class RoleDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DbUtil dbUtil=new DbUtil();
	RoleDao roleDao = new RoleDao();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delIds=request.getParameter("delIds");
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums=roleDao.roleDelete(con, delIds);
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
				
				e.printStackTrace();
			}
		}
	}

}
