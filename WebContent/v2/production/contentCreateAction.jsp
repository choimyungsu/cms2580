<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.ContentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="content" class="com.book.Content" scope="page" />
<jsp:setProperty name="content" property="title" />
<jsp:setProperty name="content" property="text" />
<jsp:setProperty name="content" property="bookId" />
<jsp:setProperty name="content" property="contentsImgUrl" /> 
<jsp:setProperty name="content" property="pid" />
<jsp:setProperty name="content" property="tdate" />

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
				
				if(content.getTitle() == null || content.getText() == null ) {
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					
					ContentDAO contentDAO = new ContentDAO();
					int result = contentDAO.insertContent(content.getBookId(),content.getTitle(),content.getText(), content.getContentsImgUrl(),content.getPid(),content.gettdate());
					
					//insertContent(String bookID, String title, String text, String imgurl )
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('Book 생성에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");					
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						if(content.getBookId() !=null && content.getBookId() !="")
						{
							script.println("location.href='bookDetail.jsp?bookId="+content.getBookId()+"'");
						}else{
							/**
							 bookID가 없는 경우는 note.jsp로 보냄 
							*/
							script.println("location.href='timeline.jsp'");
						}
						script.println("</script>");
					}
				}
			}
	
	
	%>
	
</body>
</html>