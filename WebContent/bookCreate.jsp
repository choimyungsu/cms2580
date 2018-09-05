<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">


<title> </title>
</head>
<body>
<% 
//세션 확인
        String userID = null;
        if(session.getAttribute("userID") !=null ){
            userID = (String) session.getAttribute("userID");
        }
        if(userID ==null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert(' 로그인을 하세요.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }

%>
<jsp:include page="header.jsp" flush="true" />

	<div class="container">
    <h1>Book</h1>
    <form method="POST" class="post-form" action="bookCreateAction.jsp"><input type='hidden' />
        <p><label for="id_title">Title:</label> <input type="text" name="title" class="form-control" width="50" placeholder="목차 제목을 입력해주세요." maxlength="200" required id="id_title" /></p>
        <p><label for="id_url">Url:</label> <input type="text" name="mainImgUrl" class="form-control" width="50" placeholder="대표 이미지 URL을 입력해주세요."  maxlength="500" id="id_url" /></p>
		<p><label for="id_text">Description:</label> <textarea name="description" cols="40" rows="15" class="form-control" required id="id_text"></textarea></p>
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
    
</div>   

	
</body>
</html>