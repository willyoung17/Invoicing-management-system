package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.RoleDao;
import com.java1234.model.Role;
import com.java1234.util.DateUtil;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class RoleSaveServlet
 */
@WebServlet("/roleSave")
public class RoleSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DbUtil dbUtil=new DbUtil();
	RoleDao roleDao=new RoleDao();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String roleName=request.getParameter("rolename");
		String menu = request.getParameter("menu");
		String isForb = request.getParameter("isForb");
		Role role=new Role(roleName);
		if(StringUtil.isNotEmpty(id)){
			role.setId(Integer.parseInt(id));
		}
		role.setIsForb(isForb);
		role.setMenu(menu);
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(id)){
				saveNums=roleDao.roleModify(con, role);
			}else{
				saveNums=roleDao.roleAdd(con, role);
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
				e.printStackTrace();
			}
		}
	}

}
