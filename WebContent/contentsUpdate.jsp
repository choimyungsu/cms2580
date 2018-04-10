<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.Examcontents" %>
<%@ page import="com.exam.ExamcontentsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제 업데이트 </title>
</head>
<body>
<%
    
    String userID = null;
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
    }
    if(userID == null){
        
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    }
    
    int examContentsID = 0;
    if(request.getParameter("examContentsID") != null) {
    	examContentsID = Integer.parseInt(request.getParameter("examContentsID"));
    }
    if(request.getParameter("examContentsID") == null) {
    
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 유효하지 않은 글입니다.')");
        script.println("location.href = 'contentsView.jsp'");
        script.println("</script>");

    }
       
/*     
    System.out.println("examListID"+request.getParameter("examListID"));
    System.out.println("examDesc"+request.getParameter("examDesc"));
    System.out.println("answerDesc"+request.getParameter("answerDesc"));
    System.out.println("answer"+request.getParameter("answer"));
 */          
    if(request.getParameter("definition") == null || request.getParameter("definition").equals("") ){
                
                PrintWriter script = response.getWriter();
                script.println("<script>") ;
                script.println("alert('입력이 안된 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
    }else{
                
    	    ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
    	    
            int result = examcontentsDAO.updateExamcontents(examContentsID, request.getParameter("definition"), request.getParameter("linkurl"));
            
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('수정에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");                    
            }else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href ='contentsView.jsp?examContentsID="+examContentsID +"'");
                script.println("</script>");
        }
    }
    
    
    
%>
    
</body>
</html>