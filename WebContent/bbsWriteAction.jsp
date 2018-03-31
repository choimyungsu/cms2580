<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="com.bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbstitle" />
<jsp:setProperty name="bbs" property="bbscontent" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
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
			}else{
				
				if(bbs.getBbstitle() == null || bbs.getBbscontent() == null ) {
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.write(bbs.getBbstitle(),userID,bbs.getBbscontent());
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");					
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href ='bbs.jsp' ");
						script.println("</script>");
					}
				}
			}
	
	
	%>
	
</body>
</html>