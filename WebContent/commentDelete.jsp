<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
					
		        int commentId = 0;
		        if(request.getParameter("commentId") != null) {
		        	commentId = Integer.parseInt(request.getParameter("commentId"));
		        }
		        
		        String bookId="";
                if(request.getParameter("bookId") != null) {
                    bookId = request.getParameter("bookId");
                }
		        
		        String contentId="";
		        if(request.getParameter("contentId") != null) {
		        	contentId = request.getParameter("contentId");
                }
		        
		        CommentDAO commentDAO = new CommentDAO();
				int result = commentDAO.deleteComment(commentId);
				
				
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('Comment 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");					
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					//script.println("history.back()");
					script.println("location.href='contentDetail.jsp?bookId="+bookId+"&contentId="+contentId+ "'");
					//script.println("location.href='bookDetail.jsp?bookId="+bookId+"'");
					script.println("</script>");
				}
			}
	
	
	%>
	
</body>
</html>