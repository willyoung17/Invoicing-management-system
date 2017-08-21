package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java1234.model.Market;
import com.java1234.model.PageBean;
import com.java1234.model.Student;
import com.java1234.model.xiaoshou;
import com.java1234.util.DateUtil;
import com.java1234.util.StringUtil;

public class MarketDao {
	
	public ResultSet SortMarket(Connection con,PageBean pageBean,String choose,String sort) throws Exception{
		StringBuffer sb=new StringBuffer();
		if(choose!=null&&!"".equals(choose)){
			if("升序".equals(sort)){
				if("单价".equals(choose)){
					sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou order by spDj asc");
				}else if("总价".equals(choose)){
					sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou order by zje asc");
				}else{
					sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou order by spSl asc");
				}
			}else{
				if("单价".equals(choose)){
					sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou order by spDj desc");
				}else if("总价".equals(choose)){
					sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou order by zje desc");
				}else{
					sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou order by spSl desc");
				}
			}
			if(pageBean!=null){
				sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
			}
		}else{
			sb.append("select spName,kh,lxr,spDj,spSl,zje from tb_xiaoshou");
		}
		
		
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	public int sortCount(Connection con,xiaoshou xiaoshou,String choose,String sort)throws Exception{
		StringBuffer sb=new StringBuffer();
		if("升序".equals(sort)){
			if("单价".equals(choose)){
				sb.append("select count(*) as total from tb_xiaoshou order by spDj asc");
			}else if("总价".equals(choose)){
				sb.append("select count(*) as total from tb_xiaoshou order by zje asc");
			}else{
				sb.append("select count(*) as total from tb_xiaoshou order by spSl asc");
			}
		}else{
			if("单价".equals(choose)){
				sb.append("select count(*) as total from tb_xiaoshou order by spDj desc");
			}else if("总价".equals(choose)){
				sb.append("select count(*) as total from tb_xiaoshou order by zje desc");
			}else{
				sb.append("select count(*) as total from tb_xiaoshou order by spSl desc");
			}
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public ResultSet marketList(Connection con,PageBean pageBean,Market market)throws Exception{
		StringBuffer sb=new StringBuffer("select * from market g where 1=1");
		if(StringUtil.isNotEmpty(market.getNum())){
			sb.append(" and num like '%"+market.getNum()+"%'");
		}
		if(StringUtil.isNotEmpty(market.getName())){
			sb.append(" and name like '%"+market.getName()+"%'");
		}
		if(StringUtil.isNotEmpty(market.getSize())){
			sb.append(" and size ='"+market.getSize()+"'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int marketCount(Connection con,Market market)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from market where 1=1");
		if(StringUtil.isNotEmpty(market.getNum())){
			sb.append(" and num like '%"+market.getNum()+"%'");
		}
		if(StringUtil.isNotEmpty(market.getName())){
			sb.append(" and name like '%"+market.getName()+"%'");
		}
		if(StringUtil.isNotEmpty(market.getSize())){
			sb.append(" and size ='"+market.getSize()+"'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int marketDelete(Connection con,String delIds)throws Exception{
		String sql="delete from market where id in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int marketAdd(Connection con,Market market)throws Exception{
		String sql="insert into market values(null,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, market.getNum());
		pstmt.setString(2, market.getName());
		pstmt.setString(3, market.getSize());
		pstmt.setDouble(4, market.getAmount());
		pstmt.setString(5, market.getUnit());
		pstmt.setDouble(6, market.getPrice());
		pstmt.setDouble(7, market.getAmount() * market.getPrice());
		pstmt.setString(8, market.getComment());
		return pstmt.executeUpdate();
	}
	
	public int marketModify(Connection con,Market market)throws Exception{
		String sql="update market set num=?,name=?,size=?,amount=?,unit=?,price=?,money=?,comment=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, market.getNum());
		pstmt.setString(2, market.getName());
		pstmt.setString(3, market.getSize());
		pstmt.setDouble(4, market.getAmount());
		pstmt.setString(5, market.getUnit());
		pstmt.setDouble(6, market.getPrice());
		pstmt.setDouble(7, market.getAmount()*market.getPrice());
		pstmt.setString(8, market.getComment());
		pstmt.setInt(9, market.getId());
		return pstmt.executeUpdate();
	}
	
//	public boolean getStudentByGradeId(Connection con,String gradeId)throws Exception{
//		String sql="select * from t_student where gradeId=?";
//		PreparedStatement pstmt=con.prepareStatement(sql);
//		pstmt.setString(1, gradeId);
//		ResultSet rs=pstmt.executeQuery();
//		if(rs.next()){
//			return true;
//		}else{
//			return false;
//		}
//	}

}
