package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.java1234.model.Chuku;
import com.java1234.model.RuKu;
import com.java1234.util.DateUtil;



public class ChuKuDao {
	public int ruKuAdd(Connection con,Chuku chuku)throws Exception{
		String sql="insert into tb_xiaoshou values(null,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, chuku.getKh());
		pstmt.setString(2, chuku.getLxr());
		pstmt.setString(3, chuku.getJsfs());

		pstmt.setString(4, DateUtil.formatDate(chuku.getXssj(), "yyyy-MM-dd"));
		pstmt.setString(5, chuku.getSpId());
		pstmt.setString(6, chuku.getSpName());
		pstmt.setInt(7, chuku.getSpDj());
		pstmt.setInt(8, chuku.getSpSl());
		pstmt.setInt(9, chuku.getZje());
		pstmt.setString(10, chuku.getYsjl());
		pstmt.setString(11, chuku.getCzy());
		return pstmt.executeUpdate();
	}
	
}
