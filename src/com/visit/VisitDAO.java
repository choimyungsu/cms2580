package com.visit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class VisitDAO {
	
	DataSource ds;
	public VisitDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//방문수 추가 
			public int insert(String userID, String userIP) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String SQL = "INSERT INTO VISIT (VISIT_DT,USER_ID,USER_IP)  VALUES (now() ,?, ? )";
			
				
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, userID);
					pstmt.setString(2, userIP);
					
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
			
			
			public String visitCount(String defaultDate){
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null; 
				String SQL = " select count(VISIT_ID) from VISIT" + 
						     " where VISIT_DT like ? ";
		
				String visitCount = "0";
				
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, defaultDate+"%"); // 기본 오늘?
					rs = pstmt.executeQuery();
					while (rs.next()) {
						visitCount =  rs.getString(1);
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
				return visitCount;//
				
			}			

}
