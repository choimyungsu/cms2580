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
		//String directory = "C:\\JSP\\projects\\basic\\WebContent\\userImages\\";
        String directory = "/home/hosting_users/cms2580/www/userImages/";
	
			int maxSize = 1024*1024*100;
			String encoding ="UTF-8";
			
			MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,new DefaultFileRenamePolicy());
			
			//System.out.println("UserID ="+ multipartRequest.getParameter("userID"));
			
			//if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
			if(multipartRequest.getParameter("userID") == null || multipartRequest.getParameter("userPassword") == null || multipartRequest.getParameter("userName")==null  || multipartRequest.getParameter("userEmail") == null) {	
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				User user = new User();
				user.setUserid(multipartRequest.getParameter("userID"));
				user.setPassword(multipartRequest.getParameter("userPassword"));
				user.setUsername(multipartRequest.getParameter("userName"));
				user.setEmail(multipartRequest.getParameter("userEmail"));
		
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
		
		//사진 처리 시작
			
		//MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,
				//new DefaultFileRenamePolicy());

		Enumeration fileNames = multipartRequest.getFileNames();

		while(fileNames.hasMoreElements()){
			
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			String filePath = directory;
			String objectLink = "user"; //파일 연결 객체
			String objectLinkPK = user.getUserid();// 파일연결객체 PK

			if(fileName == null) continue;//중간에 문서를 올리지 않은 항목에 대한 처리 
			
			if(!fileName.endsWith(".doc") && !fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") && !fileName.endsWith(".xls")  && !fileName.endsWith(".ppt") && !fileName.endsWith(".jpg"))
			{ // 시큐어 코딩 적용( 업로드 확장자 지정)
				File file = new File(directory+fileRealName);
				file.delete();
				out.write("올릴수 없는 파일입니다.");
				
			} else {

				new LinkfileDAO().upload(fileName, fileRealName, filePath, objectLink, objectLinkPK);
				out.write("fileNAme="+ fileName +", fileRealName="+fileRealName);
				
			}
			
			
		}
		
		//사진 처리 end 
		
		session.setAttribute("userID", user.getUserid());//세션 부여
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='index.jsp' ");
		script.println("</script>");
			} 
		
			}
	%>
	
</body>
</html>