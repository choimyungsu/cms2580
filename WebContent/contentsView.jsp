<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamcontentsDAO" %>  
<%@ page import="com.exam.Examcontents" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<title>CMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>

<% 
String examContentsID = "";// 
if(request.getParameter("examContentsID")!=null && request.getParameter("examContentsID")!=""){
	examContentsID = request.getParameter("examContentsID");
    //System.out.println("examListID========="+ examListID);
}
%>


<body>
<jsp:include page="header.jsp" flush="true" />

    <div class="container">
        <div class="row">

 <%
    ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
    Util util = new Util();
    Examcontents examcontents = examcontentsDAO.searchExamContents(examContentsID);
    

  %>
  
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="glyphicon glyphicon-pencil"></span>
                    &nbsp;&nbsp; contents 상세
                </h3>   
            </div>
            <div class="panel-body">
            <form class="form-horizontal" action="contentsUpdate.jsp" method="post">
                <div class="form-group">
                  <label class="control-label col-sm-1" for="examContentsID">examContentsID</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="examContentsID" placeholder="고유번호" value="<%= examContentsID %>">
                  </div>
                  <label class="control-label col-sm-1" for="seq">seq</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" placeholder="코드" value="<%= examcontents.getSeq() %>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="domain">domain</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="examContentsID" placeholder="고유번호" value="<%= examcontents.getDomain() %>">
                  </div>
                  <label class="control-label col-sm-1" for="subject">subject</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" placeholder="코드" value="<%= examcontents.getSubject() %>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="definition">definition</label>
                  <div class="col-sm-11"> 
                  <textarea class="form-control" placeholder="글 내용" name="definition" maxlength="2048" style="height: 100px;" > <%= examcontents.getDefinition() %> </textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="linkurl">linkurl</label>
                  <div class="col-sm-11"> 
                  <input type="text" class="form-control" placeholder="" name="linkurl" value="<%= examcontents.getLinkurl() %>">
                  </div>
                </div>
                

				<%
					String userID = null;
					if(session.getAttribute("userID") !=null ){
					    userID = (String) session.getAttribute("userID");
					}
					if(userID !=null && userID.equals("cms")){
				%>                
                <div class="form-group"> 
                   <div class="col-sm-offset-1 col-sm-11">
                     <input type="submit" class="btn btn-primary pull-right" value="수정">
                   </div>
                </div>   
                <% } %>
                
                <a href="contentsList.jsp?type=<%=examcontents.getExamcode() %>" class="btn btn-primary btn-sm pull-right"> 목록</a>
            </form>
            </div>
            </div>
        </div>
    </div>
</body>
</html>