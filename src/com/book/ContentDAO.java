package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.bbs.BbsDAO;

public class ContentDAO {
	
	DataSource ds;
	public ContentDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//create
	public int insertContent(String bookID, String title, String text, String imgurl ) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO CONTENT (BOOK_ID,TITLE, TEXT,C_DATE,U_DATE,P_DATE,CONTENTS_IMG_URL)  VALUES (?, ? ,?, ?, ?, ?, ? )";
		BbsDAO bbsDAO = new BbsDAO(); 
		String date = bbsDAO.getDate();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookID);
			pstmt.setString(2, title);
			pstmt.setString(3, text);
			pstmt.setString(4, date);//생성일
			pstmt.setString(5, date);//변경일
			pstmt.setString(6, date);//발행일
			pstmt.setString(7, imgurl);
			
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
	
	//Read - List
	public ArrayList<Content> searchContents(String bookId){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 

		String SQL = " SELECT ID, "
				+ " BOOK_ID, "
				+ "TITLE, "
				+ "TEXT, "
				+ "C_DATE, "
				+ "U_DATE, "
				+ "P_DATE, " 
				+ "CONTENTS_IMG_URL "
				+ " FROM CONTENT " 
				+ " where BOOK_ID = ? "
				+ " ORDER BY TITLE " ;

		ArrayList<Content> list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Content content = new Content();	
				
				content.setId(rs.getInt(1));
				content.setBookId(rs.getString(2));
				content.setTitle(rs.getString(3));
				content.setText(rs.getString(4));
				content.setCDate(rs.getString(5));
				content.setUDate(rs.getString(6));
				content.setPDate(rs.getString(7));
				content.setContentsImgUrl(rs.getString(8));
	
		        list.add(content);
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
	
	
	
	//Read -1건
	
public Content searchContent(String contentId){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 

		String SQL = " SELECT ID, "
				+ " BOOK_ID, "
				+ "TITLE, "
				+ "TEXT, "
				+ "C_DATE, "
				+ "U_DATE, "
				+ "P_DATE, " 
				+ "CONTENTS_IMG_URL "
				+ " FROM CONTENT " 
				+ " where ID = ? "
				+ " ORDER BY TITLE " ;

		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, contentId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Content content = new Content();	
				
				content.setId(rs.getInt(1));
				content.setBookId(rs.getString(2));
				content.setTitle(rs.getString(3));
				content.setText(rs.getString(4));
				content.setCDate(rs.getString(5));
				content.setUDate(rs.getString(6));
				content.setPDate(rs.getString(7));
				content.setContentsImgUrl(rs.getString(8));
	
		        return content;
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
		return null;//
		
	}
	
	//Update
	public int updateContent(int contentId, String Title, String text, String imgurl) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE CONTENT SET TITLE = ? , TEXT = ?, CONTENTS_IMG_URL = ?  WHERE ID = ?";
				
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, Title);
			pstmt.setString(2, text);
			pstmt.setString(3, imgurl);
			pstmt.setInt(4, contentId);
			
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

	//Delete
	public int deleteContent(int ID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "DELETE from CONTENT WHERE ID = ?";
				
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, ID);
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
		
	
}