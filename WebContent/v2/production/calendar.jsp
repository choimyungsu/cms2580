<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.calendar.CalendarDAO" %>  
<%@ page import="com.calendar.Calendar" %> 
<%@ page import="java.util.*, java.text.*"  %>

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> calendar </title>

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

<!-- <style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style> -->
    
    
    
    
    
    
    
    
    
    
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
                    <h2>Calendar </h2>
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



                            <div id='calendar'></div>
                      

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
    <script src='../../js/lib/moment.min.js'></script><!-- 최신의 moment js필요 -->
    <script src='../../js/fullcalendar.min.js'></script><!-- 최신의 calendar js필요 -->
    <script src='../../js/ko.js'></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.js"></script>

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