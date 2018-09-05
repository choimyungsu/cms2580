<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.BookDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="book" class="com.book.Book" scope="page" />
<jsp:setProperty name="book" property="title" />
<jsp:setProperty name="book" property="description" />
<jsp:setProperty name="book" property="mainImgUrl" />
<jsp:setProperty name="book" property="catagory" />
<jsp:setProperty name="book" property="pdate" />

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
				
				if(book.getTitle() == null || book.getDescription() == null ) {
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					
					BookDAO bookDAO = new BookDAO();
					int result = bookDAO.insertBook(book.getTitle(),userID,book.getMainImgUrl(),book.getCatagory(), book.getStatus(),book.getPdate(), book.getDescription());
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('Book 생성에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");					
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href ='book.jsp' ");
						script.println("</script>");
					}
				}
			}
	
	
	%>
	
</body>
</html>