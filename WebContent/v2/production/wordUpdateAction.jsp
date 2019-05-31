<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.ExamcontentsDAO" %>  
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="Examcontents" class="com.exam.Examcontents" scope="page" />
<jsp:setProperty name="Examcontents" property="examcontentsid" />
<jsp:setProperty name="Examcontents" property="examcode" />
<jsp:setProperty name="Examcontents" property="seq" />
<jsp:setProperty name="Examcontents" property="domain" />
<jsp:setProperty name="Examcontents" property="subject" /> 
<jsp:setProperty name="Examcontents" property="linkurl" />
<jsp:setProperty name="Examcontents" property="definition" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
    <%
    
    //세션 확인
        String userID = null;
        if(session.getAttribute("userID") !=null ){
            userID = (String) session.getAttribute("userID");
        }
            if(userID ==null) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert(' 로그인을 하세요.')");
                script.println("location.href = 'login.jsp'");
                script.println("</script>");
            }else{
                
                if(Examcontents.getSubject() == null || Examcontents.getSubject() == null ) {
                    
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('입력이 안된 사항이 있습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }else{
                    
                	ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
                	//(int examContentsID, String subject, String definition, String domain, String examCode) {
                    int result = examcontentsDAO.updateExamcontents(Examcontents.getExamcontentsid(), Examcontents.getSubject(), Examcontents.getDefinition(), Examcontents.getDomain(), Examcontents.getExamcode()) ;//
                    
                    
                    //insertContent(String bookID, String title, String text, String imgurl )
                    if(result == -1){
                        PrintWriter script = response.getWriter();
                        script.println("<script>");
                        script.println("alert('Word 수정에 실패했습니다.')");
                        script.println("history.back()");
                        script.println("</script>");                    
                    }else{
                        PrintWriter script = response.getWriter();
                        script.println("<script>");
                    
                        script.println("location.href='word.jsp'");
                        script.println("</script>");
                    }
                }
            }
    
    
    %>
    
</body>
</html>