<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %> 
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

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

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Note </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="../vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">


    
    
    
    
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />



        <!-- page content -->
        
        <%
                    ContentDAO contentDAO = new ContentDAO();
                    Util util = new Util();
                    Content content = contentDAO.searchContent(contentId);//한건 찾기 
                    
                %>
        
        
        <div class="right_col" role="main">
            <h1>Note</h1>
            <form method="POST" class="post-form" action="noteUpdateAction.jsp">
                <p><label for="id_title">Title:</label> <input type="text" name="title" class="form-control" width="50" placeholder="목차 제목을 입력해주세요." maxlength="200" required id="id_title" value="<%=content.getTitle() %>" /></p>
                
                <p><label for="id_url">Url:</label> <input type="text" name="contentsImgUrl" class="form-control" width="50" placeholder="대표 이미지 URL을 입력해주세요." alt="class=&quot;img-responsive&quot;" maxlength="500" id="id_url" value='<%=content.getContentsImgUrl()%>'/></p>
                
              
              <label for="id_timeline">TimeLine Date:</label>
                        <div class='input-group date' id='myDatepicker2'>
                            <span class="input-group-addon">
                               <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            <input type='text' class="form-control" name="tdate" id="id_timeline" value="<%=content.gettdate() %>"/>
                            
                        </div>
                
                <p><label for="id_text">Description:</label> <textarea id="summernote" name="text"  class="form-control" required id="id_text"><%=content.getText() %></textarea></p>
                <input type='hidden' name="bookId"  value="<%=bookId%>"/>
                <input type='hidden' name="id"  value="<%=contentId%>"/>
                <button type="submit" class="save btn btn-default">Save</button>
            </form>
        </div>
            
        <!-- /page content -->
        
        

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            cms2580@naver.com
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="../vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    <!-- summernote -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    
    
    <script>
    $(document).ready(function() {
        $('#summernote').summernote({height: 300});
        
    });
    
    $('#myDatepicker2').datetimepicker({
        format: 'YYYY.MM.DD'
    });
  
    </script>
  </body>
</html>