package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bbs.BbsDAO;


public class BookDAO {
	
	DataSource ds;
	public BookDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//create
	public int insertBook(String title, String author, String imgurl, String catagory, String status, String pdate,String description ) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO book(TITLE, AUTHOR,C_DATE,MAIN_IMG_URL,U_DATE,CATAGORY,STATUS,P_DATE,DESCRIPTION)  VALUES (?, ? ,?, ?, ?, ?,?,?,? )";
		BbsDAO bbsDAO = new BbsDAO(); 
		String date = bbsDAO.getDate();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, date);//생성일
			pstmt.setString(4, imgurl);
			pstmt.setString(5, date);//변경일
			pstmt.setString(6, catagory);
			pstmt.setString(7, status);
			pstmt.setString(8, pdate);//발행일
			pstmt.setString(9, description);//책 설명 
			
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
	public ArrayList<Book> searchBookList(String Author){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String turn2 ="";

		String SQL = " SELECT ID, "
				+ " TITLE, "
				+ "AUTHOR, "
				+ "C_DATE, "
				+ "MAIN_IMG_URL, "
				+ "U_DATE, "
				+ "CATAGORY, "
				+ "STATUS, "
				+ "P_DATE, " 
				+ "DESCRIPTION " 
				+ " FROM book " 
				//+ " where P_DATE !=null "
				+ " ORDER BY TITLE asc " ;

		ArrayList<Book> list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, examcode);
//			pstmt.setString(2, turn);
//			pstmt.setString(3, turn2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book();	
				
				book.setId(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setCdate(rs.getString(4));
				book.setMainImgUrl(rs.getString(5));
				book.setUdate(rs.getString(6));
				book.setCatagory(rs.getString(7));
				book.setStatus(rs.getString(8));
				book.setPdate(rs.getString(9));
				book.setDescription(rs.getString(10));
	
		        list.add(book);
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
		public Book searchBook(String bookID){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String turn2 ="";

			String SQL = " SELECT ID, "
					+ " TITLE, "
					+ "AUTHOR, "
					+ "C_DATE, "
					+ "MAIN_IMG_URL, "
					+ "U_DATE, "
					+ "CATAGORY, "
					+ "STATUS, "
					+ "P_DATE, " 
					+ "DESCRIPTION " 
					+ " FROM book " 
					+ " where ID = ?  "
					+ " ORDER BY ID DESC " ;

			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, bookID);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Book book = new Book();	
					book.setId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setCdate(rs.getString(4));
					book.setMainImgUrl(rs.getString(5));
					book.setUdate(rs.getString(6));
					book.setCatagory(rs.getString(7));
					book.setStatus(rs.getString(8));
					book.setPdate(rs.getString(9));
					book.setDescription(rs.getString(10));
					return book;//
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
		public int updateBook(String bookID, String Title, String imgurl, String catagory,String status,String Description) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			BbsDAO bbsDAO = new BbsDAO(); 
			String date = bbsDAO.getDate();//현재 날짜 가져오기
			
			
			String SQL = "UPDATE book SET TITLE = ? ,  MAIN_IMG_URL = ? ,CATAGORY = ?, STATUS =?, DESCRIPTION = ?, U_DATE = ? WHERE ID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, Title);
				pstmt.setString(2, imgurl);
				pstmt.setString(3, catagory);
				pstmt.setString(4, status);
				pstmt.setString(5, Description);
				pstmt.setString(6, date);
				pstmt.setString(7, bookID);
				
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
		public int deleteBook(String bookID) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "DELETE from book WHERE ID = ?";
					
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, bookID);
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