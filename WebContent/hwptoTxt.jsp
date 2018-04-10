<html>
<head>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.InitialContext, javax.naming.Context, java.util.List" %>
<%@ page import="com.excel.ExamlistExcelReader" %>
</head>
<body>
<%

    
    ExamlistExcelReader excelReader = new ExamlistExcelReader();

    System.out.println("*****hwp  *****");
    System.out.println("*****realpath  *****"+ request.getSession().getServletContext().getRealPath("/"));
    
    
    excelReader.hwpToTxt("c:\\hwp\\linux1709.hwp", "c:\\hwp\\linux1709.txt");// 
    

    out.println("변환에 성공하였습니다.");

    
%>

</body>
</html>

