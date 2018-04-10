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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


    <script type="text/javascript">
      
      
      google.charts.load("current", {packages:['corechart']});
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([

<%
        ExamlistDAO examlistDAO = new ExamlistDAO();
        String examGroupListJSON ="";
        examGroupListJSON = examlistDAO.getExamGroupListJSON();
%>          
         
["Element", "건수", { role: "style" } ],
<%= examGroupListJSON%>


        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },
                         2]);

        var options = {
          title: "등록 문제수",
          width: 700,
          height: 200,
          bar: {groupWidth: "90%"},
          legend: { position: "none" },
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
        chart.draw(view, options);
    }
      
    </script>
</head>

<body>
<div class="container">
    <div class="row">
	    <div class="col-sm-12">
	        <div id="columnchart_values" class="pull-left"></div>
	    </div>
    </div>
     <div class="row">
        <div class="col-sm-12">
            <div align="center"><h2>문제는 지속적으로 업로드 됩니다.</h2></div>
        </div>
    </div>
</div>
</body>
</html>