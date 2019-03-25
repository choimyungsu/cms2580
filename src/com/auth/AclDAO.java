package com.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.common.Util;


public class AclDAO {
	
	DataSource ds;
	public AclDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//권한코드 조회
	public ArrayList<Aclauth> authList(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String SQL = " SELECT AUTH_CD, AUTH_NM, AUTH_DC, CREATE_DT, UPDATE_DT " + 
				     " FROM ACLAUTH " ;

		
		 ArrayList<Aclauth> list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Aclauth aclauth = new Aclauth();
				aclauth.setAuthCd(rs.getString(1));
				aclauth.setAuthNm(rs.getString(2));
				aclauth.setAuthDc(rs.getString(3));
				aclauth.setCreateDt(rs.getString(4));
				aclauth.setUpdateDt(rs.getString(5));
				
		        list.add(aclauth);
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
	
	
	//리소스 조회
	public ArrayList<Aclresource> resourceList(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " SELECT RESOURCE_CD, RESOURCE_NM, RESOURCE_DC, RESOURCE_URL, CREATE_DT, UPDATE_DT " + 
					     " FROM ACLRESOURCE " ;
	
			
			 ArrayList<Aclresource> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Aclresource aclresource = new Aclresource();
					aclresource.setResourceCd(rs.getString(1));
					aclresource.setResourceNm(rs.getString(2));
					aclresource.setResourceDc(rs.getString(3));
					aclresource.setResourceUrl(rs.getString(4));
					aclresource.setCreateDt(rs.getString(5));
					aclresource.setUpdateDt(rs.getString(6));
					
			        list.add(aclresource);
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
	
	
	
	//권한별 리소스 조회
		public ArrayList<Aclauthresource> authResourceList(String authCd){
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null; 
				String SQL = " SELECT a.AUTH_CD, a.RESOURCE_CD, a.USE_YN, a.CREATE_YN, a.READ_YN, a.UPDATE_YN, a.DELETE_YN, a.CREATE_DT, a.UPDATE_DT, b.RESOURCE_NM " + 
						     " FROM ACLAUTHRESOURCE a , ACLRESOURCE b " +
						     " WHERE a.AUTH_CD = ?" +
						     " and a.RESOURCE_CD = b.RESOURCE_CD ";
		
				
				 ArrayList<Aclauthresource> list = new ArrayList();
				
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, authCd);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Aclauthresource aclauthresource = new Aclauthresource();
						
						aclauthresource.setAuthCd(rs.getString(1));
						aclauthresource.setResourceCd(rs.getString(2));
						aclauthresource.setUseYn(rs.getString(3));
						aclauthresource.setCreateYn(rs.getString(4));
						aclauthresource.setReadYn(rs.getString(5));
						aclauthresource.setUpdateYn(rs.getString(6));
						aclauthresource.setDeleteYn(rs.getString(7));
						aclauthresource.setCreateDt(rs.getString(8));
						aclauthresource.setUpdateDt(rs.getString(9));
						aclauthresource.setResourceNm(rs.getString(10));
						
				        list.add(aclauthresource);
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
		
		
		
		public String getListJSON(String authCd){
			
			ArrayList<Aclauthresource> list = new ArrayList<Aclauthresource>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String jsonData="";
			String SQL = " SELECT a.AUTH_CD, a.RESOURCE_CD, a.USE_YN, a.CREATE_YN, a.READ_YN, a.UPDATE_YN, a.DELETE_YN, a.CREATE_DT, a.UPDATE_DT, b.RESOURCE_NM, a.PRINT_YN " + 
				     " FROM ACLAUTHRESOURCE a , ACLRESOURCE b " +
				     " WHERE a.AUTH_CD = ?" +
				     " and a.RESOURCE_CD = b.RESOURCE_CD ";
			
			try {
				conn = ds.getConnection();
				pstmt  = conn.prepareStatement(SQL);
				pstmt.setString(1, authCd);
				
				rs = pstmt.executeQuery();
				Util util = new Util();
				jsonData = util.getJSONFromResultSet(rs,"gridData");// 공통함수 호출
				
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
			return jsonData;//
		}

}
