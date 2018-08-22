package com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.exam.Examlist;
import com.file.Linkfile;

public class UserDAO {

	DataSource ds;
	public UserDAO() {//������ ���� ����
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int login(String userID, String userPassword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT password FROM user WHERE userID = ? ";
		try {
			conn = ds.getConnection();
			pstmt  = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				 if(rs.getString(1).equals(userPassword)) {
					return 1;//�α��� ����
				 }else{
					return 0;//��й�ȣ ����ġ
				 }
			}
			return -1;//���̵� ����
		}catch (Exception e) {
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
		return -2;// ������ ���̽� ����
	}
	
	public int join(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?,now())";
		try {
			conn = ds.getConnection();
			pstmt  = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getUsername());
			pstmt.setString(4, user.getEmail());
			pstmt.setInt(5, 1);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				//if(rs!=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1 ; // �������̽� ����
	}
	

//�Ѱ� ��������
	public Linkfile getFileInformation(String objectLink, String objectLinkPK) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = " SELECT * FROM linkFile WHERE objectLink = ?  and objectLinkPK = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, objectLink);
			pstmt.setString(2, objectLinkPK);
			rs = pstmt.executeQuery();
			
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
			
			return fileDTO;
			
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
	
	
	
	//ȸ�� ���� ��������
		public ArrayList<User> userList(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select userID, " +
				     "  userName, " +
				     "  email, " +
				     "  available, " +
				     "  joinDate " +
				     " from user " ;

			
			 ArrayList<User> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					User user = new User();	
					user.setUserid(rs.getString(1));
					user.setUsername(rs.getString(2));
					user.setEmail(rs.getString(3));
					user.setAvailable(rs.getInt(4));
					user.setJoinDate(rs.getString(5));
			        list.add(user);
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
