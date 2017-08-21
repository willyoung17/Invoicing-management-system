package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.Grade;
import com.java1234.model.PageBean;
import com.java1234.model.User;
import com.java1234.util.MD5;
import com.java1234.util.StringUtil;


public class UserDao {

	/**
	 * 登录验证
	 * @param con
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public User login(Connection con,User user) throws Exception{
		User resultUser=new User();
		String sql="select * from user where username=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			resultUser.setUserName(rs.getString("username"));
			resultUser.setPassword(rs.getString("password"));
			resultUser.setSalt(rs.getString("salt"));
			resultUser.setBlacklist(rs.getString("blacklist"));
			resultUser.setType(rs.getString("type"));
		}
		return resultUser;
	}
	/**
	 * 获取用户列表
	 * @param con
	 * @param pageBean
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public ResultSet userList(Connection con,PageBean pageBean,User user)throws Exception{
		StringBuffer sb=new StringBuffer("select * from user");
		if(user!=null && StringUtil.isNotEmpty(user.getUserName())){
			sb.append(" and username like '%"+user.getUserName()+"%'");
		}
		if(user!=null && StringUtil.isNotEmpty(user.getNum())){
			sb.append(" and num like '%"+user.getNum()+"%'");
		}
		if(user!=null && StringUtil.isNotEmpty(user.getType())){
			sb.append(" and type like '%"+user.getType() +"%'");
		}
		if(user!=null && StringUtil.isNotEmpty(user.getBlacklist())){
			sb.append(" and blacklist like '%"+user.getBlacklist() +"%'");
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
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int userCount(Connection con,User user)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from user");
		if(StringUtil.isNotEmpty(user.getUserName())){
			sb.append(" and username like '%"+user.getUserName()+"%'");
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
	public int userDelete(Connection con,String delIds)throws Exception{
		String sql="delete from user where id in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int userAdd(Connection con,User user)throws Exception{
		
		String sql="insert into user values(null,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getNum());
		pstmt.setString(2, user.getUserName());
		String salt = MD5.getRandomStr(10);
		String password = user.getPassword();
		String md5 = MD5.getMD5Str(password, salt);
		pstmt.setString(3,md5);
		pstmt.setString(4,salt);
		pstmt.setString(5, user.getType());
		pstmt.setString(6,user.getBlacklist());

		return pstmt.executeUpdate();
	}
	
	public int userModify(Connection con,User user)throws Exception{
		String sql="update user set num=?,password=?,salt=?,type=?,blacklist=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getNum());
		String salt = MD5.getRandomStr(10);
		String password = user.getPassword();
		String md5 = MD5.getMD5Str(password, salt);
		pstmt.setString(2,md5);
		pstmt.setString(3,salt);
		pstmt.setString(4, user.getType());
		pstmt.setString(5,user.getBlacklist());
		pstmt.setInt(6, user.getId());
		System.out.println(sql);
		return pstmt.executeUpdate();
	}
}
