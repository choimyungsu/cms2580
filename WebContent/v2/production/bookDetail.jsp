<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.common.JsonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
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
  
  
  
  
  
  
  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 공지사항 </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    <!-- tree viewer CSS -->
    <link rel="stylesheet" href="../vendors/tree-viewer/tree-viewer.css">
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />

        <%
          BookDAO bookDAO = new BookDAO();
          Book book = bookDAO.searchBook(bookId);//""
          ContentDAO contentDAO = new ContentDAO();
          Util util = new Util();
          String contentListJSON = contentDAO.getContentListJSON(bookId,"");//""
       %>


        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><%=book.getTitle() %> </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">

                    <div class="row">




                       <div class="container">
					    <div class="row" style="margin-top:0;">
					        <div class="col-sm-3" id="leftmenuinner" style="margin-top:0;overflow-y:auto; border-right:1px solid #BDBDBD">
					            <h3 style="text-align:left; margin-top:0;display: inline-block;">
					                <a href="#">Contents</a>
					            </h3>
					            <a class="js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>                 
					            <div class="row">
					                <div style="padding-left:20px;padding-right:20px; "> 
					                
					                    <input type="text" id="plugins4_q" value="" class="form-control" style="margin:0em 0em 1em 0em; display:inline-block; padding:3px; border-radius:4px; border:1px solid silver;" placeholder="Search"/>
                                        <div id="jstree1"> </div>
					                  

					                  
					                  
					                </div>
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
					                        <%=book.getMainImgUrl() %>
					                    <% } %>
					                    <% if(userID.equals(book.getAuthor())){ %>
					                        <a href="bookUpdate.jsp?bookId=<%=bookId%>"><span class="glyphicon glyphicon-pencil"></span>편집</a>&nbsp;&nbsp;
					                        <a href="bookDelete.jsp"><span class="glyphicon glyphicon-remove"></span>삭제</a> <-- 주의: Contents도 모두 삭제됩니다!!
					                    <% } %>
					                </div>
					            </div>
					        </div>
					    </div>          
                      

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            cms2580@naver.com
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    
    <script src="../../js/cms.js"></script>
    
    <!-- Tree Viewer JS
        ============================================ -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    
    <script>
    

    /*   $('#jstree1').jstree({ 'core' : {
                'data' : [
                	 { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" ,"a_attr":{"href":"#"} },
                     { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" ,"a_attr":{"href":"index.jsp"} },
                     { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" ,"type":"demo" },
                     { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2","type":"demo"  },
                     { "id" : "ajson5", "parent" : "ajson1", "text" : "Child new"  },
                   
                ]
            } });  */


          $(function () {
                // 6 create an instance when the DOM is ready
                $('#jstree1').jstree({ 'core' : {
                    
                    "animation" : 0,
                    "check_callback" : true,
                    'data' : [
                    	<%=contentListJSON%>
                        
                     ]
                 },
                 "types" : {
                     "default" : {
                       "icon" : "glyphicon glyphicon-ok"
                     },
                     "demo" : {
                       "icon" : "glyphicon glyphicon-flash"
                     }
                   },
                "plugins" : [
                    "contextmenu", "dnd", "search",
                     "types"
                  ]
                
                });
                // 검색결과 찾기 
                var to = false;
                $('#plugins4_q').keyup(function () {
                  if(to) { clearTimeout(to); }
                  to = setTimeout(function () {
                    var v = $('#plugins4_q').val();
                    $('#jstree1').jstree(true).search(v);
                  }, 250);
                });
               
                
                
                // 7 bind to events triggered on the tree
                $('#jstree1').on("changed.jstree", function (e, data) {
                  console.log(data.selected);
                }); 
                
                // 링크 처리
                $('#jstree1').bind("select_node.jstree", function (e, data) {
                    var href = data.node.a_attr.href;
                    window.location.href = href;
                });
           
                
                // 8 interact with the tree - either way is OK
                $('button').on('click', function () {
                  $('#jstree1').jstree(true).select_node('child_node_1');
                  $('#jstree1').jstree('select_node', 'child_node_1');
                  $.jstree.reference('#jstree1').select_node('child_node_1');
                });
              });
            
           // $('#tree').on("select_node.jstree", function (e, data) { alert("node_id: " + data.node.id); });
            

</script>
    
  </body>
</html>