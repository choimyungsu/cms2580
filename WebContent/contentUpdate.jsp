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
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
	    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

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
	
	String contentId= "";//
	if(request.getParameter("contentId")!=null && request.getParameter("contentId")!=""){
		contentId = request.getParameter("contentId");
	}
 
    String userID = null;
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
        
    }
    
    if(userID == null){
        //System.out.println("userID==>"+userID);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
        
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
    <div class="row" style="margin-top:0;">
        <div class="col-sm-3" style="margin-top:0;overflow-y:auto; border-right:1px solid #BDBDBD">
            <h3 style="text-align:left; margin-top:0;display: inline-block;">
                <a href="/book/1/">Contents</a>
            </h3>
            <a class="js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>                 
            <div class="row">
                <div style="padding-left:20px;padding-right:20px; "> 
                
				 <%
				    ContentDAO contentDAO = new ContentDAO();
				    Util util = new Util();
				    ArrayList<Content> list = contentDAO.searchContents(bookId,contentId);//""
				    Content content = contentDAO.searchContent(contentId);//한건 찾기 
				    for(int i =0 ; i < list.size(); i++){
				%>
                
                    <div class="row">
                        <div class="sidebar" >
                            <a href="contentDetail.jsp?contentId=<%=list.get(i).getId() %>&bookId=<%=bookId%>"> <%=list.get(i).getTitle()  %></a>   
                        </div>
                    </div>
                    
                  <%
                      } 
                  %>
                    
                </div>
            </div>
            <h3 style="text-align: center;margin-top:0;"><a class="btn btn-default " href="contentCreate.jsp?bookId=<%=bookId %>" >Add Contents</a></h3>
        </div>
            <div class="page  col-sm-9 " style="border-left:1px solid #BDBDBD; margin-left:-1px" id="load_content" >
                <a class="pull-left js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>
                <form method="POST" class="post-form" action="contentUpdateAction.jsp">
			        <p><label for="id_title">Title:</label> <input type="text" name="title" class="form-control" width="50" placeholder="목차 제목을 입력해주세요." maxlength="200" required id="id_title" value="<%=content.getTitle() %>" /></p>
			        <p><label for="id_url">Url:</label> <textarea class="form-control" placeholder="대표 이미지 URL을 입력해주세요." name="contentsImgUrl" maxlength="2048" style="height: 60px;" ><%=content.getContentsImgUrl()%></textarea></p>
			        <p><label for="id_text">Description:</label> <textarea id="summernote" name="text"  class="form-control" required id="id_text"><%=content.getText() %></textarea></p>
			        <input type='hidden' name="bookId"  value="<%=bookId%>"/>
			        <input type='hidden' name="id"  value="<%=content.getId()%>"/>
			        <button type="submit" class="save btn btn-default">Save</button>
			    </form>
            </div>
        </div>
    </div>
        
	    <script>
	    $(document).ready(function() {
	        $('#summernote').summernote({height: 300});
	        
	    });
	  </script>
          

    </body>
</html>