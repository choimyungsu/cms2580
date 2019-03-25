<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.file.Linkfile" %>
<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.bbs.BbsDAO" %>
<%@ page import="com.bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.exam.Examgroupcount" %>
<%@ page import="com.calendar.CalendarDAO" %>  
<%@ page import="com.calendar.Calendar" %> 
<%@ page import="java.util.*, java.text.*"  %>
<%@ page import="java.text.SimpleDateFormat"  %>
<%@ page import="com.visit.VisitDAO" %>  



<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>CMS Renewal </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
 
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="../vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="../vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
    
    
    <!-- Custom Theme Style -->
    <!-- <link rel="stylesheet" href="../../css/custom.css"> -->


    
    <style>
		  #calendar {
		    max-width: 900px;
		    margin: 0 auto;
		  }
    </style>
    
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
        <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">
          


          <br />

          <div class="row">
          
          <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel fixed_height_420">
                <div class="x_title">
                  <h2> CMS site <small>특징</small></h2>
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
                
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#myCarousel" data-slide-to="1"></li>
                      <li data-target="#myCarousel" data-slide-to="2"></li>
                      <li data-target="#myCarousel" data-slide-to="3"></li>
                      <!-- <li data-target="#myCarousel" data-slide-to="4"></li>
                      <li data-target="#myCarousel" data-slide-to="5"></li>
                      <li data-target="#myCarousel" data-slide-to="6"></li> -->
                    </ol>
                
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="item active">
                        <img src="../../img/first.jpg" alt="first" style="width:100%;">
                      </div>
                      <div class="item">
                        <img src="../../img/second.jpg" alt="second" style="width:100%;">
                      </div>
                    
                      <div class="item">
                        <img src="../../img/third.jpg" alt="third" style="width:100%;">
                      </div>
                    <div class="item">
                        <img src="../../img/fourth.jpg" alt="fourth" style="width:100%;">
                    </div>
                    
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>
                  
                </div>
              </div>
            </div>
          
            

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_420 overflow_hidden">
                <div class="x_title">
                  <h2>문제등록 현황</h2>
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
			        <!--Table-->
			        <table class="table table-bordered">
			        
			            <!--Table head-->
			            <thead>
			                <tr>
			                    <!-- <th>#</th> -->
			                    <th>종목</th>
			                    <th>건수</th>
			                    <th>종목</th>
			                    <th>건수</th>
			                </tr>
			            </thead>
			          <!--Table head-->
			        
			            <!--Table body-->
			            <tbody>
			<%
			        ExamlistDAO examlistDAO = new ExamlistDAO();
			        ArrayList<Examgroupcount> list2 = examlistDAO.getExamGroupList();
			        StringBuffer result1 = new StringBuffer("");
			        StringBuffer result2 = new StringBuffer("");
			        for(int i =0 ; i < list2.size(); i++){
			%>          
			               <% if((i%2) == 0) { %> <tr> <% } %>
			                    <%-- <th scope="row"><%= i+1 %></th> --%>
			                    <td><small><%= list2.get(i).getExamgroup() %></small></td>
			                    <td><small><%= list2.get(i).getCount() %></small></td>
			                <% if((i%2) == 1 ) { %> </tr> <% } %>
			<% } %>             
			                 
			            </tbody>
			            <!--Table body-->
			        
			        </table>
			        <!--Table-->
			        </div>
                  
                </div>
              </div>
            </div>


            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_420 ">
                <div class="x_title">
                  <h2>시험 일정</h2>
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
                 
                  
                  <div id='calendar'></div>
                  
                </div>
              </div>
              
              
            </div>

          </div>


          <div class="row">
          
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_420">
                <div class="x_title">
                  <h2>공지사항</h2>
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
                <div class="x_content"><!-- BOX 내용  -->
                  <div class="row">
                  <% 
                        int pageNumber = 1;
                        if(request.getParameter("pageNumber") !=null){
                            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
                        }
                    %>
                        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                            <thead>
                                <tr>
                                    <th style="background-color: #eeeeee; text-align: center;">제목</th>
                                    <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <%
                                BbsDAO bbsDAO = new BbsDAO();
                                ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                                int j=list.size();
                                if(j>6){j=6;}
                                for(int i =0 ; i < j; i++){
                            %>
                                <tr>
                                    <td align="left"><a href ="../../bbsView.jsp?bbsID=<%= list.get(i).getBbsid() %>"><%= list.get(i).getBbstitle() %></a> </td>
                                    <td align="center"><%= list.get(i).getBbsdate().substring(0,11) + list.get(i).getBbsdate().substring(11,13) + "시" +list.get(i).getBbsdate().substring(14,16)+"분 "  %></td>
                                </tr>
                                <%
                                
                                }
                                    
                                %>
                            </tbody>
                        </table>

                    </div>
                </div>
              </div>
            </div>


            <div class="col-md-8 col-sm-8 col-xs-12">



              <div class="row">

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="x_panel tile fixed_height_390">
                  <!-- <div class="x_panel"> -->
                    <div class="x_title">
                      <h2>오늘의 Topic </h2>
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
                    
                     <iframe id="sticky" src="../../stickyNoteiframe.jsp" name="sticky" style="display:block; width:100%; height: 80vh; frameborder:0"> </iframe>
                      
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
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>

    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- FullCalendar -->
    <script src='../../js/lib/moment.min.js'></script><!-- 최신의 moment js필요 -->
    <script src='../../js/fullcalendar.min.js'></script><!-- 최신의 calendar js필요 -->
    <script src='../../js/ko.js'></script>
    

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.js"></script><%-- 샘플로 들어간 달력값 초기화 함 --%>
   
   
   <script>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());

