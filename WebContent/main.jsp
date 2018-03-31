<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.file.Linkfile" %>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
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
</style>
</head>
<body>

<jsp:include page="header.jsp" flush="true" />

 
    
  <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="img/1.jpg" alt="Los Angeles" style="width:100%;">
      </div>
      <div class="item">
        <img src="img/2.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="img/3.jpg" alt="New york" style="width:100%;">
      </div>
    <div class="item">
        <img src="img/4.jpg" style="width:100%;">
    </div>
    <div class="item">
        <img src="img/5.jpg" style="width:100%;">
    </div>
    <div class="item">
        <img src="img/6.jpg" alt="New york" style="width:100%;">
    </div>
    <div class="item">
        <img src="img/7.jpg" alt="New york" style="width:100%;">
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
    


<div id="footer">
 <p>Copyright © CMS 2018   &nbsp;  cms2580@naver.com </p>
</div>  
</body>
</html>