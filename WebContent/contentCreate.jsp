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
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<title> </title>
<% 
String bookId = "";// 
if(request.getParameter("bookId")!=null && request.getParameter("bookId")!=""){
    bookId = request.getParameter("bookId");
}
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

	<div class="container">
    <h1>content</h1>
    <form method="POST" class="post-form" action="contentCreateAction.jsp">
        <p><label for="id_title">Title:</label> <input type="text" name="title" class="form-control" width="50" placeholder="목차 제목을 입력해주세요." maxlength="200" required id="id_title" /></p>
        <p><label for="id_url">Url:</label> <input type="text" name="contentsImgUrl" class="form-control" width="50" placeholder="대표 이미지 URL을 입력해주세요." alt="class=&quot;img-responsive&quot;" maxlength="500" id="id_url" /></p>
		<p><label for="id_text">Description:</label> <textarea id="summernote" name="text"  class="form-control" required id="id_text"></textarea></p>
		<input type='hidden' name="bookId"  value="<%=bookId%>"/>
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
    
</div>

    <script>
    $(document).ready(function() {
        $('#summernote').summernote({height: 300});
        
    });
  </script>
  
</body>
</html>