<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="ko">

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
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
          
          
          <div class="page-title">
              <div class="title_left">
                <H3>Note <--> Book 연결</H3>
              </div>
              
          </div>
          
 

            <div class="clearfix"></div>


            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Note</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    
	                    
	                    
	                <div class="panel-body">
	                    <div class="form-group row pull-right">
	                       <p>Book <select id="level2" name="bookId" class="form-control">
			                          <option value="" selected="selected">Book목록</option>
			                  </select>
			                </p>
	                    </div>
	                        <!-- <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" id="ajaxTable"> -->
	                        <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
	                            <thead>
	                                <tr>
	                                    
	                                    <th>
		                                   <th><input type="checkbox" id="check-all" class="flat"></th>
		                                </th>
	                                    <th>제목</th>
	                                    <!-- <th style="background-color: #eeeeee; text-align: center;">선택</th> -->
	                                    <!-- <th style="background-color: #eeeeee; text-align: center;">제목</th> -->
	                                    
	                                    
	                                </tr>
	                            </thead>
	                            <tbody >
	                    <%
	                    ContentDAO contentDAO = new ContentDAO();
	                    ArrayList<Content> list = contentDAO.searchContentsNoLinkBook();//"" 
	                        for(int i =0 ; i < list.size(); i++){
	                            //int j = i +1 ;
	                    %>
	                                <tr>
	                                 <td>
	                                     <th><input type="checkbox"  id="chkBox" class="flat" name="table_records" value="<%= list.get(i).getId() %>"></th>
	                                  </td>
	                                    <!-- <td><input type="checkbox" id="chkBox" ></td> -->
	                                    <td><a href="noteUpdate.jsp?contentId=<%=list.get(i).getId()%>"><%= list.get(i).getTitle() %></a></td>
	                                </tr>
	                        <%
	                        
	                        }
	                            
	                        %>
	                            </tbody>
	                        </table>
	
	                        <input type="button"  onclick="saveNote()" class="btn btn-primary btn-sm pull-right" value="저장">
	                </div>    
                    
                    
                    
                    
                    
                    

                  </div>
                </div>
              </div>
            </div>
          </div>
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
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    
    
    
     <script>

    
  //json 처리 스크립트 
  var request = new XMLHttpRequest();

  $(document).ready(function(){
      var level2 =$("#level2");// ajax로 데이터 뿌려줄 부분 
      
      $.ajax({
          url:"../../bookSearchServlet",    
          type:'POST',
          data:'' ,
          dataType:'json',
          success : function(data){
              $(level2).children().remove();// 두번째 셀렉트 부분 데이터 삭제
              $(level2).append("<option value=''>Book목록</option>");// 옵션 하나 추가
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
  
  
  
  function saveNote(){
      var ArrayCheck = new Array();    //배열선언
      // 체크된 항목 갑  배열에 넣기..
      $('#chkBox:checked').each(function() { 
          // alert($(this).val());
          ArrayCheck.push($(this).val());
      });
      var langSelect = document.getElementById("level2");
      var selectValue = langSelect.options[langSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
      
      location.href="noteLinkBookAction.jsp?ArrayCheck="+ArrayCheck+"&bookId="+selectValue;
}
    </script>
    
  </body>
</html>