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

</head>
<body>
<jsp:include page="header.jsp" flush="true" />


<div class="content-wrapper">
<div class="container-fluid">

 <iframe id="sticky" src="stickyNoteiframe.jsp" name="sticky" style="display:block; width:100%; height: 80vh; frameborder:0"> </iframe>
  
</div><!-- container  -->
</div><!-- content-wrapper  -->

 
</body>
 
</html>