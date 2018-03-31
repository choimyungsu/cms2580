package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.file.Linkfile;

public class UserDAO {

	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT password FROM user WHERE userID = ? ";
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/cms2580");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt  = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				 if(rs.getString(1).equals(userPassword)) {
					rs.close();
					pstmt.close();
					conn.close();
					initCtx.close();
					return 1;//로그인 성공
				 }else{
					rs.close();
					pstmt.close();
					conn.close();
					initCtx.close();
					return 0;//비밀번호 불일치
				 }
			}
			rs.close();
			pstmt.close();
			conn.close();
			initCtx.close();
			return -1;//아이디가 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터 베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/cms2580");
			Connection conn = ds.getConnection();
			int i ;
			PreparedStatement pstmt  = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getUsername());
			pstmt.setString(4, user.getEmail());
			pstmt.setInt(5, 1);
			i = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			initCtx.close();
			
			return i ;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1 ; // 데이텁이스 오류
	}
	

//한건 가져오기
	public Linkfile getFileInformation(String objectLink, String objectLinkPK) {
		
		String SQL = " SELECT * FROM linkFile WHERE objectLink = ?  and objectLinkPK = ? ";
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/cms2580");
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, objectLink);
			pstmt.setString(2, objectLinkPK);
			ResultSet rs = pstmt.executeQuery();
			
			Linkfile fileDTO =new Linkfile();
			while (rs.next()) {
				 //fileDTO = new Linkfile(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
				fileDTO.setLinkfileid(rs.getInt(1));
				fileDTO.setObjectlink(rs.getString(2));
				fileDTO.setObjectlinkpk(rs.getString(3));
				fileDTO.setFilename(rs.getString(4));
				fileDTO.setRealfilename(rs.getString(5));
				fileDTO.setFilepath(rs.getString(6));
				fileDTO.setDownloadcnt(rs.getInt(7));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			initCtx.close();
			return fileDTO;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;//
	}
}
