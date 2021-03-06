<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<title>CMS</title>
</head>
<body>
<% 
    String userID = null;
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
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
            <li><a href="select.jsp">문제DB</a></li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false"> 자료DB  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                     <li><a href="contentsList.jsp?type=B001"> 정보보안기사 </a></li>
                     <li><a href="contentsList.jsp?type=A001"> 정보처리기술사 </a></li>
                     <li><a href="contentsList.jsp?type=A001"> 감리사 </a></li>
                </ul>
            </li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false"> 정보처리기술사 랜덤 출제  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                     <li><a href="#"> 1교시 </a></li>
                     <li><a href="#"> 2교시 </a></li>
                </ul>
            </li>
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false"> 기타  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                     <li><a href="#"> 게시판 </a></li>
                     <li><a href="#"> ..  </a></li>
                </ul>
            </li>
        </ul>
        <form class="navbar-form navbar-left">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="내용을 입력하세요.">
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
        <li class="dropdown">
            <a href="#" class="dropdown-toggle"
            data-toggle ="dropdown" role="button" aria-haspopup="true"
            aria-expanded="false">회원관리<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </li>
    </ul>
    <%
        }
    %>
    </div>
</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbortron" style="padding-top:20px;">
				<form method="post" action="joinAction.jsp" enctype="multipart/form-data">
					<h3 style="text-align; center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					
					<!-- <div class="form-group">
						<input type="file" name="file"><br>
					</div> -->
					
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>