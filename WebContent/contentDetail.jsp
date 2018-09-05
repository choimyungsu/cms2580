<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %> 
<%@ page import="com.book.CommentDAO" %>  
<%@ page import="com.book.Comment" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
    
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
	    <script src="js/cms.js"></script>
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
	%>
	<script>
	function showComment(){//comment 보이도록
	    var x = document.getElementById("commentBlock");
	    if (x.style.display === "none") {
	        x.style.display = "block";
	    } else {
	        x.style.display = "none";
	    }
	}
	</script>
        
    </head>
    <body>
    <jsp:include page="header.jsp" flush="true" />  
        

        
<div class="container">
    <div class="content row" style="margin-top:0;">
        <div class="col-sm-3" id="leftmenuinner" style="overflow-y:auto; border-right:1px solid #BDBDBD">
            <h3 style="text-align:left; margin-top:0;display: inline-block;">
                <a href="bookDetail.jsp?bookId=<%=bookId%>">Contents</a>
            </h3>
            <a class="js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>                 
            <div class="row">
                <div style="padding-left:20px;padding-right:20px; "> 
                
				 <%
				    BookDAO bookDAO = new BookDAO();
				    Book book = bookDAO.searchBook(bookId);//""
				 
				    ContentDAO contentDAO = new ContentDAO();
				    Util util = new Util();
				    ArrayList<Content> list = contentDAO.searchContents(bookId);//""
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
                <a class="pull-right" href="contentDelete.jsp?contentId=<%=content.getId() %>&bookId=<%=bookId%>" ><span class="glyphicon glyphicon-remove"></span>삭제</a>
                <a class="pull-right" href="contentUpdate.jsp?contentId=<%=content.getId() %>&bookId=<%=bookId%>" ><span class="glyphicon glyphicon-pencil"></span>편집 &nbsp;&nbsp;</a>
                <div class="post">
                    <h4><%=content.getTitle() %></h4>
                    
                    <div class="date">
                        <p><%=content.getCDate() %></p>
                    </div>
                    <div>
                    <% if(content.getContentsImgUrl() !=null) {%>
                        <%=content.getContentsImgUrl() %>
                    <% } %>
                    </div>
                    <p><label for="id_text">Description:</label> 
                        <div><%=content.getText() %></div></p>
                    
                </div>
                <a class="btn btn-default" onclick="showComment()" >Add comment</a>
                <div id="commentBlock" style="display: none;">
                <form method="POST" class="post-form" action="commentCreateAction.jsp">
                    <p><label for="id_author">Author:</label> <input type="text" name="author" maxlength="200" required id="id_author" /></p>
                    <p><label for="id_text">Comment:</label> <textarea name="comment" cols="40" rows="2" class="form-control" placeholder="댓글을 입력해주세요." required id="id_text"></textarea></p>
                    <input type='hidden' name="contentId"  value="<%=content.getId()%>"/>
                    <input type='hidden' name="bookId"  value="<%=content.getBookId()%>"/>
                    <button type="submit" class="save btn btn-default">Send</button>
                </form>
            </div>
                <hr>
                <%
                    // comment 가져오기 
                    CommentDAO commentDAO = new CommentDAO();
                    ArrayList<Comment> list2 = commentDAO.searchComments(content.getId().toString());
                    for(int i =0 ; i < list2.size(); i++){
                %>
                    <h5><%=list2.get(i).getComment() %> by <%=list2.get(i).getAuthor() %> at <%=list2.get(i).getcDate() %>         
                       <!--  <a href="">승인</a> -->
                        <a href="commentDelete.jsp?commentId=<%=list2.get(i).getId()%>&contentId=<%=content.getId() %>&bookId=<%=bookId%>">삭제</a>
                    </h5> 
                
                <%
                    }
                %>
            </div>
            
            
            
        </div>
    </div>
 
        <div style="" class="prev_next_indicator"><!-- 앞뒤 이동-->
           <a class="prev_icon" href="" role="button" >
              <span class="glyphicon glyphicon-chevron-left" style="font-size:2em;"></span>
           </a>       
           <a class="next_icon" href="" role="button" >
               <span class="glyphicon glyphicon-chevron-right" style="font-size:2em;"></span>
           </a>                
        </div>

        <div id="footer">
            <p>Copyright © CMS 2018   &nbsp;  cms2580@naver.com </p>
        </div>
        

    </body>
</html>