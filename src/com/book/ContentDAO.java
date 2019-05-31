package com.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONValue;

import com.bbs.BbsDAO;
import com.calendar.Calendar;

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
	public int insertContent(String bookID, String title, String text, String imgurl, String pid, String tDate ) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO content (BOOK_ID,TITLE, TEXT,C_DATE,U_DATE,P_DATE,CONTENTS_IMG_URL,P_ID,T_DATE)  VALUES (?, ? ,?, ?, ?, ?, ?, ?, ? )";
		BbsDAO bbsDAO = new BbsDAO(); 
		String date = bbsDAO.getDate();
		if(pid == null) {
			pid = "0";
		}
		
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
			pstmt.setString(8, pid);//부모 ID
			pstmt.setString(9, tDate);//timeline date
			
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
	public ArrayList<Content> searchContents(String bookId, String contentId){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String contentIdNotIn ="";
		
		if(contentId !=null && contentId.length() > 0 ) {
			contentIdNotIn = " and ID != " +  contentId;
		}

		String SQL = " SELECT ID, "
				+ " BOOK_ID, "
				+ "TITLE, "
				+ "TEXT, "
				+ "C_DATE, "
				+ "U_DATE, "
				+ "P_DATE, " 
				+ "CONTENTS_IMG_URL, "
				+ "CNT, "
				+ "P_ID "
				+ " FROM content " 
				+ " where BOOK_ID = ? "
				//+ contentIdNotIn
				+ " ORDER BY TITLE " ;	


		ArrayList<Content> list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			int i=0;
			while (rs.next()) {
				i++;
				Content content = new Content();	
				
				content.setId(rs.getInt(1));
				content.setBookId(rs.getString(2));
				content.setTitle(rs.getString(3));
				content.setText(rs.getString(4));
				content.setCDate(rs.getString(5));
				content.setUDate(rs.getString(6));
				content.setPDate(rs.getString(7));
				content.setContentsImgUrl(rs.getString(8));
				content.setCnt(rs.getString(9));
				content.setPid(rs.getString(10));
	
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
	
	//Read - List
		public ArrayList<Content> searchContentsPage(String bookId, String contentId){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String contentIdNotIn ="";
			
			if(contentId !=null && contentId.length() > 0 ) {
				contentIdNotIn = " and ID != " +  contentId;
			}

			String SQL = " SELECT ID, "
					+ " BOOK_ID, "
					+ "TITLE, "
					+ "TEXT, "
					+ "C_DATE, "
					+ "U_DATE, "
					+ "P_DATE, " 
					+ "CONTENTS_IMG_URL, "
					+ "CNT, "
					+ "P_ID "
					+ " FROM content " 
					+ " where BOOK_ID = ? "
					+ contentIdNotIn
					+ " ORDER BY TITLE " ;	


			ArrayList<Content> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, bookId);
				rs = pstmt.executeQuery();
				int i=0;
				while (rs.next()) {
					i++;
					Content content = new Content();	
					
					content.setId(rs.getInt(1));
					content.setBookId(rs.getString(2));
					content.setTitle(rs.getString(3));
					content.setText(rs.getString(4));
					content.setCDate(rs.getString(5));
					content.setUDate(rs.getString(6));
					content.setPDate(rs.getString(7));
					content.setContentsImgUrl(rs.getString(8));
					content.setCnt(rs.getString(9));
					content.setPid(rs.getString(10));
		
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
	
		
		
		
		//Read - List
		public ArrayList<Content> searchContentsNoLinkBook(){
			
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
					+ "CONTENTS_IMG_URL, "
					+ "CNT, "
					+ "P_ID, "
					+ "T_DATE "
					+ " FROM content " 
					+ " where BOOK_ID is null "
					+ " ORDER BY T_DATE DESC " ;	


			ArrayList<Content> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				int i=0;
				while (rs.next()) {
					i++;
					Content content = new Content();	
					
					content.setId(rs.getInt(1));
					content.setBookId(rs.getString(2));
					content.setTitle(rs.getString(3));
					content.setText(rs.getString(4));
					content.setCDate(rs.getString(5));
					content.setUDate(rs.getString(6));
					content.setPDate(rs.getString(7));
					content.setContentsImgUrl(rs.getString(8));
					content.setCnt(rs.getString(9));
					content.setPid(rs.getString(10));
					content.settdate(rs.getString(11));
		
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
		
		
		
		
	// JSON 타입 변환 
	public String getContentListJSON(String bookId, String contentId) {
		StringBuffer result = new StringBuffer("");
		ArrayList<Content> content = this.searchContents(bookId, contentId);
		String pid="#";
		
		for(int i=0; i<content.size(); i++) {
			//{ "id" : "ajson1", "parent" : "#", "text" : "Simple root node" ,"a_attr":{"href":"#"} }, 이런형태 
			//contentDetail.jsp?contentId###"+item.get(idKey)+"&bookId###"+ bookId + 
			
			result.append("{ ");
			if(content.get(i).getId()!=null ) {
				result.append("\"id\": \"" +content.get(i).getId() + "\",");
			}
			
			if(content.get(i).getPid().equals("0")) {
				pid ="#";//최상위일때는 "#"으로 변환 
			}else {
				pid = content.get(i).getPid();//
			}
			
			result.append("\"parent\": \"" + pid + "\",");
			result.append("\"text\": \"" +content.get(i).getTitle() + "\",");
			result.append("\"a_attr\": {\"href\": \"contentDetail.jsp?contentId=" +content.get(i).getId() + "&bookId="+bookId+"\"},");
			if(content.get(i).getId().toString().equals(contentId)) {
				result.append("\"state\": {\"selected\": true},");
			}
			result.append("\"type\": \"default\"");
			result.append("}, ");
			
		}
		
		//System.out.println("result.toString()"+result.toString());
		return result.toString();

		
		}
	
	//Read - JSON (jqtree용)
	
		public ArrayList<Map<String, Object>> searchContentsJSON(String bookId){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 

			String SQL = "SELECT  CAST(ou.ID AS CHAR) AS ID, P_ID, CAST(ou.TITLE AS CHAR) AS TITLE, seq, level,leaf,BOOK_ID FROM (" + 
					"                 SELECT mn.TITLE , mn.ID,  P_ID, SEQ, level,leaf,mn.BOOK_ID FROM ( " + 
					"					   SELECT hierarchy_connect_by_parent_eq_prior_no(ID) AS ID," + 
					"							  @level AS level" + 
					"                      ,(SELECT t1.ID FROM" + 
					"							content AS t1 LEFT JOIN content as t2" + 
					"							ON t1.ID = t2.P_ID" + 
					"							WHERE t2.ID IS NULL" + 
					"							and t1.ID = @id ) AS leaf, BOOK_ID" + 
					"					   FROM (" + 
					"							SELECT @start_with := 0, @id := @start_with, @level := 0" + 
					"							) vars, content" + 
					"					   WHERE @id IS NOT NULL" + 
					"					   ) m" + 
					"						 JOIN content mn ON mn.ID = m.ID" +
					"                        and mn.book_id= ? " + 
					"                 ) ou ;	";


			ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			//List<Map<String, Object>>
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, bookId);
				rs = pstmt.executeQuery();
				//System.out.println("rs.next()====>"+ rs.next());
				int i=0;
				while (rs.next()) {
					i++;
					System.out.println("rs size="+ i);
					
					//Menu menu = new Menu();	
					
					Map model = new HashMap();

					model.put("id", rs.getString(1));
					model.put("pid", rs.getString(2));
					model.put("label", rs.getString(3));// jqtree 양식에 맞춰서 label 로 변경       
					model.put("seq", rs.getString(4));
					model.put("level", rs.getString(5));
					model.put("leaf", rs.getString(6));
					model.put("bookid", rs.getString(7));
					
					//model.put(Integer.toString(i),menu);
		
			        list.add(model);
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
	/*
		{text: '목차1', children: [
		                           {text: '목차1-1'},
		                           {text: '목차1-2', children: [
		                            				{text: '목차1-2-1'}		
		                                            ]},
		                           ]},
         {text: '목차2',children: [
         							{text: '목차2-1', children: [
         											 {text: '목차2-1-1'}
         											 ]},
         							{text: '목차2-2', children: [
         											{text: '목차2-2-1'},
         											{text: '목차2-2-2'}
         							                 ]},
         							
         							]}
         							

		                       
		                       */

	
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
				+ "CONTENTS_IMG_URL, "
				+ "CNT, "
				+ "P_ID, "
				+ "T_DATE "
				+ " FROM content " 
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
				content.setCnt(rs.getString(9));
				content.setPid(rs.getString(10));
				content.settdate(rs.getString(11));
				
	
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
	public int updateContent(int contentId, String Title, String text,   String imgurl, String pid, String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE content SET TITLE = ? , TEXT = ?, CONTENTS_IMG_URL = ?, P_ID =? , SEQ=?  WHERE ID = ?";
				
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, Title);
			pstmt.setString(2, text);
			pstmt.setString(3, imgurl);
			pstmt.setString(4, pid);
			pstmt.setString(5, seq);
			
			pstmt.setInt(6, contentId);
			
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
	
	//Update
		public int updateContent2(int contentId, String Title, String text,   String imgurl, String pid, String seq, String tdate) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "UPDATE content SET TITLE = ? , TEXT = ?, CONTENTS_IMG_URL = ?, P_ID =? , SEQ=?, T_DATE=?  WHERE ID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, Title);
				pstmt.setString(2, text);
				pstmt.setString(3, imgurl);
				pstmt.setString(4, pid);
				pstmt.setString(5, seq);
				pstmt.setString(6, tdate);
				
				pstmt.setInt(7, contentId);
				
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
	
	//Update Book
		public int updateContentToLinkBook(int contentId, String bookId) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "UPDATE content SET BOOK_ID=?  WHERE ID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, bookId);
				pstmt.setInt(2, contentId);
				
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
	
	//조회수 추가 
		public int updateCnt(String contentId) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "UPDATE content SET CNT = CNT+1  WHERE ID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, contentId);
				
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
		String SQL = "DELETE from content WHERE ID = ?";
				
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