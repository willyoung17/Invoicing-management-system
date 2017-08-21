package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.ChuKuDao;
import com.java1234.dao.KuCunDao;
import com.java1234.dao.RuKuDao;
import com.java1234.dao.StudentDao;
import com.java1234.model.Student;
import com.java1234.model.Chuku;
import com.java1234.model.KuCun;
import com.java1234.model.PageBean;

import com.java1234.util.DateUtil;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;
@WebServlet("/xiaoshou")
public class xiaoshouServlet extends HttpServlet{
	DbUtil dbUtil=new DbUtil();
	ChuKuDao ruKuDao = new ChuKuDao();
	KuCunDao kuCunDao = new KuCunDao();
 	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String gys =request.getParameter("kh");
		String lxr =request.getParameter("lxr");
		String jsfs =request.getParameter("js");
		String  jhsj=request.getParameter("chsj") ; 
		String spId=request.getParameter("id");
		String spName=request.getParameter("spname");
		String spCd=request.getParameter("cd");
		String spGg=request.getParameter("gg");
		String spBz=request.getParameter("bz");
		String spDw=request.getParameter("dw");
		String spDj=request.getParameter("dj");
		String spSl=request.getParameter("spSl");
	    String ysjl=request.getParameter("ysjl");
	    String czy=request.getParameter("czy");
	    int zong = Integer.parseInt(spDj)*Integer.parseInt(spSl);
		Chuku chuku = null;
	    KuCun kucun = null;
		try {
			chuku = new Chuku(gys, lxr, jsfs, DateUtil.formatString(jhsj, "yyyy-MM-dd"),spId,spName,
				Integer.parseInt(spDj),Integer.parseInt(spSl), zong,ysjl,czy
				);

			
		}  catch (Exception e1) {
			e1.printStackTrace();
		} 
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			saveNums=ruKuDao.ruKuAdd(con, chuku);
			if(saveNums>0){
				result.put("success", "true");
				kucun=new KuCun();
				if(spName!=null){
					kucun.setSpname(spName);
					kucun.setId(spId);
					int total=kuCunDao.shangpinCount(con, kucun);
					if(total>0){
						kucun.setKcsl(Integer.parseInt(spSl));
						kuCunDao.shuliangdelete(con, kucun);

					}
				}
				
				
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
