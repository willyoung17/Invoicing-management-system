package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.KuCun;
import com.java1234.model.PageBean;
import com.java1234.model.RuKu;
import com.java1234.util.DateUtil;
import com.java1234.util.StringUtil;

public class RuKuDao {
	
	public int rukuDelete(Connection con,String id)throws Exception{
		String sql="delete from tb_ruku where id in("+id+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public ResultSet searchRuku(Connection con,PageBean pageBean,RuKu ruku)throws Exception{
		StringBuffer sb=new StringBuffer("select id,gys,lxr,jhsj,spId,spname,spGg,spScdz,spDw,spDj,spSl from tb_ruku where 1=1");
		if(StringUtil.isNotEmpty(ruku.getSpName())){
			sb.append(" and spname like '%"+ruku.getSpName()+"%'");
		}
		if(StringUtil.isNotEmpty(ruku.getSpId())){
			sb.append(" and spId like '%"+ruku.getSpId()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int RuKuCount(Connection con,RuKu ruku)throws Exception{
		StringBuffer sb=new StringBuffer("select count(0) as total from tb_ruku where 1=1");
		if(StringUtil.isNotEmpty(ruku.getSpName())){
			sb.append(" and spname like '%"+ruku.getSpName()+"%'");
		}
		if(StringUtil.isNotEmpty(ruku.getSpId())){
			sb.append(" and spId like '%"+ruku.getSpId()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	
	public int ruKuAdd(Connection con,RuKu ruku)throws Exception{
		String sql="insert into tb_ruku values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ruku.getGys());
		pstmt.setString(2, ruku.getLxr());
		pstmt.setString(3, ruku.getJsfs());
		pstmt.setString(4, DateUtil.formatDate(ruku.getJhsj(), "yyyy-MM-dd"));
		pstmt.setString(5, ruku.getSpId());
		pstmt.setString(6, ruku.getSpName());
		pstmt.setString(7, ruku.getSpJc());
		pstmt.setString(8, ruku.getSpScdz());
		pstmt.setString(9, ruku.getSpGg());
		pstmt.setString(10, ruku.getSpDw());
		pstmt.setDouble(11, ruku.getSpDj());
		pstmt.setInt(12, ruku.getSpSl());
		pstmt.setString(13, ruku.getYsjl());
		pstmt.setString(14, ruku.getCzy());
		return pstmt.executeUpdate();
	}
	
	
}
