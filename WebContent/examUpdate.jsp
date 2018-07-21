<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.Examlist" %>
<%@ page import="com.exam.ExamlistDAO" %>
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
    
    int examListID = 0;
    if(request.getParameter("examListID") != null) {
    	examListID = Integer.parseInt(request.getParameter("examListID"));
    }
    if(request.getParameter("examListID") == null) {
    
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 유효하지 않은 글입니다.')");
        script.println("location.href = 'examView.jsp'");
        script.println("</script>");

    }
       
/*     
    System.out.println("examListID"+request.getParameter("examListID"));
    System.out.println("examDesc"+request.getParameter("examDesc"));
    System.out.println("answerDesc"+request.getParameter("answerDesc"));
    System.out.println("answer"+request.getParameter("answer"));
 */  
 
 Examlist examlist = new Examlist();
 
 examlist.setExamlistid(examListID);
 
 if(request.getParameter("answer1") != null && request.getParameter("answer1") !="" ){
	 examlist.setAnswer1(request.getParameter("answer1"));
 }
 if(request.getParameter("answer2") != null && request.getParameter("answer2") !="" ){
     examlist.setAnswer2(request.getParameter("answer2"));
}
 if(request.getParameter("answer3") != null && request.getParameter("answer3") !="" ){
     examlist.setAnswer3(request.getParameter("answer3"));
}
 if(request.getParameter("answer4") != null && request.getParameter("answer4") !="" ){
     examlist.setAnswer4(request.getParameter("answer4"));
}
 if(request.getParameter("answer5") != null && request.getParameter("answer5") !="" ){
     examlist.setAnswer5(request.getParameter("answer5"));
} 
 if(request.getParameter("answer") != null && request.getParameter("answer") !="" ){
     examlist.setAnswer(request.getParameter("answer"));
}
 if(request.getParameter("answerDesc") != null && request.getParameter("answerDesc") !="" ){
     examlist.setAnswerdesc(request.getParameter("answerDesc"));
}
 if(request.getParameter("examDesc") != null && request.getParameter("examDesc") !="" ){
     examlist.setExamdesc(request.getParameter("examDesc"));
}
 if(request.getParameter("examImg") != null && request.getParameter("examImg") !="" ){
     examlist.setExamImg(request.getParameter("examImg"));
}
 if(request.getParameter("answerImg") != null && request.getParameter("answerImg") !="" ){
     examlist.setAnswerImg(request.getParameter("answerImg"));
} 

 if(request.getParameter("examBogi") != null && request.getParameter("examBogi") !="" ){
     examlist.setExambogi(request.getParameter("examBogi"));
}
 
//소스보기
if(request.getParameter("syntaxDesc") != null && request.getParameter("syntaxDesc") !="" ){
     examlist.setSyntexDesc(request.getParameter("syntaxDesc"));
}

//관련 URL
if(request.getParameter("url") != null && request.getParameter("url") !="" ){
   examlist.setUrl(request.getParameter("url"));
}

 
 
    if(request.getParameter("examDesc") == null || request.getParameter("examDesc").equals("") ){
                
                PrintWriter script = response.getWriter();
                script.println("<script>") ;
                script.println("alert('입력이 안된 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
    }else{
                
            ExamlistDAO examlistDAO = new ExamlistDAO();
            //int result = examlistDAO.update(examListID, request.getParameter("examDesc"),request.getParameter("answerDesc"),request.getParameter("answer") );
            int result = examlistDAO.update(examlist);
            
            
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('수정에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");                    
            }else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href ='examView.jsp?examListID="+examListID +"'");
                script.println("</script>");
        }
    }
    
    
    
%>
    
</body>
</html>