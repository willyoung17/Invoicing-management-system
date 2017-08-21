package com.java1234.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.java1234.model.PageBean;
import com.java1234.model.ShangPin;

import com.java1234.util.StringUtil;

public class ShangpinDao {
	public ResultSet searchSp(Connection con,PageBean pageBean,ShangPin shangpin)throws Exception{
		StringBuffer sb=new StringBuffer("select number,id,spname,gg,cd,bz,dw,dj,kcsl from tb_kucun where 1=1");
		if(StringUtil.isNotEmpty(shangpin.getSpname())){
			sb.append(" and spname like '%"+shangpin.getSpname()+"%'");
		}
		if(StringUtil.isNotEmpty(shangpin.getId())){
			sb.append(" and id like '%"+shangpin.getId()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int shangpinCount(Connection con,ShangPin shangpin)throws Exception{
		StringBuffer sb=new StringBuffer("select count(0) as total from tb_kucun where 1=1");
		if(StringUtil.isNotEmpty(shangpin.getSpname())){
			sb.append(" and spname like '%"+shangpin.getSpname()+"%'");
		}
		if(StringUtil.isNotEmpty(shangpin.getId())){
			sb.append(" and id like '%"+shangpin.getId()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	
	public int danjiaModify(Connection con,ShangPin shangpin)throws Exception{
		String sql="update tb_kucun set dj=? where number=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, shangpin.getDj());
		pstmt.setInt(2, shangpin.getNumber());
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
