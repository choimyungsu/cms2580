<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.InitialContext, javax.naming.Context, java.util.List" %>
<%@ page import="com.excel.ExamlistExcelReader, com.exam.Examlist, com.exam.ExamlistDAO" %>
</head>
<body>
<%
    

String  uploadType="B";//A는 기술사, B는 기사
if(request.getParameter("uploadType") != null) {
    uploadType = request.getParameter("uploadType");
}
    
    ExamlistExcelReader excelReader = new ExamlistExcelReader();
    /*
    System.out.println("*****xls*****"); // 
    List<Examlist> xlsList = excelReader.xlsToCustomerVoList("C:\\excel\\test.xls");
    util.printList(xlsList );
    */
    System.out.println("*****xlsx  *****");
    System.out.println("*****realpath  *****"+ request.getSession().getServletContext().getRealPath("/"));
    //List<Examlist> xlsxList = excelReader.xlsxToExamMasterList("/home/hosting_users/cms2580/www/excel/boangisa3.xlsx");// cafe24 서버 올리기 주소
    
    List<Examlist> xlsxList;
    
    if(uploadType.equals("A")){
         xlsxList = excelReader.xlsxToDBgisulsaExamList("C:\\excel\\gisulsaxlsx2.xlsx");// 
    }else{
         xlsxList = excelReader.xlsxToDBgisaExamList("/home/hosting_users/cms2580/www/excel/9nits1804.xlsx");// 
    }
    
    ExamlistDAO examlistDAO = new ExamlistDAO();
    
    for(int i =0 ; i < xlsxList.size(); i++){
         
        if(uploadType.equals("A")){
            examlistDAO.insertGisulsa( xlsxList.get(i).getExamcode(), xlsxList.get(i).getTurn() , xlsxList.get(i).getDomain(),  xlsxList.get(i).getPeriod(),  xlsxList.get(i).getExamdesc() );
        }else{
            examlistDAO.insertGisa( xlsxList.get(i).getExamcode(), xlsxList.get(i).getTurn(), xlsxList.get(i).getDomain(), xlsxList.get(i).getExamnum(), xlsxList.get(i).getExamdesc(), xlsxList.get(i).getAnswer()) ;
        }
    }
    
    out.println("정상적으로 업로드 하였습니다.");

    
%>

</body>
</html>

