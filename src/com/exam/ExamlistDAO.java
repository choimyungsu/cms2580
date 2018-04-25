package com.exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ExamlistDAO {
	
	DataSource ds;
	public ExamlistDAO() {//생성자 에서 선언
		try {
			InitialContext initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/cms2580");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//기술사문제 insert(엑셀) 
	public int insertGisulsa(String examCode, String turn, String domain,String period, String examDesc) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO examList(examCode,turn,domain,period,examDesc)  VALUES (? ,?, ?, ?, ? )";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, examCode);
			pstmt.setString(2, turn);
			pstmt.setString(3, domain);
			pstmt.setString(4, period);
			pstmt.setString(5, examDesc);
			
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
	
	//기사시험 insert(엑셀)
	public int insertGisa(String examCode, String turn, String domain, String examNum,String examDesc, String answer, String answerDesc) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO examList(examCode, turn,domain,examNum,examDesc,answer,answerDesc)  VALUES (?, ? ,?, ?, ?, ?,? )";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, examCode);
			pstmt.setString(2, turn);
			pstmt.setString(3, domain);
			pstmt.setString(4, examNum);
			pstmt.setString(5, examDesc);
			pstmt.setString(6, answer);
			pstmt.setString(7, answerDesc);
			
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
	public ArrayList<Examlist> searchExamList(String examcode,String turn){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		if(examcode.equals("A001")  || examcode.equals("A002")) { turn = turn+".0";}
		//String SQL = "SELECT * FROM examList WHERE examCode = ? and turn = ? ";
		String SQL = " select examListID, " +
			     "  examCode, " +
			     "  domain, " +
			     "  year, " +
			     "  round(turn), " +
			     "  round(period), " +
			     "  examNum, " +
			     "  examDesc, " +
			     "  examBogi, " +
			     "  ifnull(answer1,''), " +
			     "  ifnull(answer2,''), " +
			     "  ifnull(answer3,''), " +
			     "  ifnull(answer4,''), " +
			     "  ifnull(answer5,''), " +
			     "  ifnull(answerDesc,''), " +
		  	     "  answer, " +
		  	     "  ifnull(examImg,''), " +
		  	     "  ifnull(answerImg,''), " +
		  	     "  ifnull(syntaxDesc,'') " +
			     " from examList a" +
			     " WHERE examCode = ? and turn = ?  " +
			     " order by round(examNum) ";
		
		 ArrayList<Examlist> list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, examcode);
			pstmt.setString(2, turn);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Examlist examlist = new Examlist();	
				
		        examlist.setExamlistid(rs.getInt(1));
		        examlist.setExamcode(rs.getString(2));
		        examlist.setDomain(rs.getString(3));
		        examlist.setYear(rs.getString(4));
		        examlist.setTurn(rs.getString(5));
		        examlist.setPeriod(rs.getString(6));
		        examlist.setExamnum(rs.getString(7));
		        examlist.setExamdesc(rs.getString(8));
		        examlist.setExambogi(rs.getString(9));
		        examlist.setAnswer1(rs.getString(10));
		        examlist.setAnswer2(rs.getString(11));
		        examlist.setAnswer3(rs.getString(12));
		        examlist.setAnswer4(rs.getString(13));
		        examlist.setAnswer5(rs.getString(14));
		        examlist.setAnswerdesc(rs.getString(15));
		        examlist.setAnswer(rs.getString(16));
		        examlist.setExamImg(rs.getString(17));
		        examlist.setAnswerImg(rs.getString(18));
		        examlist.setSyntexDesc(rs.getString(19));
		        
		        list.add(examlist);
				
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
	
	//문제 한건 가져오기
		public Examlist searchExamList(String examcode,String turn, String examnum){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			if(examcode.equals("A001")  || examcode.equals("A002")) { turn = turn+".0";}
			String SQL = " select examListID, " +
				     "  examCode, " +
				     "  ifnull(domain,''), " +
				     "  year, " +
				     "  round(turn), " +
				     "  round(period), " +
				     "  examNum, " +
				     "  examDesc, " +
				     "  examBogi, " +
				     "  ifnull(answer1,''), " +
				     "  ifnull(answer2,''), " +
				     "  ifnull(answer3,''), " +
				     "  ifnull(answer4,''), " +
				     "  ifnull(answer5,''), " +
				     "  ifnull(answerDesc,''), " +
			  	     "  answer, " +
			  	     "  ifnull(examImg,''), " +
			  	     "  ifnull(answerImg,''), " +
			  	     "  ifnull(syntaxDesc,'') " +
				     " from examList a" +
				     " WHERE examCode = ? and turn = ?  " +
				     " and examNum = round(?)  " ;
			
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, examcode);
				pstmt.setString(2, turn);
				pstmt.setString(3, examnum);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					Examlist examlist = new Examlist();
					
			        examlist.setExamlistid(rs.getInt(1));
			        examlist.setExamcode(rs.getString(2));
			        examlist.setDomain(rs.getString(3));
			        examlist.setYear(rs.getString(4));
			        examlist.setTurn(rs.getString(5));
			        examlist.setPeriod(rs.getString(6));
			        examlist.setExamnum(rs.getString(7));
			        examlist.setExamdesc(rs.getString(8));
			        examlist.setExambogi(rs.getString(9));
			        examlist.setAnswer1(rs.getString(10));
			        examlist.setAnswer2(rs.getString(11));
			        examlist.setAnswer3(rs.getString(12));
			        examlist.setAnswer4(rs.getString(13));
			        examlist.setAnswer5(rs.getString(14));
			        examlist.setAnswerdesc(rs.getString(15));
			        examlist.setAnswer(rs.getString(16));
			        examlist.setExamImg(rs.getString(17));
			        examlist.setAnswerImg(rs.getString(18));
			        examlist.setSyntexDesc(rs.getString(19));
			        
			        return examlist;
					
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
		
	
	
	
	
	//한건 가져오기
		public Examlist searchExamListId(String examListID){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select examListID, " +
					     "  examCode, " +
					     "  domain, " +
					     "  year, " +
					     "  round(turn), " +
					     "  round(period), " +
					     "  examNum, " +
					     "  examDesc, " +
					     "  examBogi, " +
					     "  ifnull(answer1,''), " +
					     "  ifnull(answer2,''), " +
					     "  ifnull(answer3,''), " +
					     "  ifnull(answer4,''), " +
					     "  ifnull(answer5,''), " +
					     "  ifnull(answerDesc,''), " +
				  	     "  answer, " +
				  	     "  ifnull(examImg,''), " +
				  	     "  ifnull(answerImg,''), " +
				  	     "  ifnull(syntaxDesc,'') " +
					     " from examList a" + 
					     " WHERE examListID = ? ";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, examListID);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Examlist examlist = new Examlist();	
					
			        examlist.setExamlistid(rs.getInt(1));
			        examlist.setExamcode(rs.getString(2));
			        examlist.setDomain(rs.getString(3));
			        examlist.setYear(rs.getString(4));
			        examlist.setTurn(rs.getString(5));
			        examlist.setPeriod(rs.getString(6));
			        examlist.setExamnum(rs.getString(7));
			        examlist.setExamdesc(rs.getString(8));
			        examlist.setExambogi(rs.getString(9));
			        examlist.setAnswer1(rs.getString(10));
			        examlist.setAnswer2(rs.getString(11));
			        examlist.setAnswer3(rs.getString(12));
			        examlist.setAnswer4(rs.getString(13));
			        examlist.setAnswer5(rs.getString(14));
			        examlist.setAnswerdesc(rs.getString(15));
			        examlist.setAnswer(rs.getString(16));
			        examlist.setExamImg(rs.getString(17));
			        examlist.setAnswerImg(rs.getString(18));
			        examlist.setSyntexDesc(rs.getString(19));
			        return examlist;
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
	public int update(int examListID, String examDesc, String answerDesc, String answer) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "UPDATE examList SET examDesc = ? , answerDesc = ?, answer =?  WHERE examListID = ?";
				
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, examDesc);
			pstmt.setString(2, answerDesc);
			pstmt.setString(3, answer);
			pstmt.setInt(4, examListID);
			
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
		
	//한건 수정하기
		public int update(Examlist examlist) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "UPDATE examList SET " +
					     " examDesc = ? , " +
					     " answerDesc = ?, " +
					     " answer1 =?,  " +
					     " answer2 =?,  " +
					     " answer3 =?,  " +
					     " answer4 =?,  " +
					     " answer5 =?,  " +
					     " answer =?,  " +
					     " examImg =?,  " +
					     " answerImg =?,  " +
					     " examBogi =?,  " +
					     " syntaxDesc =?  " +
					     " WHERE examListID = ?";
					
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, examlist.getExamdesc());
				pstmt.setString(2, examlist.getAnswerdesc());
				pstmt.setString(3, examlist.getAnswer1());
				pstmt.setString(4, examlist.getAnswer2());
				pstmt.setString(5, examlist.getAnswer3());
				pstmt.setString(6, examlist.getAnswer4());
				pstmt.setString(7, examlist.getAnswer5());
				pstmt.setString(8, examlist.getAnswer());
				pstmt.setString(9, examlist.getExamImg());
				pstmt.setString(10, examlist.getAnswerImg());
				pstmt.setString(11, examlist.getExambogi());
				pstmt.setString(12, examlist.getSyntexDesc());
				
				pstmt.setInt(13, examlist.getExamlistid());
				
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
	
	//한건 등록하기
	
	
	
	// 랜덤 기술사 문제
	public ArrayList<Examlist> randomExamMaster(String period){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL ="";
		
		if(period.equals("1")) {
				SQL = " select examListID, " +
					  "  examCode, " +
					  "  domain, " +
					  "  year, " +
					  "  round(turn), " +
					  "  round(period), " +
					  "  examNum, " +
					  "  examDesc, " +
					  "  examBogi, " +
					  "  answer1, " +
					  "  answer2, " +
					  "  answer3, " +
					  "  answer4, " +
					  "  answer5, " +
					  "  answerDesc, " +
					  "  answer " +
					  " from examList a" + 
		 			  " where a.examCode in('A001','A002') " + 
		 		      " and a.period in('1','1.0')" + 
		 		      " order by rand() limit 13;" ;
		}else {
				SQL = " select examListID, " +
					  "  examCode, " +
					  "  domain, " +
					  "  year, " +
					  "  round(turn), " +
					  "  round(period), " +
					  "  examNum, " +
					  "  examDesc, " +
					  "  examBogi, " +
					  "  answer1, " +
					  "  answer2, " +
					  "  answer3, " +
					  "  answer4, " +
					  "  answer5, " +
					  "  answerDesc, " +
					  "  answer " +		
					  " from examList a" + 
		 			  " where a.examCode in('A001','A002') " + 
		 		      " and a.period in('2','2.0','3','3.0','4','4.0')" + 
		 		      " order by rand() limit 6;" ;
		}
		 
		 ArrayList<Examlist> list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Examlist examlist = new Examlist();	
				
		        examlist.setExamlistid(rs.getInt(1));
		        examlist.setExamcode(rs.getString(2));
		        examlist.setDomain(rs.getString(3));
		        examlist.setYear(rs.getString(4));
		        examlist.setTurn(rs.getString(5));
		        examlist.setPeriod(rs.getString(6));
		        examlist.setExamnum(rs.getString(7));
		        examlist.setExamdesc(rs.getString(8));
		        examlist.setExambogi(rs.getString(9));
		        examlist.setAnswer1(rs.getString(10));
		        examlist.setAnswer2(rs.getString(11));
		        examlist.setAnswer3(rs.getString(12));
		        examlist.setAnswer4(rs.getString(13));
		        examlist.setAnswer5(rs.getString(14));
		        examlist.setAnswerdesc(rs.getString(15));
		        examlist.setAnswer(rs.getString(16));
		        
		        list.add(examlist);
				
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
	
	
	// 문제 회차
		public ArrayList<Examlist> search(String examcode){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL  = " select round(turn) from examList  " + 
						  " where examCode = ? " + 
						  " group by round(turn) " + 
						  " order by round(turn) desc";

			 
			 ArrayList<Examlist> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1, examcode);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Examlist examlist = new Examlist();	
			        examlist.setTurn(rs.getString(1));
			        list.add(examlist);
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

		
		
		//문제 여러건 가져오기
		public ArrayList<Examlist> likeSearchExamList(String search){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select a.examListID , b.examname,round(a.turn),a.examDesc" + 
						 " from examList a left outer join examMaster b " + 
						 " on a.examcode = b.examcode " + 
						 " where a.examDesc like ? " ;
			
			 ArrayList<Examlist> list = new ArrayList();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, "%"+search+"%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Examlist examlist = new Examlist();	
					
			        examlist.setExamlistid(rs.getInt(1));
			        examlist.setExamcode(rs.getString(2));
			        examlist.setTurn(rs.getString(3));
			        examlist.setExamdesc(rs.getString(4));
			        
			        list.add(examlist);
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
		
		// 
		public ArrayList<Examgroupcount> getExamGroupList(){
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			String SQL = " select a.examCode,b.examName, count(a.examListID) from examList a ,examMaster b" + 
						 " where a.examCode = b.examCode " + 
						 " group by a.examCode";
					
			ArrayList<Examgroupcount> list = new ArrayList<Examgroupcount>();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(SQL);
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Examgroupcount  examgroupcount = new Examgroupcount();
					examgroupcount.setExamgroup(rs.getString(2));
					examgroupcount.setCount(rs.getString(3));

					list.add(examgroupcount);
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


	//바 차트 유형 
	public String getExamGroupListJSON() {
		StringBuffer result = new StringBuffer("");
		ArrayList<Examgroupcount> examgroupcount = this.getExamGroupList();
		for(int i=0; i<examgroupcount.size(); i++) {
			result.append("[\"" +examgroupcount.get(i).getExamgroup() + "\",");
			result.append( examgroupcount.get(i).getCount() + ",\"white blue\"]");
			//마지막 줄 처리 
			if(examgroupcount.size() > (i+1)) { result.append(",");}
			
		}

		return result.toString();
		
	}
	
	//도넛 차트 유형 
	public String getExamGroupListJSON2() {
		StringBuffer result = new StringBuffer("");
		ArrayList<Examgroupcount> examgroupcount = this.getExamGroupList();
		for(int i=0; i<examgroupcount.size(); i++) {
			result.append("[\"" +examgroupcount.get(i).getExamgroup() + "\",");
			result.append( examgroupcount.get(i).getCount() + "]");
			//마지막 줄 처리 
			if(examgroupcount.size() > (i+1)) { result.append(",");}
			
		}

		return result.toString();
		
	}	
		
		
		
		
	
}
