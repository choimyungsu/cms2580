<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.user.UserDAO" %>  
<%@ page import="com.user.User" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>

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
	String userID = null;
	if(session.getAttribute("userID") !=null ){
	    userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
	    
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert(' 로그인을 하세요.')");
	    script.println("location.href = 'login.jsp'");
	    script.println("</script>");
	    
	}
	
	if(!userID.equals("cms")){
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert(' 관리자가 아닙니다.')");
	    script.println("location.href = 'main.jsp'");
	    script.println("</script>");
	    
	    
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
                        &nbsp;&nbsp; 회원가입 목록
                    </h3>   
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table  class="display" style="text-align: center; border: 1px solid #dddddd" id="tableData1">
                            <thead>
                                <tr>
                                    <th style="background-color: #eeeeee; text-align: center;">ID</th>
                                    <th style="background-color: #eeeeee; text-align: center;">이름</th>
                                    <th style="background-color: #eeeeee; text-align: center;">이메일</th>
                                    <th style="background-color: #eeeeee; text-align: center;">가입일</th>
                                    <th style="background-color: #eeeeee; text-align: center;">탈퇴여부</th>
                                    
                                </tr>
                            </thead>
                            <tbody>

                    <%
                        UserDAO userDAO = new UserDAO();
                        Util util = new Util();
                        ArrayList<User> list = userDAO.userList();
                       for(int i =0 ; i < list.size() ; i++){
                            //int j = i +1 ;
                    %>
                                <tr>
                                    <td><%= list.get(i).getUserid() %></td>
                                    <td><%= list.get(i).getUsername() %></td>
                                    <td><%= list.get(i).getEmail() %></td>
                                    <td><%= list.get(i).getJoinDate() %></td>
                                    <td><%= list.get(i).getAvailable() %></td>
                                    
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
                
                $('#tableData1').DataTable( {
                    responsive: true
                } );
                
            } );

            

        </script>
</div>
</div>

    
</body>
</html>