package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.exam.Examlist;

public class UseranswerdescDAO {
	
	
	DataSource ds;
	public UseranswerdescDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//해설 추가 
	public int insert(String userID, Integer examListID, String answerDesc) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO userAnswerDesc(userID,examListID,answerDesc)  VALUES (? ,?, ? )";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, examListID);
			pstmt.setString(3, answerDesc);
			
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
	
	
	//문제 여러건 가져오기
			public Boolean searchUserAnswerListYN(Integer examListID){
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null; 
				String SQL = " select userAnswerDescID," +
					     "  userID, " +
					     "  examListID, " +
					     "  answerDesc " +
					     " from userAnswerDesc a" +
					     " WHERE examListID = ?  " ;
				
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, examListID);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						return true;
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
				return false;//
				
			}
	
	
	//문제 여러건 가져오기
		public ArrayList<Useranswerdesc> searchUserAnswerList(Integer examListID){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select userAnswerDescID," +
				     "  userID, " +
				     "  examListID, " +
				     "  answerDesc " +
				     " from userAnswerDesc a" +
				     " WHERE examListID = ?  " ;
			
			 ArrayList<Useranswerdesc> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, examListID);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Useranswerdesc useranswerdesc = new Useranswerdesc();	
					
					useranswerdesc.setUseranswerdescid(rs.getInt(1));
					useranswerdesc.setUserid(rs.getString(2));
					useranswerdesc.setExamlistid(rs.getInt(3));
					useranswerdesc.setAnswerdesc(rs.getString(4));
			        
			        list.add(useranswerdesc);
					
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
		
		
		//한건 가져오기
		public Useranswerdesc searchUseranswerdescId(int Useranswerdescid){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select userAnswerDescID," +
				     "  userID, " +
				     "  examListID, " +
				     "  answerDesc " +
				     " from userAnswerDesc a" +
				     " WHERE userAnswerDescID = ?  " ;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,Useranswerdescid);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Useranswerdesc useranswerdesc = new Useranswerdesc();	
					
					useranswerdesc.setUseranswerdescid(rs.getInt(1));
					useranswerdesc.setUserid(rs.getString(2));
					useranswerdesc.setExamlistid(rs.getInt(3));
					useranswerdesc.setAnswerdesc(rs.getString(4));
					
			        return useranswerdesc;
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
			return null;
			
		}
		
		
		
		//한건 수정하기
		public int update(String answerDesc, Integer userAnswerDescID ) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "UPDATE userAnswerDesc SET " +
					     " answerDesc = ?  " +
					     " WHERE userAnswerDescID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, answerDesc);
				pstmt.setInt(2, userAnswerDescID);
				
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
		
		
		//한건 삭제하기
		public int delete(Integer  userAnswerDescID) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = " Delete  from userAnswerDesc WHERE userAnswerDescID = ?";
			
			// "delete from users where id = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, userAnswerDescID);
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
