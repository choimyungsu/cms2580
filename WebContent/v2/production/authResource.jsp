<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.file.Linkfile" %>
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.auth.AclDAO" %>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">



<title>권한-리소스패핑</title>

 <!-- jQuery -->
 <script src="../vendors/jquery/dist/jquery.min.js"></script>
 <!-- Bootstrap -->
 <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- TOAST UI 적용  2019.01.03 CDN 적용 start 위치 중요!! jquery 밑으로.. -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.3.3/backbone.js"></script>
<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<% 

    int pageNumber = 1;
    if(request.getParameter("pageNumber") !=null){
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    
    String searchUserID = null;
    if(request.getParameter("searchUserID") !=null){
        searchUserID = request.getParameter("searchUserID");
    }else{
        searchUserID = (String) session.getAttribute("userID"); // 찾는 사용자가 없을 경우 세션아이디로 찾음
    }
    
    if((String) session.getAttribute("userID") == null){ // 세션아이디가 없으면 메인페이지로 돌려보냄.
        
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert(' 로그인을 하세요.')");
        script.println("parent.location.href = 'index.jsp'");
        script.println("</script>");
    }
    
    UserDAO userDAO = new UserDAO();
    User user = new User();
    
    
    String authCd = "ADMIN"; //AUTH_CD 초기값
    
    if(request.getParameter("authCd") !=null){
    	authCd = request.getParameter("authCd"); //AUTH_CD
    }
    

%>

    <script type="text/javascript">
      
      
    function fn_add(){
        grid.appendRow();
    }

    function fn_remove(){
        grid.removeCheckedRows();
    }
    
    function fn_copy(){
        var rowData = grid.getCheckedRows();
        grid.appendRow(rowData,{at:rowData.rowKey+1});
    }
    
    function fn_save(){ 
         if(grid.isModified()){
              grid.checkAll();
              grid.use('Net', {
                    //perPage: 3,
                   // modifyDataMethod: 'POST',
                    api: {
                        
                        createData: './AuditHistoryServlet?userID=<%=searchUserID%>',
                        updateData: './AuditHistoryServlet',
                        modifyData: './AuditHistoryServlet?userID=<%=searchUserID%>', // 서블릿으로 변경
                        deleteData: './AuditHistoryServlet'
                    }
                });
              
                var net = grid.getAddOn('Net');
                
                net.request('modifyData');

         }else{
             alert("변경된데이터가 없습니다.");
         }

    }
    

    
    var openWin;
    
    function add_resource(){
        openWin =  window.open("./addResource.jsp?authcd=<%= authCd %>","childForm", "width=650, height=800, resizable = yes, scrollbars = yes" );
    }
      
    </script>
</head>
<body>



<div id="exTab1" class="container-fluid"> 



            

              
                   <br>
                   <% 
                       String jsonString = new AclDAO().getListJSON(authCd);
                   %>
                   
                   <div id="grid"></div>
                   
                   <br>
    
                   
                   <input type="button"  onclick="fn_remove()" class="btn btn-primary btn-sm" value="행삭제">
                   <input type="button"  onclick="add_resource()" class="btn btn-primary btn-sm " value="리소스 추가">
                   <input type="button"  onclick="fn_save()" class="btn btn-primary btn-sm pull-right" value="저장">


         
           
  </div> <!-- exTab1 끝 -->



<script type="text/javascript">

var grid = new tui.Grid({
    el: $('#grid'),
    scrollX: false,
    scrollY: false,
    rowHeaders: ['checkbox'],//체크박스 추가
    columns: [
        {
            title: '리소스ID',
            name: 'RESOURCE_CD',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            editOptions: {
                type: 'text',
                useViewMode: true
            }
        },
        {
            title: '리소스명',
            name: 'RESOURCE_NM',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
                ev.stop();
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: true
            }
        },
        {
            title: '사용여부',
            name: 'USE_YN',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                ],
                useViewMode: true
            }
        },
        {
            title: 'Create',
            name: 'CREATE_YN',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                ],
                useViewMode: true
            }
        },
        {
            title: 'Read',
            name: 'READ_YN',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                ],
                useViewMode: true
            }
        },
        {
            title: 'Update',
            name: 'UPDATE_YN',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                ],
                useViewMode: true
            }
        },
        {
            title: 'Delete',
            name: 'DELETE_YN',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                ],
                useViewMode: true
            }
        },
        {
            title: 'Print',
            name: 'PRINT_YN',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                ],
                useViewMode: true
            }
        }
    ]
});

var json = <%= jsonString  %> ; //  gridData 값만 추출이 필요함.
grid.setData(json.gridData); // 값만 추출하기


  
</script>

</body>
</html>