<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %> 
<%@ page import="com.common.Util" %>
<%@ page import="java.util.ArrayList" %>

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
<script>
function search(){
    
    alert("개발중입니다.");
    
}
</script>
</head>
<body>

<jsp:include page="header.jsp" flush="true" />


<%

String period = "1";// 교시
if(request.getParameter("period")!=null && request.getParameter("period")!=""){
	period = request.getParameter("period");
	//System.out.println("period========="+ period);
}

%>
 
<!-- 본문 시작  -->


  <div class="content-wrapper">
	<div class="container">
	<div class="row">
		<div class="col-sm-4" style="text-align:left; height:25px;"><p>기술사 &nbsp;&nbsp;&nbsp;제 116회</p></div>
		<div class="col-sm-5"><p></p></div>
		<div class="col-sm-3" style="text-align:right; height:25px;"><p>제 <%= period %> 교시 &nbsp;&nbsp;(시험시간:100분)</p></div>
	</div>
	<div class="row">
		<div class="col-sm-1" style="border:1px solid gray; text-align:center; "><p>분야</p></div>
		<div class="col-sm-1" style="border:1px solid gray; text-align:center; "><p>정보통신</p></div>
		<div class="col-sm-1" style="border:1px solid gray; text-align:center; "><p>자격종목</p></div>
		<div class="col-sm-3" style="border:1px solid gray; text-align:center; "><p>정보관리기술사</p></div>
		<div class="col-sm-1" style="border:1px solid gray; text-align:center; "><p>수험번호</p></div>
		<div class="col-sm-2" style="border:1px solid gray; text-align:center; "><p>&nbsp;</p></div>
		<div class="col-sm-1" style="border:1px solid gray; text-align:center; "><p>성명</p></div>
		<div class="col-sm-2" style="border:1px solid gray; text-align:center; "><p>&nbsp;</p></div>
	</div>
	<hr>
	<div class="row">
	<% if(period.equals("1.0") || period.equals("1")){ %>
		<h5>&nbsp;&nbsp;&nbsp;*다음 문제 중 10문제를 선택하여 설명하시오. (각 10점)</h5> 
	<%}else{ %>
		<h5>&nbsp;&nbsp;&nbsp;*다음 문제 중 4문제를 선택하여 설명하시오. (각 25점)</h5>
	<% } %>
	</div>
	<br>
	
 <%
	ExamlistDAO examlistDAO = new ExamlistDAO();
	String temp ="";
	ArrayList<Examlist> list = examlistDAO.randomExamMaster(period);//
	Util util = new Util();
	String gubun="관리";
	
	for(int i =0 ; i < list.size(); i++){
		
		if(list.get(i).getExamcode().equals("A002")){
			gubun ="응용";
		}
		
%>					<div  class="col-sm-12" >
				
					<%-- 하나의 문제 유형 시작 --%>	
						<div id="<%= i %>" style="position:relative" class="text-muted mt-0 mb-1"> <%-- 문제 영역 --%>

						<%=i+1%>. <%= list.get(i).getExamdesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") %>  ( <%= gubun%> <%= list.get(i).getTurn() %>회 ) <%-- 줄바꿈 처리 --%>
					</div>
					<br>

					</div> 

<%
	}
%>					
	
	
	</div><!-- container 끝  -->
</div><!-- container wrapper 끝  -->
		
		
  
  
  
 <!-- 본문 끝  -->
   


</html>