CalendarDAO calendarDAO = new CalendarDAO();
String calendarListJSON ="";
calendarListJSON = calendarDAO.getCalendarListJSON(today);

//System.out.println(today);
String userID = "";
if(session.getAttribute("userID") !=null ){
    userID = (String) session.getAttribute("userID");
}

//방문기록 추가  2019.02.12
VisitDAO visitDAO = new VisitDAO();
visitDAO.insert(userID,  request.getRemoteAddr());

%>


  $(document).ready(function() {
      var initialLocaleCode = 'ko';
     // var calendar1 = $('#calendar').fullCalendar();
    var calendar = $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: '<%= today%>',
      locale: initialLocaleCode,
      navLinks: true, // can click day/week names to navigate views
      eventLimit: true, // allow "more" link when too many events (true or false)
     
      <%= calendarListJSON%>,
      
      selectable:true,
      selectHelper:true,
      <% if(userID.equals("cms")){ %>
      select:function(start, end, allDay)
      {
          var title = prompt("일정을 입력하세요");
          if(title)
          {
                var start =  $.fullCalendar.formatDate(start,"Y-MM-DD HH:mm:ss");
                var end =  $.fullCalendar.formatDate(end,"Y-MM-DD HH:mm:ss");
                $.ajax({
                    url:"../../calendarInsert.jsp",
                    type:"POST",
                    data:{title:title, start:start, end:end},
                    success:function()
                    {
                        // 리프레쉬 구현 필요
                        //calendar.fullCalendar('rerenderEvents');
                        //$('#calendar').fullCalendar('rerenderEvents');
                        $('#calendar').fullCalendar('rerenderEvents');
                       // $('#calendar').fullCalendar('rerenderEvents');
                      //Updating new events
                      $('#calendar').fullCalendar('rerenderEvents');
                      //getting latest Events
                      //$('#fullCalendar').fullCalendar( 'refetchEvents' );
                      //getting latest Resources
                      $('#calendar').fullCalendar( 'refetchResources' );
                       
                        alert("일정이 등록 되었습니다.");
                        location.reload();
                    }
                })
           }
      },
      editable: true,
      eventResize:function(event)
      {
          var start = $.fullCalendar.formatDate(event.start,"Y-MM-DD HH:mm:ss");
          var end = $.fullCalendar.formatDate(event.end,"Y-MM-DD HH:mm:ss");
          var title = event.title;
          var id = event.id;
          var calendarID = event.calendarID;
          $.ajax({
              url:"../../calendarUpdate.jsp",
              type:"POST",
              data:{title:title, start:start, end:end, id:id, calendarID:calendarID},
              success:function()
              {
                  //calendar.fullCalendar('rerenderEvents');
                  $('#calendar').fullCalendar('rerenderEvents');
                  $('#calendar').fullCalendar( 'refetchEvents' );
                //remove old data
                  $('#calendar').fullCalendar('removeEvents');
                   

                  //Updating new events
                  $('#calendar').fullCalendar('rerenderEvents');
                  //getting latest Events
                  //$('#fullCalendar').fullCalendar( 'refetchEvents' );
                  //getting latest Resources
                  $('#calendar').fullCalendar( 'refetchResources' );
                  
                  
                  alert("일정이 수정 되었습니다.");
                  location.reload();
              }
          })
          
      },
      
      eventDrop:function(event)
      {
          var start = $.fullCalendar.formatDate(event.start,"Y-MM-DD HH:mm:ss");
          var end = $.fullCalendar.formatDate(event.end,"Y-MM-DD HH:mm:ss");
          var title = event.title;
          var id = event.id;
          var calendarID = event.calendarID;
          $.ajax({
              url:"../../calendarUpdate.jsp",
              type:"POST",
              data:{title:title, start:start, end:end, id:id, calendarID:calendarID},
              success:function()
              {
                 //calendar.fullCalendar('rerenderEvents');
                  $('#calendar').fullCalendar('rerenderEvents');
                  $('#calendar').fullCalendar( 'refetchEvents' );
                  alert("일정이 수정 되었습니다.");
                  location.reload();
              }
          })          
          
      },
      
      eventClick:function(event)
      {
          if(confirm("삭제하시겠습니까?"))
          {
              var calendarID = event.calendarID;
              $.ajax({
                  url:"../../calendarDelete.jsp",
                  type:"POST",
                  data:{calendarID:calendarID},
                  success:function()
                  {
                      //calendar.fullCalendar('rerenderEvents');
                      $('#calendar').fullCalendar('rerenderEvents');
                      alert("일정이 삭제 되었습니다.");
                      location.reload();
                  }
              })    
          }
      }
      <%}%>

     
    });

  });

</script>
   
   
   
   
	
  </body>
</html>
