package com.link;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LinkurlDAO {
	DataSource ds;
	public LinkurlDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//관련 url insert 
		public int insertLinkUrl(String objectLink, String objectLinkPK, String linkUrl) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "INSERT INTO linkUrl(objectLink,objectLinkPK,linkUrl)  VALUES (? ,?, ? )";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, objectLink);
				pstmt.setString(2, objectLinkPK);
				pstmt.setString(3, linkUrl);
				
				return pstmt.executeUpdate();
				
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
			return -1;//데이터베이스 오류
		}
		
		//한건 수정하기
		public int updateLinkUrl(int linkURLID, String linkUrl) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "UPDATE linkUrl SET linkUrl = ? WHERE linkURLID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, linkUrl);
				pstmt.setInt(2, linkURLID);
				
				return  pstmt.executeUpdate();
				
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
			return -1;//데이터베이스 오류
			
		}	
		
		

}
