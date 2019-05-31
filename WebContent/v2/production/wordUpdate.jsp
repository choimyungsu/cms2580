<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.exam.ExamcontentsDAO" %>  
<%@ page import="com.exam.Examcontents" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

<% 


String examContentId= "";//
if(request.getParameter("examContentId")!=null && request.getParameter("examContentId")!=""){
	examContentId = request.getParameter("examContentId");
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

    <title> Word </title>

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
                    ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
                    Util util = new Util();
                    Examcontents examcontent = examcontentsDAO.searchExamContents(examContentId);//한건 찾기 
                    
                %>
        
        
        <div class="right_col" role="main">
            <h1>Word</h1>
            <form method="POST" class="post-form" action="wordUpdateAction.jsp">
                <p><label for="id_subject">Subject:</label> <input type="text" name="subject" class="form-control" width="50" placeholder="subject를 입력해주세요." maxlength="200" required id="id_subject" value="<%=examcontent.getSubject() %>" /></p>
                <p><label for="id_defintion">Definition:</label> <textarea id="summernote" name="definition"  class="form-control" required id="id_defintion"><%=examcontent.getDefinition()%></textarea>
                <p><label for="id_domain">Domain:</label> <input type="text" name="domain" class="form-control" width="50" placeholder="domain을 입력해주세요." maxlength="200"  id="id_domain" value="<%=examcontent.getDomain() %>" /></p>
                <p><label for="id_examcode">Examcode:</label> <input type="text" name="examcode" class="form-control" width="50" placeholder="examcode를 입력해주세요." maxlength="200"  id="id_examcode" value="<%=examcontent.getExamcode() %>" /></p>
                
                <input type='hidden' name="examcontentsid"  value="<%=examContentId%>"/>
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
        $('#summernote').summernote({height: 100});
        
    });
    

  
    </script>
  </body>
</html>