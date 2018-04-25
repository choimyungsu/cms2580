<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.file.Linkfile" %>    
<% 
    String userID = null;
    String userImg = "default.png";
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
        
        //user 테이블에서 해당 사용자 이미지 가져오기
        UserDAO userDAO = new UserDAO();
        Linkfile fileDTO = userDAO.getFileInformation("user",userID);//
        if(fileDTO != null){
            if( fileDTO.getRealfilename() !=null ){
                   userImg = fileDTO.getRealfilename();
            }
        }
        
    }
%>

<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="main.jsp">CMS</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="select.jsp">기출문제DB</a></li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false"> 학습자료DB  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                     <li><a href="contentsList.jsp?type=B001"> 정보보안기사 </a></li>
                     <li><a href="contentsList.jsp?type=A001"> 정보처리기술사 </a></li>
                     <li><a href="contentsList.jsp?type=B002"> DAP </a></li>
                </ul>
            </li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false"> 정보처리기술사 랜덤 출제  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                     <li><a href="gisulsaExamList.jsp?period=1"> 1교시형</a></li>
                     <li><a href="gisulsaExamList.jsp?period=2"> 2교시형</a></li>
                </ul>
            </li>
            <li><a href="stickyNote.jsp">오늘의 Topic</a></li>
            <li><a href="calendar.jsp">시험 일정</a></li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false"> 기타  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                     <li><a href="bbs.jsp"> 게시판 </a></li>
                     <li><a href="#"> ..  </a></li>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-left" action="searchExamlist.jsp" method="post">
            <div class="form-group">
                <input type="text" class="form-control" id="search" name="search" placeholder="내용을 입력하세요.">
            </div>
            <button type="submit" class="btn btn-default"  onclick="search();">검색</button>
        </form>
    <%
        if(userID == null){
    %>
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle ="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">접속하기<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="login.jsp">로그인</a></li>
                <li class="active"><a href="join.jsp">회원가입</a></li>
            </ul>
        </li>
    </ul>
    <%
        }else{
    %>
    <ul class="nav navbar-nav navbar-right">
        <li>
              <img class="img-circle" src="userImages/<%= userImg %>" width="40" height="45" alt="사진">
        </li>
        <li class="dropdown">
              
            <a href="#" class="dropdown-toggle"
            data-toggle ="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false"> <%= userID%> 님 <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="logoutAction.jsp">로그아웃</a></li>
    <%
        if(userID.equals("cms")){
    %>                
                 <li><a href="userList.jsp">회원보기</a></li>
                 
     <% 
         } 
     %>
                
            </ul>
        </li>
    </ul>
    <%
        }
    %>
    </div>
</nav>