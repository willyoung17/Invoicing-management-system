package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import com.java1234.model.PageBean;
import com.java1234.model.Student;
import com.java1234.util.DateUtil;
import com.java1234.util.StringUtil;

public class XiaoshoutuihuoDao {
	public ResultSet queryxiaoshoutuihuoInfo(Connection con,PageBean pageBean,Map<String, String> map,String s_bthdate,String s_ethdate)throws Exception{
		StringBuffer sb=new StringBuffer("select * from tb_xsth_main where 1=1");
		if(StringUtil.isNotEmpty(map.get("s_xsthID"))){
			sb.append(" and xsthID like '%"+map.get("s_xsthID")+"%'");
		}
		if(StringUtil.isNotEmpty(map.get("s_khname"))){
			sb.append(" and khname like '%"+map.get("s_khname")+"%'");
		}
		if(StringUtil.isNotEmpty(map.get("s_ysjl"))){
			sb.append(" and ysjl ='"+map.get("s_ysjl")+"'");
		}
		if(StringUtil.isNotEmpty(s_bthdate)){
			sb.append(" and TO_DAYS(thdate)>=TO_DAYS('"+s_bthdate+"')");
		}
		if(StringUtil.isNotEmpty(s_ethdate)){
			sb.append(" and TO_DAYS(thdate)<=TO_DAYS('"+s_ethdate+"')");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int xsthcount(Connection con,Map<String, String> map,String s_bthdate,String s_ethdate)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from tb_xsth_main where 1=1");
		if(StringUtil.isNotEmpty(map.get("s_thID"))){
			sb.append(" and xsthID like '%"+map.get("s_thID")+"%'");
		}
		if(StringUtil.isNotEmpty(map.get("s_khname"))){
			sb.append(" and khname like '%"+map.get("s_khname")+"%'");
		}
		if(StringUtil.isNotEmpty(map.get("s_ysjl"))){
			sb.append(" and ysjl ='"+map.get("s_ysjl")+"'");
		}
		if(StringUtil.isNotEmpty(s_bthdate)){
			sb.append(" and TO_DAYS(thdate)>=TO_DAYS('"+s_bthdate+"')");
		}
		if(StringUtil.isNotEmpty(s_ethdate)){
			sb.append(" and TO_DAYS(thdate)<=TO_DAYS('"+s_ethdate+"')");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int XSTHDelete(Connection con,String number)throws Exception{
		String sql="delete from tb_xsth_main where number in("+number+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int  XSTHruku(Connection con,String xsthID)throws Exception{
		String sql="INSERT INTO tb_kucun SELECT *FROM tb_kucun WHERE id=(SELECT spid FROM tb_xsth_detail WHERE xsthID=?);";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,xsthID);
		return pstmt.executeUpdate();
	}
	public int XSTHAdd(Connection con, Map<String, String> map)throws Exception{
		String sql="insert into tb_xsth_main values(null,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, map.get("xsthID"));
		pstmt.setString(2, map.get("pzs"));
		pstmt.setString(3, map.get("je"));	
		pstmt.setString(4, map.get("ysjl"));
		pstmt.setString(5, map.get("khname"));
		pstmt.setString(6, map.get("thdate"));
		pstmt.setString(7, map.get("czy"));
		pstmt.setString(8, map.get("jsr"));
		pstmt.setString(9, map.get("jsfs"));
		return pstmt.executeUpdate();
	}
	
	public int XSTHModify(Connection con,Map<String, String> map)throws Exception{
		String sql="update tb_xsth_main set xsthID=?,pzs=?,je=?,ysjl=?,khname=?,thdate=?,czy=?,jsr=?,jsfs=? where number=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, map.get("xsthID"));
		pstmt.setString(2, map.get("pzs"));
		pstmt.setString(3, map.get("je"));	
		pstmt.setString(4, map.get("ysjl"));
		pstmt.setString(5, map.get("khname"));
		pstmt.setString(6, map.get("thdate"));
		pstmt.setString(7, map.get("czy"));
		pstmt.setString(8, map.get("jsr"));
		pstmt.setString(9, map.get("jsfs"));
		pstmt.setString(10, map.get("number"));
		return pstmt.executeUpdate();
	}
	
	public boolean getStudentByGradeId(Connection con,String gradeId)throws Exception{
		String sql="select * from t_student where gradeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, gradeId);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return true;
		}else{
			return false;
		}
	}
}
