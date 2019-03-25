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
	   <div id="demo2" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
		  <div class="panel panel-primary">
		      <div class="panel-heading">
		          <h3 class="panel-title">
		              <span class="glyphicon glyphicon-pencil"></span>
		                                      랜덤 출제 조건                               
		          </h3>   
		      </div>
		      <div class="panel-body" >

					<div class="form-group">
					<form name="form1" method="post" action="gisulsaExamList2.jsp">
					
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
  </div>
  </div>
</div><!-- container  -->
</div>

</div>

    <script type="text/javascript">
        function submitForm(){
        	document.form1.target = "resultExam";
        	document.form1.submit();

        }
</script>
</body>
 
</html>