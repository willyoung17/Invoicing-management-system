package com.java1234.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.java1234.model.KuCun;
import com.java1234.model.PageBean;
import com.java1234.util.StringUtil;

public class KuCunDao {
	public ResultSet searchSp(Connection con,PageBean pageBean,KuCun kucun)throws Exception{
		StringBuffer sb=new StringBuffer("select number,id,spname,gg,cd,bz,dw,dj,kcsl from tb_kucun where 1=1");
		if(StringUtil.isNotEmpty(kucun.getSpname())){
			sb.append(" and spname like '%"+kucun.getSpname()+"%'");
		}
		if(StringUtil.isNotEmpty(kucun.getId())){
			sb.append(" and id like '%"+kucun.getId()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int shangpinCount(Connection con,KuCun kucun)throws Exception{
		StringBuffer sb=new StringBuffer("select count(0) as total from tb_kucun where 1=1");
		if(StringUtil.isNotEmpty(kucun.getSpname())){
			sb.append(" and spname like '%"+kucun.getSpname()+"%'");
		}
		if(StringUtil.isNotEmpty(kucun.getId())){
			sb.append(" and id like '%"+kucun.getId()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	
	
	public int KuCunAdd(Connection con,KuCun kucun)throws Exception{
		String sql="insert into tb_kucun values(null,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, kucun.getId());
		pstmt.setString(2, kucun.getSpname());
		pstmt.setString(3, kucun.getJc());
		pstmt.setString(4,kucun.getGg());
		pstmt.setString(5, kucun.getCd());
		pstmt.setString(6, kucun.getBz());
		pstmt.setString(7, kucun.getDw());
		pstmt.setInt(8, kucun.getDj());
		pstmt.setInt(9, kucun.getKcsl());
		return pstmt.executeUpdate();
	}
	
	public int shuliangModify(Connection con,KuCun kucun)throws Exception{
		String sql="update tb_kucun set kcsl=kcsl+? where 1=1";
		if(StringUtil.isNotEmpty(kucun.getSpname())){
			  sql=sql+" and  spname='"+kucun.getSpname()+"'";
		}
		if(StringUtil.isNotEmpty(kucun.getId())){
			sql=sql+" and id='"+kucun.getId()+"'";
			 
		}
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, kucun.getKcsl());
		return pstmt.executeUpdate();
	}
	
	public int shuliangdelete(Connection con,KuCun kucun)throws Exception{
		String sql="update tb_kucun set kcsl=kcsl-? where 1=1";
		if(StringUtil.isNotEmpty(kucun.getSpname())){
			  sql=sql+" and  spname='"+kucun.getSpname()+"'";
		}
		if(StringUtil.isNotEmpty(kucun.getId())){
			sql=sql+" and id='"+kucun.getId()+"'";
		}
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, kucun.getKcsl());
		return pstmt.executeUpdate();
	}
	
	public int danjiaModify(Connection con,KuCun kucun)throws Exception{
		String sql="update tb_kucun set dj=? where number=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setLong(1, kucun.getDj());
		pstmt.setInt(2, kucun.getNumber());
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
