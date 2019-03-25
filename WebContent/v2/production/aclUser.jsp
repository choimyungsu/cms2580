<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDAO" %>  
<%@ page import="com.user.User" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>    
<!DOCTYPE html>
<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 권한관리  </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
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
    
    
    
    
    
    <script>
//json 처리 스크립트 
var request = new XMLHttpRequest();

function changeSelect(){
    var langSelect = document.getElementById("level1");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    var selectText = langSelect.options[langSelect.selectedIndex].text; // select element에서 선택된 option의 text가 저장된다.
    var level2 =$("#level2");// ajax로 데이터 뿌려줄 부분 
    
    $.ajax({
        url:"../../Level2SearchServlet",    
        type:'POST',
        data:'level1='+selectValue ,
        dataType:'json',
        success : function(data){
            $(level2).children().remove();// 두번째 셀렉트 부분 데이터 삭제
            $(level2).append("<option value=''>선택</option>");// 옵션 하나 추가
        var result = data["result"];
            
            var mcCode = "";
            //var mcName = "";
            for(var i=0; i<result.length; i++){
                mcCode=result[i].resultMccode; //
                $(level2).append("<option value='"+mcCode+"'>"+mcCode+" 회 </option>");
            } 
        },
        error : function(response){
            var err = response.status + ''+ response.statusText;
            alert(err);
            alert("처리중 오류가 발생햇습니다. 관리자에게 문의하세요.")
        }
    });
}

function changeSelect2(){

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var secondSelect = document.getElementById("level2");
    var secondValue = secondSelect.options[secondSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var thirdSelect = document.getElementById("level3");
    thirdSelect.selectedIndex = 0; // 초기화
    
    document.form1.target = "resultExam";
    document.form1.action = "../../examList.jsp";
    document.form1.examcode.value = firstValue;
    document.form1.turn.value = secondValue;
    
    document.form1.submit();
}

function changeSelect3(){

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var secondSelect = document.getElementById("level2");
    var secondValue = secondSelect.options[secondSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var thirdSelect = document.getElementById("level3");
    var thirdValue = thirdSelect.options[thirdSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    document.form1.target = "resultExam";
    
    if(thirdValue=='one'){
        document.form1.action = "../../examDetailView.jsp";
    }else{
        document.form1.action = "../../examList.jsp";
    }
    
    document.form1.examcode.value = firstValue;
    document.form1.turn.value = secondValue;
    
    document.form1.submit();
}
function aaa(){
    alert("눌렀다.");
}
  

</script>
    
    
    
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
                <h3>권한관리</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>유저-권한 매핑 관리</h2>
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
                    <div class="row">
                      <div class="col-sm-6 mail_list_column">
                        <form name="form1" method="post"> 
                        <div class="x_content">
                    
		                    <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
		                      <thead>
		                        <tr>
		                          <th>
		                             <th><input type="checkbox" id="check-all" class="flat"></th>
		                          </th>
		                          <th>ID</th>
		                          <th>이름</th>
		                          <th>가입일</th>
		                        </tr>
		                      </thead>
		                      <tbody>
		                      
		                      <%
			                        UserDAO userDAO = new UserDAO();
			                        Util util = new Util();
			                        ArrayList<User> list = userDAO.userList();
			                       for(int i =0 ; i < list.size() ; i++){
			                   %>
		                      
		                        <tr>
		                          <td>
		                             <th><input type="checkbox"  id="chkBox" class="flat" name="table_records"></th>
		                          </td>
		                          <td><%= list.get(i).getUserid() %></td>
                                  <td><%= list.get(i).getUsername() %></td>
                                  <td><%= list.get(i).getJoinDate() %></td>
		                        </tr>
		                        <% } %>
		                        
		                        
		                       
		                      </tbody>
		                    </table>
		                  </div>
                        
                        </form>
                        
                        
                      </div>
                      <!-- /MAIL LIST -->

                      <!-- CONTENT MAIL -->
                      <div class="col-sm-6 mail_view">
                        <div class="inbox-body">
                          
                          <iframe id="resultExam" src="authResource.jsp" name="resultExam" style="display:block; width:100%; height: 100vh; frameborder:0"> </iframe>
                        
                        </div>

                      </div>
                      <!-- /CONTENT MAIL -->
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
    <!-- bootstrap-wysiwyg -->
    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
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
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>