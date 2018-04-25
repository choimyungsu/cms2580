<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.Useranswerdesc" %>
<%@ page import="com.user.UseranswerdescDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 해설 업데이트 </title>
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
    String answerDesc = null;
    if(request.getParameter("answerDesc") != null) {
    	answerDesc = request.getParameter("answerDesc");
    }
    
    String updateYN = null;
    if(request.getParameter("updateYN") != null) {
    	updateYN = request.getParameter("updateYN");
    }    
    
   Integer Useranswerdescid=0;
   if(request.getParameter("Useranswerdescid")!=null && request.getParameter("Useranswerdescid")!="0"){
       Useranswerdescid = Integer.parseInt(request.getParameter("Useranswerdescid"));
       System.out.println("들어 왔냐    Useranswerdescid="+Useranswerdescid);
   }
       
/*     
    System.out.println("examListID"+request.getParameter("examListID"));
    System.out.println("examDesc"+request.getParameter("examDesc"));
    System.out.println("answerDesc"+request.getParameter("answerDesc"));
    System.out.println("answer"+request.getParameter("answer"));
 */  
 
 
 
    if(request.getParameter("answerDesc") == null || request.getParameter("answerDesc").equals("") ){
                
                PrintWriter script = response.getWriter();
                script.println("<script>") ;
                script.println("alert('입력이 안된 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
    }else{
                
    	    UseranswerdescDAO useranswerdescDAO = new UseranswerdescDAO();
    	    int result=0 ;
    	    if(updateYN.equals("Y")){
    	    	
    	         result = useranswerdescDAO.update(answerDesc, Useranswerdescid);
    	         System.out.println("업데이트 ");
    	    	
    	    }else{
		        
    	    	 result = useranswerdescDAO.insert(userID, examListID, answerDesc);
    	    	 System.out.println("인서트 ");
		            
    	    }
    	    
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('수정에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");                    
            }else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href ='socialAnswerList.jsp?examListID="+examListID +"'");
                script.println("</script>");
           }
    	   
    }
%>
    
</body>
</html>