<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.book.Book" %>
<%@ page import="com.book.BookDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title> </title>
<% 
    String userID = null;
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
        
    }
    
    if(userID == null){
        System.out.println("userID==>"+userID);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
        
    }
    
    String bookId="";
    if(request.getParameter("bookId") != null) {
        bookId = request.getParameter("bookId");
    }
    if(request.getParameter("bookId") == null) {
    
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 유효하지 않은 책입니다.')");
        script.println("location.href = 'book.jsp'");
        script.println("</script>");

    }
    
    Book book = new BookDAO().searchBook(bookId);
    if(!userID.equals(book.getAuthor())){
        
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 권한이 없습니다.')");
        script.println("location.href = 'book.jsp'");
        script.println("</script>");
    }

%>
</head>
<body>

<jsp:include page="header.jsp" flush="true" />




	<div class="container">
    <h1>Book</h1>
    <form method="POST" class="post-form" action="bookUpdateAction.jsp"><input type='hidden' />
        <p><label for="id_title">Title:</label> <input type="text" name="title" class="form-control" width="50" placeholder="목차 제목을 입력해주세요." maxlength="200" required value="<%=book.getTitle() %>" /></p>
		<p><label for="id_url">Url:</label> <textarea class="form-control" placeholder="대표 이미지 URL을 입력해주세요." name="mainImgUrl" maxlength="2048" style="height: 60px;" ><%=book.getMainImgUrl()%></textarea></p>
		<p><label for="id_text">Description:</label> <textarea name="description" cols="40" rows="15" class="form-control" required id="id_text"><%=book.getDescription() %></textarea></p>
		<!-- <p><label for="id_photo">Photo:</label> <input type="file" name="photo" id="id_photo" /></p> -->
		<input type="hidden" name="bookId" value="<%=bookId %>" /></p>
		
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
    
</div>   

	
</body>
</html>