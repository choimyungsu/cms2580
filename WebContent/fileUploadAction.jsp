<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.user.User" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="com.file.LinkfileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.InitialContext, javax.naming.Context, java.util.List" %>
<%@ page import="com.excel.ContentslistExcelReader,com.exam.Examcontents,com.exam.ExamcontentsDAO" %>
<%@ page import="com.excel.ExamlistExcelReader,com.exam.Examlist,com.exam.ExamlistDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		//String directory = "C:\\JSP\\projects\\basic\\WebContent\\excel\\"; // 로컬용
        String directory = "/home/hosting_users/cms2580/www/excel/";// 운영서버 용
	
			int maxSize = 1024*1024*100;
			String encoding ="UTF-8";
			
			MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,new DefaultFileRenamePolicy());
			
		//파일 처리 시작
			
		//MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,
				//new DefaultFileRenamePolicy());

		Enumeration fileNames = multipartRequest.getFileNames();
		String path="";
		String type= multipartRequest.getParameter("type");
		
		if(!fileNames.hasMoreElements() || type==null ){
		     PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert(' 파일이 없거나 타입을 선택하지 않았습니다. ')");
		        script.println("location.href = 'fileUpload.jsp'");
		        script.println("</script>");
		}

		while(fileNames.hasMoreElements()){
			
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			String filePath = directory;

			if(fileName == null) continue;//중간에 문서를 올리지 않은 항목에 대한 처리 
			
			if(!fileName.endsWith(".xlsx"))
			{ // 시큐어 코딩 적용( 업로드 확장자 지정)
				File file = new File(directory+fileRealName);
				file.delete();
				out.write("올릴수 없는 파일입니다.");
				
			} else {

				out.write("fileName="+ fileName +", fileRealName="+fileRealName);
				path = directory+fileRealName;
				
			}
			
			
		}
		
		//파일 처리 end 
		
	
	if(type.equals("C")){ // 컨텐츠 유형
		// 엑셀 처리 
		ContentslistExcelReader excelReader = new ContentslistExcelReader();
	    List<Examcontents> xlsxList;
	    
	    xlsxList = excelReader.xlsxToDBcontentsList(path);
	    //xlsxList = excelReader.xlsxToDBgisulsaExamList("/home/hosting_users/cms2580/www/excel/9seoul1806.xlsx");// 
	    ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
	    
	    for(int i =0 ; i < xlsxList.size(); i++){
	        	examcontentsDAO.insertContents( xlsxList.get(i).getExamcode(), xlsxList.get(i).getSeq() , xlsxList.get(i).getDomain(),  xlsxList.get(i).getSubject(),  xlsxList.get(i).getDefinition());
	    }
	}else if(type.equals("B")){ // 기술사 유형일때 
		
		ExamlistExcelReader excelReader = new ExamlistExcelReader();
	    List<Examlist> xlsxList;
	    xlsxList = excelReader.xlsxToDBgisulsaExamList(path);// 
	    ExamlistDAO examlistDAO = new ExamlistDAO();
	    
	    for(int i =0 ; i < xlsxList.size(); i++){
	         
	       examlistDAO.insertGisulsa( xlsxList.get(i).getExamcode(), xlsxList.get(i).getTurn() , xlsxList.get(i).getDomain(),  xlsxList.get(i).getPeriod(),  xlsxList.get(i).getExamdesc(), xlsxList.get(i).getAnswerdesc()  );
	    }
		
		
	}else if(type.equals("A")){ // 기사유형 일때 
		
	    ExamlistExcelReader excelReader = new ExamlistExcelReader();
        List<Examlist> xlsxList;
        System.out.println("path="+path);
        xlsxList = excelReader.xlsxToDBgisaExamList(path);//
        ExamlistDAO examlistDAO = new ExamlistDAO();
        
        for(int i =0 ; i < xlsxList.size(); i++){
            examlistDAO.insertGisa( xlsxList.get(i).getExamcode(), xlsxList.get(i).getTurn(), xlsxList.get(i).getDomain(), xlsxList.get(i).getExamnum(), xlsxList.get(i).getExamdesc(), xlsxList.get(i).getAnswer(), xlsxList.get(i).getAnswerdesc()) ;
        }
		
	}else{
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert(' type 설정 오류 ')");
	    script.println("location.href = 'main.jsp'");
	    script.println("</script>");
	}
		
		
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='main.jsp' ");
		script.println("</script>");
		
	%>
	
</body>
</html>
