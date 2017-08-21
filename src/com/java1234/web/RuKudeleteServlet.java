package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java1234.dao.KuCunDao;
import com.java1234.dao.RuKuDao;
import com.java1234.model.KuCun;
import com.java1234.util.DbUtil;
import com.java1234.util.ResponseUtil;
import net.sf.json.JSONObject;
@WebServlet("/rukutuihuo")
public class RuKudeleteServlet extends HttpServlet{

	DbUtil dbUtil=new DbUtil();
	RuKuDao rukudelete=new RuKuDao();
	KuCunDao kuCunDao = new KuCunDao();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		String id=request.getParameter("id");   
		System.out.println(id+"666");
		String spname = request.getParameter("spname");
		System.out.println(spname);
		String spId = request.getParameter("spId");
		System.out.println(spId+1);
		int spSl = Integer.parseInt(request.getParameter("spSl"));
		
	
		System.out.println(spSl+1);
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums=rukudelete.rukuDelete(con, id);
			if(delNums>0){
				result.put("success", "true");
				result.put("delNums", delNums);
				KuCun kucun=new KuCun();
                    kucun.setSpname(spname);
					kucun.setId(spId);
					int total=kuCunDao.shangpinCount(con, kucun);
					if(total>0){
						kucun.setKcsl(spSl);
						kuCunDao.shuliangdelete(con, kucun);
					}
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
