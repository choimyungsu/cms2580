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
	    <script src="js/cms.js"></script>
	    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

	<% 
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
				    
				     // 조회수 추가  2018.10.19
                    contentDAO.updateCnt(contentId);
				    
				    int base=0 ; // 지금 보고있는 기준이 되는 데이터 순서 값 
                    int pre= 0;  // 이전값
				    int next=0 ; //이후값
				    for(int i =0 ; i < list.size(); i++){
				     
				%>
                
                    <div class="row"   
	                    <% if(contentId.equals(list.get(i).getId().toString())){ 
	                    	base = i ; // 현재 보고 있는 데이터의 순서를 가져옴
	                    %> style="background-color:#E0ECF8;" 
                        <%} %> >
                        <div class="sidebar" >
                            <a href="contentDetail2.jsp?contentId=<%=list.get(i).getId() %>&bookId=<%=bookId%>"> <%=list.get(i).getTitle()  %></a>   
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
                <% if(userID.equals(book.getAuthor())){ %>
	                <a class="pull-right" href="contentDelete.jsp?contentId=<%=content.getId() %>&bookId=<%=bookId%>" ><span class="glyphicon glyphicon-remove"></span>삭제</a>
	                <a class="pull-right" href="contentUpdate.jsp?contentId=<%=content.getId() %>&bookId=<%=bookId%>" ><span class="glyphicon glyphicon-pencil"></span>편집 &nbsp;&nbsp;</a>
                <% } %>
                <div class="post">
                    <h4><%=content.getTitle() %></h4>
                    <div class="date">
                        <p><%=content.getCDate() %>   조회수 : <%=content.getCnt() %></p>
                    </div>
                    <div>
                    <% if(content.getContentsImgUrl() !=null) {%>
                        <%=content.getContentsImgUrl() %>
                    <% } %>
                    </div>
                    <div><%=content.getText() %></div>
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
 <% 
	 //이전값 , 이후값 가져오기 
     if(base-1 < 0){ pre=0; }else{pre = base-1;}
	 if(base+1 > list.size()-1) { next = list.size()-1; }else{ next = base+1 ;}
 %>
        <div style="" class="prev_next_indicator"><!-- 앞뒤 이동-->
           <a class="prev_icon" href="contentDetail.jsp?contentId=<%=list.get(pre).getId() %>&bookId=<%=bookId%>" role="button" >
              <span class="glyphicon glyphicon-chevron-left" style="font-size:2em;"></span>
           </a>  
           
               
           <a class="next_icon" href="contentDetail.jsp?contentId=<%=list.get(next).getId() %>&bookId=<%=bookId%>" role="button" >
               <span class="glyphicon glyphicon-chevron-right" style="font-size:2em;"></span>
           </a>                
        </div>
        

    </body>
</html>