<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="ttps://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<title> CMS </title>
</head>
<body>

<jsp:include page="header.jsp" flush="true" />

<%

String search = "";// 시험 종목
if(request.getParameter("search")!=null && request.getParameter("search")!=""){
	search = request.getParameter("search");
    System.out.println("search========="+ search);
}

%>
  <div class="content-wrapper">
    <div class="container-fluid">
    <div id="demo2" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-pencil"></span>
                        &nbsp;"<%=search %>"&nbsp;검색 결과
                    </h3>   
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table  class="display" style="text-align: center; border: 1px solid #dddddd" id="tableData1">
                            <thead>
                                <tr>
                                    <th style="background-color: #eeeeee; text-align: center;">분야</th>
                                    <th style="background-color: #eeeeee; text-align: center;">회차</th>
                                    <th style="background-color: #eeeeee; text-align: center;">문제</th>
                                </tr>
                            </thead>
                            <tbody>
<%
    ExamlistDAO examlistDAO = new ExamlistDAO();
    Util util = new Util();
    ArrayList<Examlist> list = examlistDAO.likeSearchExamList(search);//""
    for(int i =0 ; i < list.size(); i++){
        
%>
                            <tr>
                                <td><%= list.get(i).getExamcode() %></td>
                                <td><%= list.get(i).getTurn() %></td>
                                <td style=" text-align: left;"><a href="examView.jsp?examListID=<%=list.get(i).getExamlistid() %>" target="_blank"> <%= util.cutStirng(list.get(i).getExamdesc(),50) %></a></td>
                            </tr>
<% 
        }
%>
                         </tbody>
                        </table>
                       </div>
				    </div>
				</div>
			</div>
		<script>
            
            $(document).ready(function() {
                $('#tableData1').DataTable();
            } );

        </script>
		</div>
	</div>

</body>
</html>