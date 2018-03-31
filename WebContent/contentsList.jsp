<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamcontentsDAO" %>  
<%@ page import="com.exam.Examcontents" %> 
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
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="ttps://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

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
    String examcode = "";// 시험 종목
    if(request.getParameter("type")!=null && request.getParameter("type")!=""){
        examcode = request.getParameter("type");
        //System.out.println("examcode========="+ examcode);
    }
%>


  <div class="content-wrapper">
    <div class="container-fluid">
        <!-- 컨텐츠 검색  -->
        <div id="demo2" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-pencil"></span>
                        &nbsp;&nbsp; 학습자료 목록
                    </h3>   
                </div>
                <div class="panel-body">
                        <table  class="display" style="text-align: center; border: 1px solid #dddddd" id="tableData1">
                            <thead>
                                <tr>
                                    <th style="background-color: #eeeeee; text-align: center;">seq</th>
                                    <th style="background-color: #eeeeee; text-align: center;">domain</th>
                                    <th style="background-color: #eeeeee; text-align: center;">subject</th>
                                    <th style="background-color: #eeeeee; text-align: center;">linkurl</th>
                                </tr>
                            </thead>
                            <tbody>

                    <%
                        ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
                        Util util = new Util();
                        ArrayList<Examcontents> list = examcontentsDAO.searchExamcontents(examcode);
                       for(int i =0 ; i < list.size() ; i++){
                            //int j = i +1 ;
                    %>
                                <tr>
                                    <td><%= list.get(i).getSeq() %></td>
                                    <td><%= list.get(i).getDomain() %></td>
                                    <td style=" text-align: left;"><%= list.get(i).getSubject() %></td>
                                    <td><a href="<%= list.get(i).getLinkurl() %>" target="_blank"> <%= list.get(i).getLinkurl() %> </a></td>
                                </tr>
                        <%
                        
                            }
                            
                        %>
                            </tbody>
                            </table>

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