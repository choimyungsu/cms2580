<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.file.Linkfile" %>
<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!--1. clipboard.js 파일 cdn을 통해서 로드-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>


    <script type="text/javascript">
      //google.charts.load('current', {'packages':['corechart']});
      google.charts.load("visualization", "1", {packages:["corechart"]});//챠트의 리사이즈가 가능하도록
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([

     <%
            ExamlistDAO examlistDAO = new ExamlistDAO();
            String examGroupListJSON ="";
            examGroupListJSON = examlistDAO.getExamGroupListJSON2();
    %>         	
          ['유형', '건수'],
          
          <%= examGroupListJSON%>

        ]);

        var options = {
          title: '기출문제DB 등록건수',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      
      $(window).resize(function(){
    	  drawChart();
    	});
      
   // 3. 웹 문서가 로드되면 클립보드 객체 생성
      $(document).ready(function(){

          var clipboard = new Clipboard('.btn');
          clipboard.on('success', function(e) {
              console.log("Success");
              alert("복사되었습니다.")

              /*
              아래 함수를 통해서 블록지정을 없앨 수 있습니다.
              */
              var selection = window.getSelection();
              selection.removeAllRanges();
          });
          clipboard.on('error', function(e) {
              console.log("Fail");
          });

          // 아래와 같이 button 태그만 가져오는 방법도 가능하다.
          /*
          var btns = document.querySelectorAll('button');
          var clipboard = new Clipboard(btns);
          */


      });   

    </script>


<title> CMS </title>

<style>
#footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:40px;
   width:100%;
   background:#F2F2F2;
   color: #2E2E2E;
   padding: 10px ;
}
#footer p {
   text-align: center;
   font-size: 12px;
}

.chart {
  margin:0;
  width: 100%; 
  min-height: 500px;
  max-height: 900px;
}
.row {
  margin:0 !important;
}
.videoWrapper{
    position:relative;
    padding-bottom: 56.25%; /* 16:9 */
    padding-top: 25px;
    height: 0;
}
.videoWrapper iframe{
    position: absolute;
    top: o;
    left: 0;
    width: 100%;
    height: 100%;
}


</style>
</head>
<body class="nav-md">

<jsp:include page="header.jsp" flush="true" />

     
  <div class="container">
  
  <div class="row">
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
	        <img src="img/first.jpg" alt="first" style="width:100%;">
	      </div>
	      <div class="item">
	        <img src="img/second.jpg" alt="second" style="width:100%;">
	      </div>
	    
	      <div class="item">
	        <img src="img/third.jpg" alt="third" style="width:100%;">
	      </div>
	    <div class="item">
	        <img src="img/fourth.jpg" alt="fourth" style="width:100%;">
	    </div>
	<!--     <div class="item">
	        <img src="img/5.jpg" style="width:100%;">
	    </div>
	    <div class="item">
	        <img src="img/6.jpg" alt="New york" style="width:100%;">
	    </div>
	    <div class="item">
	        <img src="img/7.jpg" alt="New york" style="width:100%;">
	    </div> -->
	    
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
<br>
<button class="btn btn-primary btn-sm" data-clipboard-text="http://cms2580.cafe24.com">URL 클립보드 복사</button>


           






<div class="row">
	<a href="https://play.google.com/store/apps/details?id=com.cafe24.cms2580.cmsgisa" target="_blank">
	     <img src="img/app.png" width="250"  alt="앱다운로드">
    </a>
    <br>앱을 다운받으면 더욱 편리합니다.
</div>
<div class="row">
    <div class="col-sm-6">
    <div class="videoWrapper">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/kg8twIlpYzg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="videoWrapper">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/PSh0Z_nOlus" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
    <div class="videoWrapper">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/Kc-fMdbsTtE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> 
    </div>
    </div>
    <div class="col-sm-6">
    <div class="videoWrapper">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/6OTIecLhBhY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> 
    </div>
    </div>
</div>
<div id="piechart"></div>


</div> 




<div id="footer">
 <p>Copyright © CMS 2018   &nbsp;  cms2580@naver.com </p>
</div>  
</body>
</html>