package com.exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.link.LinkurlDAO;

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
			 		"	ifnull(definition,'')," +
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
					examcontents.setDefinition(rs.getString(5));
					examcontents.setLinkurl(rs.getString(6));
					examcontents.setExamcode(rs.getString(7));
					
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
		
		
		//한건 가져오기
				public Examcontents searchExamContents(String examContentsID){
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null; 
					String SQL = "	select " + 
					 		"	examContentsID," + 
					 		"	seq," + 
					 		"	domain," + 
					 		"	subject," + 
					 		"	ifnull(definition,'')," +
					 		"	ifnull(linkUrl,''), " +
					 		"	examCode," +
					 		"	objectLink " + 
					 		"	from  examContents  " + 
					 		"	left outer join  linkUrl   " + 
					 		"	on examContentsID = objectLinkPK " + 
					 		"	where examContentsID= ? ";
					
					try {
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, examContentsID);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							Examcontents examcontents = new Examcontents();	
							examcontents.setExamcontentsid(rs.getInt(1));
							examcontents.setSeq(rs.getString(2));
							examcontents.setDomain(rs.getString(3));
							examcontents.setSubject(rs.getString(4));
							examcontents.setDefinition(rs.getString(5));
							examcontents.setLinkurl(rs.getString(6));
							examcontents.setExamcode(rs.getString(7));
					        return examcontents;
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
		
		
		
		
		//랜덤 10건 가져오기
				public ArrayList<Examcontents> searchRandomExamcontents(String examcode){
					
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null; 
					String SQL = "	select " + 
					 		"	examContentsID," + 
					 		"	seq," + 
					 		"	domain," + 
					 		"	subject," + 
					 		"	ifnull(definition,''), " + 
					 		"	ifnull(linkUrl,''), " +
					 		"	examCode," +
					 		"	objectLink " + 
					 		"	from  examContents  " + 
					 		"	left outer join  linkUrl   " + 
					 		"	on examContentsID = objectLinkPK " + 
					 		"	where examCode= ? "+
					 		"   order by rand() limit 10 ";
					 
					 
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
							examcontents.setDefinition(rs.getString(5));
							examcontents.setLinkurl(rs.getString(6));
							examcontents.setExamcode(rs.getString(7));
							
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
				
				
				//한건 수정하기
				public int updateExamcontents(int examContentsID, String definition, String linkUrl) {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String SQL = "UPDATE examContents SET definition = ? WHERE examContentsID = ?";
							
					try {
						
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(SQL);
						
						pstmt.setString(1, definition);
						pstmt.setInt(2, examContentsID);
						
						int a = pstmt.executeUpdate();
						
						if(linkUrl !=null && linkUrl.length()> 0) {
							LinkurlDAO linkurlDAO = new LinkurlDAO();
							linkurlDAO.insertLinkUrl("examContents", Integer.toString(examContentsID), linkUrl);
						}
						
						return  a;
						
						
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
				
				
				//기술사문제 insert(엑셀) 
				public int insertContents(String examCode, String seq, String domain,String subject) {
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String SQL = "INSERT INTO examContents(examCode,seq,domain,subject)  VALUES (? ,?, ?, ?)";
					
					try {
						conn = ds.getConnection();
						pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, examCode);
						pstmt.setString(2, seq);
						pstmt.setString(3, domain);
						pstmt.setString(4, subject);
						
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
