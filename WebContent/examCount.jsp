<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamlistDAO" %> 
<%@ page import="com.exam.Examgroupcount" %>
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/css/mdb.min.css" rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/js/mdb.min.js"></script>
<!--1. clipboard.js 파일 cdn을 통해서 로드-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>            


</head>

<body>
<div class="container">
     <div class="row">
        <div class="col-sm-12">
            <div align="center"><b color="blue">문제는 지속적으로 업로드 됩니다.</b> <br>
                <b color="blue">2019년 9급 전산직,2019년  기사 문제 업로드 되었습니다.</b> <br> 
                <b color="blue"><a href="https://cafe.naver.com/ictbox" target="_blank"> 원본자료(PDF,HWP)도 Cafe에 올리고있습니다.</a></b>
            <button class="btn btn-primary btn-sm" data-clipboard-text="http://cms2580.cafe24.com">URL 클립보드 복사</button>
            </div>
        </div>
    </div>
    <div class="row">
		<div class="col-md-12">
		    <canvas id="myChart" ></canvas>
		</div>
    </div>
    <div class="row">
      <div class="col-md-12">
	    <!--Table-->
		<table class="table table-bordered">
		
		    <!--Table head-->
		    <thead>
		        <tr>
		            <!-- <th>#</th> -->
		            <th>종목</th>
		            <th>등록  건수</th>
		            <th>종목</th>
                    <th>등록  건수</th>
                    <th>종목</th>
                    <th>등록  건수</th>
		        </tr>
		    </thead>
		  <!--Table head-->
		
		    <!--Table body-->
		    <tbody>
<%
        ExamlistDAO examlistDAO = new ExamlistDAO();
        ArrayList<Examgroupcount> list = examlistDAO.getExamGroupList();
        StringBuffer result1 = new StringBuffer("");
        StringBuffer result2 = new StringBuffer("");
        for(int i =0 ; i < list.size(); i++){
%> 		    
		       <% if((i%3) == 0) { %> <tr> <% } %>
		            <%-- <th scope="row"><%= i+1 %></th> --%>
		            <td><%= list.get(i).getExamgroup() %></td>
		            <td><%= list.get(i).getCount() %></td>
		        <% if((i%3) == 2 ) { %> </tr> <% } %>
<% } %>		        
		         
		    </tbody>
		    <!--Table body-->
		
		</table>
		<!--Table-->
        </div>
    </div>

</div>



<script type="text/javascript">
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        //labels: ["정보관리기술사", "컴퓨터응용시스템기술사", "정보보안기사-실기", "리눅스마스터1급-실기", "정보보안기사", "리눅스 마스터1급","네트워크관리사-1급","공이중개사","전산직공우뭔(정보보호)","전산직공우뭔(전산개발)","정보처리기사"],
    
       <% 
       result1.append("[");
       for(int i =0 ; i < list.size(); i++){ 
    	   result1.append("\"" + list.get(i).getExamgroup()+"\",");
       }
       result1.append("],");
       %>
    	  
       labels: <%= result1.toString() %>
        
        datasets: [{
            label: '등록된 문제 건수',
            // data: [1359, 1371, 159, 16, 300, 200,60,80,120,240,100],
            <% 
            result2.append("[");
            for(int i =0 ; i < list.size(); i++){ 
                result2.append("\"" + list.get(i).getCount()+"\",");
            }
            result2.append("],");
            %>

               
            data: <%= result2.toString() %>
            
            
            
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255,99,132,1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255,99,132,1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
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
    


</body>
</html>