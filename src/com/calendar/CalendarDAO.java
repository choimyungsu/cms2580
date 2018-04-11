package com.calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.exam.Examgroupcount;
import com.exam.Examlist;

public class CalendarDAO {
	
	DataSource ds;
	public CalendarDAO() {//������ ���� ����
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//���� ������ ��������
		public ArrayList<Calendar> searchCalendarList(String defaultDate, String toDate){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select calendarID, " +
						 "  ifnull(id,''), " +
						 "  ifnull(title,''), " +
						 "  start, " +
						 "  end, " +
						 "  ifnull(url,'') " +
						 " from calendar " +
						 " WHERE  start between  ? and  ?  ";
			
	
			 ArrayList<Calendar> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, defaultDate); // �ſ� 1��
				pstmt.setString(2, toDate); // �״����� 1�� 
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Calendar calendar = new Calendar();	
					
					calendar.setCalendarid(rs.getInt(1));
					calendar.setId(rs.getString(2));
					calendar.setTitle(rs.getString(3));
					if(rs.getDate(4) !=null) {
						calendar.setStart(rs.getDate(4).toString()); // Date Ÿ���� ��Ʈ������ ��ȯ 
					}
					if(rs.getDate(5) !=null) {
						calendar.setEnd(rs.getDate(5).toString()); // Date Ÿ���� ��Ʈ������ ��ȯ 
					}
					calendar.setUrl(rs.getString(6));
			        
			        list.add(calendar);
					
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
		
		// JSON Ÿ�� ��ȯ 
		public String getCalendarListJSON(String defaultDate) {
			StringBuffer result = new StringBuffer("");
			ArrayList<Calendar> clendar = this.searchCalendarList("2018-01-01", "2022-01-01");
			result.append(" events: [" );// ó�� ����
			for(int i=0; i<clendar.size(); i++) {
				
				result.append("{ ");
				if(clendar.get(i).getId()!=null && clendar.get(i).getId().length()>0) {
					result.append("id: \"" +clendar.get(i).getId() + "\",");
				}
				result.append("title: \"" +clendar.get(i).getTitle() + "\",");
				result.append("start: \"" +clendar.get(i).getStart() + "\",");
				result.append("end: \"" +clendar.get(i).getEnd() + "\",");
				result.append("url: \"" +clendar.get(i).getUrl() + "\" ");
				
				result.append("} ");
				//������ �� ó�� 
				if(clendar.size() > (i+1)) { result.append(",");}
				
			}
			
			result.append( "]");
			//System.out.println("result.toString()"+result.toString());
			return result.toString();

			
			}
		
		
		
		
		
	

}