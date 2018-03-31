package com.exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ExamcontentsDAO {
	
	DataSource ds;
	public ExamcontentsDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//문제 여러건 가져오기
		public ArrayList<Examcontents> searchExamcontents(String examcode){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = "	select " + 
			 		"	examContentsID," + 
			 		"	seq," + 
			 		"	domain," + 
			 		"	subject," + 
			 		"	ifnull(linkUrl,''), " +
			 		"	examCode," +
			 		"	objectLink " + 
			 		"	from  examContents  " + 
			 		"	left outer join  linkUrl   " + 
			 		"	on examContentsID = objectLinkPK " + 
			 		"	where examCode= ? "+
			 		"   order by seq ";
			 
			 
			 ArrayList<Examcontents> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, examcode);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Examcontents examcontents = new Examcontents();	
					examcontents.setExamcontentsid(rs.getInt(1));
					examcontents.setSeq(rs.getString(2));
					examcontents.setDomain(rs.getString(3));
					examcontents.setSubject(rs.getString(4));
					examcontents.setLinkurl(rs.getString(5));
					
			        list.add(examcontents);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt !=null) pstmt.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return list;//
			
		}

}
