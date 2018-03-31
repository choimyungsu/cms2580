<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.bbs.Bbs" %>
<%@ page import="com.bbs.BbsDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>CMS</title>
</head>
<body>

<jsp:include page="header.jsp" flush="true" />

<% 
	String userID = null;
	//String userImg = "default.png";
	if(session.getAttribute("userID") !=null ){
	    userID = (String) session.getAttribute("userID");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(' 유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
		
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
	
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2"><%= bbs.getBbstitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= bbs.getUserid() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%= bbs.getBbsdate().substring(0,11) + bbs.getBbsdate().substring(11,13) + "시" +bbs.getBbsdate().substring(14,16)+"분 "  %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="min-height:200px; text-align: left;"><%= bbs.getBbscontent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n", "<br>") %></td>
						</tr>
					</tbody>
					
				</table>
				<a href="bbs.jsp" class="btn btn-primary">목록</a>
				
				<%
					if(userID !=null && userID.equals(bbs.getUserid())){
				%>
						<a href="bbsUpdate.jsp?bbsID=<%= bbsID %>" class="btn btn-primary"> 수정 </a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="bbsDeleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary"> 삭제 </a>
				<%
					}
				%>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</div>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>