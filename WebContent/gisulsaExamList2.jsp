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

</head>
<body>

<%

String period = "1";// 교시
if(request.getParameter("period")!=null && request.getParameter("period")!=""){
	period = request.getParameter("period");
	//System.out.println("period========="+ period);
}

String searchType = "1";//시험 종류(정보관리/컴응)
if(request.getParameter("searchType")!=null && request.getParameter("searchType")!=""){
	searchType = request.getParameter("searchType");
    //System.out.println("searchType========="+ searchType);
}

String searchTurn = "1";// 회차 (최근5회차,10회차,전체)
if(request.getParameter("searchTurn")!=null && request.getParameter("searchTurn")!=""){
	searchTurn = request.getParameter("searchTurn");
    //System.out.println("searchTurn========="+ searchTurn);
}


%>
 
<!-- 본문 시작  -->


  <div class="content-wrapper">
	<div class="container-fluid">

	<div class="row">
	<% if(period.equals("1.0") || period.equals("1")){ %>
		<h5>&nbsp;&nbsp;&nbsp;*다음 문제 중 10문제를 선택하여 설명하시오. (각 10점)</h5> 
	<%}else if(period.equals("2.0") || period.equals("2")){ %>
		<h5>&nbsp;&nbsp;&nbsp;*다음 문제 중 4문제를 선택하여 설명하시오. (각 25점)</h5>
	<% }else{ %>
	   <h5>&nbsp;&nbsp;&nbsp;*1~7번까지 1교시 형(각 10점), 8~10번까지 2교시 형(각25점) 5개,2개 선택 100분</h5>
	<% } %>
	</div>
	<br>
	
 <%
	ExamlistDAO examlistDAO = new ExamlistDAO();
	String temp ="";
	ArrayList<Examlist> list = examlistDAO.randomExamMaster(period,searchType,searchTurn);//
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
						
						<%-- 문제 이미지가  있을때 --%>
                        <% if(list.get(i).getExamImg()!=null && list.get(i).getExamImg().length()> 0 ) { %>
                        <div class="row" style=" margin: 10px ">
                                <%=  list.get(i).getExamImg()%>
                        </div>                                  
                        <% } %>
						
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
