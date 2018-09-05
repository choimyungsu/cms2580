<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.Book" %>
<%@ page import="com.book.BookDAO" %>
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
	
	String userID = null;
	if(session.getAttribute("userID") !=null ){
		userID = (String) session.getAttribute("userID");
	}
	
    String bookId = "";
    if(request.getParameter("bookId") != null) {
    	bookId = request.getParameter("bookId");
    }
	
	if(userID == null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(' 로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{

	    if(bookId == "") {
	    
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert(' 유효하지 않은 책입니다.')");
	        script.println("location.href = 'book.jsp'");
	        script.println("</script>");
	
	    }else{
	    
		   Book book = new BookDAO().searchBook(bookId);
		   //System.out.println("book.getAuthor()==>"+book.getAuthor());
		    if(!userID.equals(book.getAuthor())){
		        
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert(' 권한이 없습니다.')");
		        script.println("location.href = 'book.jsp'");
		        script.println("</script>");
				
			}else{
						
				if(request.getParameter("title") == null || request.getParameter("description") == null ) {
		            
		            PrintWriter script = response.getWriter();
		            script.println("<script>");
		            script.println("alert('입력이 안된 사항이 있습니다.')");
		            script.println("history.back()");
		            script.println("</script>");
		        }else{
		            
		            BookDAO bookDAO = new BookDAO();
		            //updateBook(int Id, String Title, String imgurl, String catagory,String status,String Description)
		            int result = bookDAO.updateBook(bookId,request.getParameter("title"),request.getParameter("mainImgUrl"),"", "", request.getParameter("description"));
		            
		            if(result == -1){
		                PrintWriter script = response.getWriter();
		                script.println("<script>");
		                script.println("alert('Book 수정에 실패했습니다.')");
		                script.println("history.back()");
		                script.println("</script>");                    
		            }else{
		                PrintWriter script = response.getWriter();
		                script.println("<script>");
		                script.println("location.href ='bookDetail.jsp?bookId="+bookId +"' ");
		                script.println("</script>");
		            }
		        }
			}
	    }
	    
	}
	
	
	
%>
	
</body>
</html>