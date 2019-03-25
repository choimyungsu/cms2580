<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %> 
<%@ page import="com.book.Menu" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="com.common.JsonUtil" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CMS minibook</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width", initial-scale="1">
	    <link rel="stylesheet" href="css/bootstrap.css">
	    <link rel="stylesheet" href="css/custom.css">
	    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        
	    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    <script src="js/bootstrap.js"></script>
	    <!-- Tree grid CDN  -->
	    <script src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.min.js"></script>
	    <script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
        <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

		<% 
		String bookId = "";// 
		if(request.getParameter("bookId")!=null && request.getParameter("bookId")!=""){
			bookId = request.getParameter("bookId");
		}
		String userID = null;
		if(session.getAttribute("userID") !=null ){
		    userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null){
		    PrintWriter script = response.getWriter();
		    script.println("<script>");
		    script.println("alert(' 로그인을 하세요.')");
		    script.println("location.href = 'login.jsp'");
		    script.println("</script>");
		}
		%>
    
 </head>
 <body>
 <jsp:include page="header.jsp" flush="true" />  
        
<div class="container">
    <div class="row" style="margin-top:0;">
        <div class="col-sm-3" style="margin-top:0;overflow-y:auto; border-right:1px solid #BDBDBD">
            <h3 style="text-align:left; margin-top:0;display: inline-block;">
                <a href="/book/1/">Contents</a>
            </h3>
            <a class="js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>                 
            <div class="row">
                <div style="padding-left:20px;padding-right:20px; "> 
                
				 <%
				    BookDAO bookDAO = new BookDAO();
				    Book book = bookDAO.searchBook(bookId);//""
				 
				    ContentDAO contentDAO = new ContentDAO();
				    Util util = new Util();
				    JsonUtil jsonutil = new JsonUtil();
				    ArrayList<Map<String, Object>> list = contentDAO.searchContentsJSON("1");//"book_ID를 넣어주면 된다."
				    
				 
				    String treeMenu = jsonutil.convertorTreeMap(list, "0", "id", "pid", "text", "seq").toString();
				    treeMenu = treeMenu.replaceAll("=",":");
				    System.out.println("treeMenu===>"+treeMenu);
				    
				    
				    
				    for(int i =0 ; i < list.size(); i++){
				%>
                
                    <div class="row">
                        <div class="sidebar" >
                            <a href="contentDetail2.jsp?contentId=<%=i %>&bookId=<%=bookId%>">  </a>   
                        </div>
                    </div>
                    
                  <%
                      } 
                  %>
                  
                </div>
                <div id="tree" class="tui-tree-wrap"></div>
            </div>
            <% if(userID.equals(book.getAuthor())){ %>
            <h3 style="text-align: center;margin-top:0;"><a class="btn btn-default " href="contentCreate.jsp?bookId=<%=bookId %>" >Add Contents</a></h3>
            <% } %>
        </div>
            <div class="page  col-sm-9 " style="border-left:1px solid #BDBDBD; margin-left:-1px" id="load_content" >
            
                <a class="pull-left js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>
                <div class="post">
                    <h4><%=book.getTitle() %></h4>
                    
                    <div class="date">
                        <p><%=book.getCdate() %></p>
                    </div>
                    <% if(book.getMainImgUrl() !=null) {%>
                        <%-- <%=book.getMainImgUrl() %> --%>
                    <% } %>
                    <% if(userID.equals(book.getAuthor())){ %>
                        <a href="bookUpdate.jsp?bookId=<%=bookId%>"><span class="glyphicon glyphicon-pencil"></span>편집</a>&nbsp;&nbsp;
                        <a href="bookDelete.jsp"><span class="glyphicon glyphicon-remove"></span>삭제</a> <-- 주의: Contents도 모두 삭제됩니다!!
                    <% } %>
                </div>
            </div>
        </div>
    </div>
 <script>
 
 var util = {
         addEventListener: function(element, eventName, handler) {
             if (element.addEventListener) {
                 element.addEventListener(eventName, handler, false);
             } else {
                 element.attachEvent('on' + eventName, handler);
             }
         }
     };

     var data = <%=treeMenu%>;

     
     var tree = new tui.Tree('tree', {
         data: data,
         nodeDefaultState: 'opened'
     }).enableFeature('Selectable', {
         selectedClassName: 'tui-tree-selected',
     });

     var selectedBtn = document.getElementById('selectedBtn');
     var deselectedBtn = document.getElementById('deselectedBtn');
     var rootNodeId = tree.getRootNodeId();
     var firstChildId = tree.getChildIds(rootNodeId)[0];
     var selectedValue = document.getElementById('selectedValue');

     tree.on('select', function(eventData) {
         var nodeData = tree.getNodeData(eventData.nodeId);
         selectedValue.value = 'selected : ' + nodeData.text;
     });

     tree.on('deselect', function(eventData) {
         var nodeData = tree.getNodeData(eventData.nodeId);
         selectedValue.value = 'deselected : ' + nodeData.text;
     });

     util.addEventListener(selectedBtn, 'click', function() {
         tree.select(firstChildId);
     });

     util.addEventListener(deselectedBtn, 'click', function() {
         tree.deselect();
     });

     
     
     
     
     
     
/*
     
     드래그 앤 드랍은 주석
     var movedValue = document.getElementById('movedValue');
     
     var tree = new tui.Tree('tree', {
         data: data,
         nodeDefaultState: 'opened'
     }).enableFeature('Draggable', {
         helperClassName: 'tui-tree-drop',
         lineClassName: 'tui-tree-line',
         isSortable: true
     });

     tree.on('move', function(eventData) {
         var msg;

         msg = 'nodeId: ' + eventData.nodeId + '\n';
         msg += 'originalParentId: ' + eventData.originalParentId + '\n';
         msg += 'newParentId: ' + eventData.newParentId + '\n';
         msg += 'index: ' + eventData.index + '\n';

         movedValue.value = msg;
         //alert(movedValue.value);
     });

 */
 
 </script>

    </body>
</html>