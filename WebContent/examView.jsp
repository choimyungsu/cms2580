<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %> 
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
String examListID = "";// 시험 종목
if(request.getParameter("examListID")!=null && request.getParameter("examListID")!=""){
	examListID = request.getParameter("examListID");
    //System.out.println("examListID========="+ examListID);
}
%>


<body>
<jsp:include page="header.jsp" flush="true" />

    <div class="container">
        <div class="row">

 <%
    ExamlistDAO examlistDAO = new ExamlistDAO();
    Util util = new Util();
    Examlist examlist = examlistDAO.searchExamListId(examListID);//""
    
    if(util.nullCheck(examlist.getAnswerdesc())){
    	//System.out.println("널이다.");
    }else{
    	//System.out.println("널 아니다.");
    }
  %>
  
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="glyphicon glyphicon-pencil"></span>
                    &nbsp;&nbsp; 문제 상세
                </h3>   
            </div>
            <div class="panel-body">
            <form class="form-horizontal" action="examUpdate.jsp" method="post" target="_blank">
                <div class="form-group">
                  <label class="control-label col-sm-1" for="examListID">examListID</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="examListID" placeholder="고유번호" value="<%= examListID %>">
                  </div>
                  <label class="control-label col-sm-1" for="auditname">코드</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" placeholder="코드" value="<%= examlist.getExamcode() %>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="bizscope">문제</label>
                  <div class="col-sm-11"> 
                  <textarea class="form-control" placeholder="글 내용" name="examDesc" maxlength="2048" style="height: 100px;" > <%= examlist.getExamdesc()%> </textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="seq">출제년도</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" id="year" placeholder="출제년도" value="<%= examlist.getYear() %>">
                  </div>
                  <label class="control-label col-sm-1" for="auditname">회차</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" id="turn" placeholder="회차" value="<%= examlist.getTurn() %>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="seq">문제번호</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" id="examnum" placeholder="고유번호" value="<%= examlist.getExamnum() %>">
                  </div>
                  <label class="control-label col-sm-1" for="auditname">문제보기</label>
                  <div class="col-sm-5"> 
                    <textarea class="form-control" placeholder="글 내용" name="exambogi" id="exambogi"  maxlength="2048" style="height: 100px;" ><%=examlist.getExambogi()  %></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="answer1">지문1</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="answer1" placeholder="지문1" value="<%= examlist.getAnswer1() %>">
                  </div>
                  <label class="control-label col-sm-1" for="answer2">지문2</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" name="answer2" placeholder="지문2" value="<%= examlist.getAnswer2() %>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="answer3">지문3</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="answer3" placeholder="지문3" value="<%= examlist.getAnswer3() %>">
                  </div>
                  <label class="control-label col-sm-1" for="answer4">지문4</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" name="answer4" placeholder="지문4" value="<%= examlist.getAnswer4() %>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="seq">지문5</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="answer5" placeholder="지문5" value="<%= examlist.getAnswer5() %>">
                  </div>
                  <label class="control-label col-sm-1" for="answer">정답</label>
                  <div class="col-sm-5"> 
                    <input type="text" class="form-control" name="answer" placeholder="정답" value="<%= examlist.getAnswer() %>">
                  </div>
                </div> 
                <div class="form-group">
                  <label class="control-label col-sm-1" for="answerDesc">문제해설</label>
                  <div class="col-sm-11"> 
                  <textarea class="form-control" placeholder="글 내용" name="answerDesc" maxlength="2048" style="height: 50px;" > <%= examlist.getAnswerdesc() %> </textarea>
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
                  <label class="control-label col-sm-1" for="examImg">문제이미지</label>
                  <div class="col-sm-11">
                  <textarea class="form-control" placeholder="글 내용" name="examImg" maxlength="2048" style="height: 30px;" > <%= examlist.getExamImg() %> </textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-1" for="answerImg">해설이미지</label>
                  <div class="col-sm-11">
                   <textarea class="form-control" placeholder="글 내용" name="answerImg" maxlength="2048" style="height: 30px;" > <%= examlist.getAnswerImg() %> </textarea> 
                  </div>
                </div>
                
                <div class="form-group"> 
                   <div class="col-sm-offset-1 col-sm-11">
                     <input type="submit" class="btn btn-primary pull-right" value="수정">
                     <%-- <a href="examUpdate.jsp?examListID=<%= examListID %>" class="btn btn-default pull-right"> 수정 </a> --%>
                     <%-- <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="examDelete.jsp?examListID=<%= examListID %>" class="btn btn-default pull-right"> 삭제 </a> --%>
                   </div>
                </div>   
                <% } %>
            </form>
            </div>
            </div>
        </div>
    </div>
</body>
</html>