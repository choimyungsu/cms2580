<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CMS minibook</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width", initial-scale="1">
	    <link rel="stylesheet" href="css/bootstrap.css">
	    <link rel="stylesheet" href="css/custom.css">
	    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

		<% 
		String bookId = "";// 
		if(request.getParameter("bookId")!=null && request.getParameter("bookId")!=""){
			bookId = request.getParameter("bookId");
		}
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
		%>
    
 </head>
 <body>
 <jsp:include page="header.jsp" flush="true" />  
        
<div class="container">
    <div class="row" style="margin-top:0;">
        <div class="col-sm-3" style="margin-top:0;overflow-y:auto; border-right:1px solid #BDBDBD">
            <h3 style="text-align:left; margin-top:0;display: inline-block;">
                <a href="/book/1/">Contents</a>
            </h3>
            <a class="js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>                 
            <div class="row">
                <div style="padding-left:20px;padding-right:20px; "> 
                
				 <%
				    BookDAO bookDAO = new BookDAO();
				    Book book = bookDAO.searchBook(bookId);//""
				 
				    ContentDAO contentDAO = new ContentDAO();
				    Util util = new Util();
				    ArrayList<Content> list = contentDAO.searchContents(bookId,"");//""
				    for(int i =0 ; i < list.size(); i++){
				%>
                
                    <div class="row">
                        <div class="sidebar" >
                            <a href="contentDetail.jsp?contentId=<%=list.get(i).getId() %>&bookId=<%=bookId%>"> <%=list.get(i).getTitle()  %> (<%=list.get(i).getCnt() %>)</a>   
                        </div>
                    </div>
                    
                  <%
                      } 
                  %>
                  
                </div>
            </div>
            <% if(userID.equals(book.getAuthor())){ %>
            <h3 style="text-align: center;margin-top:0;"><a class="btn btn-default " href="contentCreate.jsp?bookId=<%=bookId %>" >Add Contents</a></h3>
            <% } %>
        </div>
            <div class="page  col-sm-9 " style="border-left:1px solid #BDBDBD; margin-left:-1px" id="load_content" >
            
                <a class="pull-left js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>
                <div class="post">
                    <h4><%=book.getTitle() %></h4>
                    
                    <div class="date">
                        <p><%=book.getCdate() %></p>
                    </div>
                    <% if(book.getMainImgUrl() !=null) {%>
                        <%=book.getMainImgUrl() %>
                    <% } %>
                    <% if(userID.equals(book.getAuthor())){ %>
                        <a href="bookUpdate.jsp?bookId=<%=bookId%>"><span class="glyphicon glyphicon-pencil"></span>편집</a>&nbsp;&nbsp;
                        <a href="bookDelete.jsp"><span class="glyphicon glyphicon-remove"></span>삭제</a> <-- 주의: Contents도 모두 삭제됩니다!!
                    <% } %>
                </div>
            </div>
        </div>
    </div>
 

    </body>
</html>