<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.ContentDAO" %>
<%@ page import="com.book.Book" %>
<%@ page import="com.book.BookDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
                    
                int contentId = 0;
                if(request.getParameter("contentId") != null) {
                    contentId = Integer.parseInt(request.getParameter("contentId"));
                }
                String bookId="";
                if(request.getParameter("bookId") != null) {
                    bookId = request.getParameter("bookId");
                }
                
                // 권한체크 시작
                Book book = new BookDAO().searchBook(bookId);
                if(!userID.equals(book.getAuthor())){
                    
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert(' 권한이 없습니다.')");
                    script.println("location.href = 'book.jsp'");
                    script.println("</script>");
                }
                
                ContentDAO contentDAO = new ContentDAO();
                int result = contentDAO.deleteContent(contentId);
                
                if(result == -1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('Content 삭제에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");                    
                }else{
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    //script.println("history.back()");
                    script.println("location.href='bookDetail.jsp?bookId="+bookId+"'");
                    script.println("</script>");
                }
            }
    
    
    %>
</head>
<body>
	
	
</body>
</html>