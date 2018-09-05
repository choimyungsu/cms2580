<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="comment" class="com.book.Comment" scope="page" />

<jsp:setProperty name="comment" property="author" />
<jsp:setProperty name="comment" property="comment" />
<jsp:setProperty name="comment" property="contentId" />
<jsp:setProperty name="comment" property="bookId" /> 

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
				
				if(comment.getAuthor() == null || comment.getComment() == null ) {
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					
					CommentDAO commentDAO = new CommentDAO();
					int result = commentDAO.insertComment(comment.getContentId(),comment.getAuthor(),comment.getComment());
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('Book 생성에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");					
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='contentDetail.jsp?bookId="+comment.getBookId()+"&contentId="+comment.getContentId()+ "'");
						script.println("</script>");
					}
				}
			}
	
	
	%>
	
</body>
</html>