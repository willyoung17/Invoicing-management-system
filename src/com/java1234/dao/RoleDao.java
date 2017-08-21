package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.PageBean;
import com.java1234.model.Role;
import com.java1234.util.DateUtil;
import com.java1234.util.MD5;
import com.java1234.util.StringUtil;

public class RoleDao {
	/**
	 * 获取角色列表
	 * @param con
	 * @param pageBean
	 * @param role
	 * @return
	 * @throws Exception
	 */
	public ResultSet roleList(Connection con,PageBean pageBean,Role role)throws Exception{
		StringBuffer sb=new StringBuffer("select * from role");
		
		if(role!=null && StringUtil.isNotEmpty(role.getRolename())){
			sb.append(" and rolename like '%"+role.getRolename()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	/**
	 * 获取用户数量
	 * @param con
	 * @param role
	 * @return
	 * @throws Exception
	 */
	public int roleCount(Connection con,Role role)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from role");
		if(StringUtil.isNotEmpty(role.getRolename())){
			sb.append(" and rolename like '%"+role.getRolename()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	/**
	 * delete from tableName where field in (1,3,5)
	 * @param con
	 * @param delIds
	 * @return
	 * @throws Exception
	 */
	public int roleDelete(Connection con,String delIds)throws Exception{
		String sql="delete from role where id in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int roleAdd(Connection con,Role role)throws Exception{
		
		String sql="insert into role values(null,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, role.getRolename());
		pstmt.setString(2, role.getMenu());
		pstmt.setString(3,role.getIsForb());

		return pstmt.executeUpdate();
	}
	
	public int roleModify(Connection con,Role role)throws Exception{
		String sql="update role set rolename=?,menu=?,isForb=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, role.getRolename());
		pstmt.setString(2, role.getMenu());
		pstmt.setString(3,role.getIsForb());
		pstmt.setInt(4,role.getId());
		return pstmt.executeUpdate();
	}
}
