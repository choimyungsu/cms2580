<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

<% 
String bookId = "";// 
if(request.getParameter("bookId")!=null && request.getParameter("bookId")!=""){
    bookId = request.getParameter("bookId");
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

    <title> Book </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">


    
    
    
    
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />



        <!-- page content -->
        <div class="right_col" role="main">
	        <h1>content</h1>
		    <form method="POST" class="post-form" action="contentCreateAction.jsp">
		        <p><label for="id_title">Title:</label> <input type="text" name="title" class="form-control" width="50" placeholder="목차 제목을 입력해주세요." maxlength="200" required id="id_title" /></p>
		        <p><label for="p_id">부모 목차:</label>
		          <select id="level2" name="pid" class="form-control">
                          <option value="" selected="selected">부모목차</option>
                  </select>
                </p>
		        <p><label for="id_url">Url:</label> <input type="text" name="contentsImgUrl" class="form-control" width="50" placeholder="대표 이미지 URL을 입력해주세요." alt="class=&quot;img-responsive&quot;" maxlength="500" id="id_url" /></p>
		        <p><label for="id_text">Description:</label> <textarea id="summernote" name="text"  class="form-control" required id="id_text"></textarea></p>
		        <input type='hidden' name="bookId"  value="<%=bookId%>"/>
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

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    <!-- summernote -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    
    
    <script>
    $(document).ready(function() {
        $('#summernote').summernote({height: 300});
        
    });
    
    
  //json 처리 스크립트 
  var request = new XMLHttpRequest();

  $(document).ready(function(){
      /* var langSelect = document.getElementById("level1");
      var selectValue = langSelect.options[langSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
      var selectText = langSelect.options[langSelect.selectedIndex].text; // select element에서 선택된 option의 text가 저장된다. */
      var level2 =$("#level2");// ajax로 데이터 뿌려줄 부분 
      
      $.ajax({
          url:"../../bookContentSearchServlet",    
          type:'POST',
          data:'bookid='+<%=bookId%> ,
          dataType:'json',
          success : function(data){
              $(level2).children().remove();// 두번째 셀렉트 부분 데이터 삭제
              $(level2).append("<option value=''>선택</option>");// 옵션 하나 추가
          var result = data["result"];
              
              var mcCode = "";
              //var mcName = "";
              for(var i=0; i<result.length; i++){
                  mcCode=result[i].resultMccode; //
                  mcName=result[i].resultMcname; //
                  $(level2).append("<option value='"+mcCode+"'>"+mcName+" </option>");
              } 
          },
          error : function(response){
              var err = response.status + ''+ response.statusText;
              alert(err);
              alert("처리중 오류가 발생햇습니다. 관리자에게 문의하세요.")
          }
      });
  });
    </script>
  </body>
</html>