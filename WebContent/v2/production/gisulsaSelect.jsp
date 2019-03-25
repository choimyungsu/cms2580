<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.file.Linkfile" %>    

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 맞춤 랜덤 출제 </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    <link href='../../css/fullcalendar.min.css' rel='stylesheet' />
    <link href='../../css/fullcalendar.print.min.css' rel='stylesheet' media='print' />

    
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> 맞춤형 랜덤 출제 </h2>
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


						<div class="content-wrapper">
						    <div class="container-fluid">
						       <div id="demo2" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
						             
			                    <div class="form-group">
			                    <form name="form1" method="post" action="../../gisulsaExamList2.jsp">
			                    
			                      <div class="row" style="padding:5px;">
			                        &nbsp; <b>교시 :</b>  <input type=radio name="period" id="period" checked  value="1"> 1교시
			                         <input type=radio name="period" id="period"  value="2"> 2교시
			                         <input type=radio name="period" id="period"  value="3"> 1+2교시(혼합 1교시 7개,2교시 3개)
			                      </div><!-- row  -->
			                                                           
			                      <div class="row" style="padding:5px;">
			                         &nbsp; <b>종목 :</b> <input type=radio name="searchType" id="searchType"  value="1"> 정보관리
			                         <input type=radio name="searchType" id="searchType"  value="2"> 컴퓨터응용
			                         <input type=radio name="searchType" id="searchType"  checked value="3"> 전체
			                      </div><!-- row  -->
			                      <div class="row" style="padding:5px;">
			                         &nbsp; <b>회차 :</b> <input type=radio name="searchTurn" id="searchTurn"  value="1"> 최근5회차
			                         <input type=radio name="searchTurn" id="searchTurn"  value="2"> 최근10회차
			                         <input type=radio name="searchTurn" id="searchTurn"  checked value="3"> 전체
			                         &nbsp; <button type="button" onclick="submitForm()" class="btn btn-success" >검색</button>
			                      </div><!-- row  -->
			                      
			                     
			                      <input type="hidden" name="examcode">
			                      <input type="hidden" name="turn">
			                      
			                      </form>
			                      </div><!-- form-group  -->
						  
						  <iframe id="resultExam" src="" name="resultExam" style="display:block; width:100%; height: 80vh; frameborder:1"> </iframe>
						         
						  </div><!-- container  -->
						</div>
						
						</div>
						
						    <script type="text/javascript">
						        function submitForm(){
						            document.form1.target = "resultExam";
						            document.form1.submit();
						
						        }
						</script>

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

    <!-- FullCalendar -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src='../../js/ko.js'></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.js"></script>






  </body>
</html>