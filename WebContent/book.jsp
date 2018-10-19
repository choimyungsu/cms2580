<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
    <title>cms</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body> 
  <jsp:include page="header.jsp" flush="true" />   
    
    <div class="gallery">
        <div class="text-center">
            <h2>BooK</h2>
        </div>
        <div class="container"> 
        
 <%
    BookDAO bookDAO = new BookDAO();
    Util util = new Util();
    ArrayList<Book> list = bookDAO.searchBookList("");//""
    for(int i =0 ; i < list.size(); i++){
%>          
            <!-- 반복 시작 -->   
            <div class="col-md-3">
	            <div style="width: 250px; height: 325px; " >
	               <div style="width: 250px; height: 270px;" >
	                    <a href="bookDetail.jsp?bookId=<%=  list.get(i).getId() %>"> <%=  list.get(i).getMainImgUrl() %> </a>
	                </div>
	                <div style="width: 250px; height: 55px;" >    
	                        <p class="pull-right"> by <%=list.get(i).getAuthor()  %> </p>  
	                        <p><%=  list.get(i).getTitle() %> </p>
	                        <p><%=  list.get(i).getDescription() %> </p>
	                 </div>                
	            </div>
            </div>
            <!-- 반복 끝 --> 
<%
    }
%>              
            <!-- 마지막 book 만들기 -->
	        <div class="col-md-3">
		        <div style="width: 250px; height: 325px;" >
			            <div style="width: 250px; height: 270px;" >
			                <a href="bookCreate.jsp"><img src="img/add_book.png" alt="" class="img-responsive" style="width:100%; height:100%; object-fit: contain;"/></a><!--책 이미지-->
		                </div>
		                <div style="width: 250px; height: 55px;" >   
		                    <p>새책 만들기</p> <!--책제목-->
		                    <!--책 발행일-->
		                    <p>블로그처럼  mini-Book 써보자 ^^</p>   <!--책 설명-->     
		               </div>    
		        </div>
	        </div>
        </div>
    </div>  
    
   

<div class="container">    
 <div id="footer">
 <p>Copyright © CMS 2018   &nbsp;  cms2580@naver.com </p>
</div> 
</div>
  </body>
</html>