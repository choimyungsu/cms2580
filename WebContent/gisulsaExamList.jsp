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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

<title> CMS </title>

<style>

#cmd {
  position: fixed;
  top: 20px;
  right: 20px;
  z-index: 99;
  font-size: 12px;
  border: none;
  outline: none;
  background-color: #0080FF ;
  color: white;
  cursor: pointer;
  padding: 5px;
  border-radius: 4px;
  opacity: 0.5; /* 투명도 설정 */
}

#cmd:hover {
  background-color: #555;
}

</style>

</head>
<body>

<jsp:include page="header.jsp" flush="true" />


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
	<div class="container">
	<button id="cmd">PDF다운</button>
	<%-- <div class="row">
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
	</div> --%>
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
		
<script>



var doc = new jsPDF();
/* var specialElementHandlers = {
    '#editor': function (element, renderer) {
        return true;
    }
}; */

/*
$("#cmd").click(function () {

        
      // var pdf = new jsPDF('p', 'mm', 'a4')
      //  var canvas = pdf.canvas
        var pageWidth = 200 //캔버스 너비 mm
        var pageHeight = 295 //캔버스 높이 mm
        // canvas.width = pageWidth

        //var imgHeight = $("content").outerHeight();
        
        
        html2canvas(document.getElementById("pdfContents"), {
             onrendered : function(canvas){
              var imgData = canvas.toDataURL('image/png');
              var doc = new jsPDF('p','mm','a4');
              //doc.addImage(imgData, 'PNG', 5,5,200,25);//pdf.addImage(imgData, 'png', 0, position, pageWidth, imgHeight, undefined, 'slow')
              doc.addImage(imgData, 'PNG', 5,5,pageWidth,1000);
              doc.save('problem.pdf');
                } 
            });
         
    });
*/

$("#cmd").click(function () {
//현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
html2canvas(document.body, {
  onrendered: function(canvas) {
 
    //  alert("aaa");
    // 캔버스를 이미지로 변환
    //var imgData = canvas.toDataURL('image/png');
    var imgData = canvas.toDataURL('image/jpeg');//용량줄이기
     
    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    var imgHeight = canvas.height * imgWidth / canvas.width;
    var heightLeft = imgHeight;
     
        var doc = new jsPDF('p', 'mm');
        var position = 0;
         
        // 첫 페이지 출력
        doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);//PNG
        heightLeft -= pageHeight;
         
        // 한 페이지 이상일 경우 루프 돌면서 출력
        while (heightLeft >= 20) {
          position = heightLeft - imgHeight;
          doc.addPage();
          doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);//PNG
          heightLeft -= pageHeight;
        }
 
        // 파일 저장
        doc.save('random_test_A4.pdf');
  }
});

});

</script>   		
  
  
  
 <!-- 본문 끝  -->
   


</html>
