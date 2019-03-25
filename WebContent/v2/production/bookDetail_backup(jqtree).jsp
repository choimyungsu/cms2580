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
    
    <!-- jqtree -->
    <link rel="stylesheet" href="../vendors/jqtree/jqtree.css">
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">


            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>공지사항 </h2>
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
					                
					                 <%-- <%
					                    BookDAO bookDAO = new BookDAO();
					                    Book book = bookDAO.searchBook(bookId);//""
					                 
					                    ContentDAO contentDAO = new ContentDAO();
					                    Util util = new Util();
					                    ArrayList<Content> list = contentDAO.searchContents(bookId,"");//""
					                    for(int i =0 ; i < list.size(); i++){
					                %>
					                
					                    <div class="row">
					                        <div class="sidebar" >
					                            <a href="contentDetail.jsp?contentId=<%=list.get(i).getId() %>&bookId=<%=bookId%>"> <%=list.get(i).getTitle()  %> (<%=list.get(i).getCnt() %>)</a>   
					                        </div>
					                    </div>
					                    
					                  <%
					                      } 
					                  %> --%>
					                  
					                  <%
                                        BookDAO bookDAO = new BookDAO();
                                        Book book = bookDAO.searchBook(bookId);//""
                                        ContentDAO contentDAO = new ContentDAO();
                                        Util util = new Util();
                                        //ArrayList<Content> list = contentDAO.searchContents(bookId);//""
                                       // Content content = contentDAO.searchContent(contentId);//한건 찾기 
                                        int base=0 ; // 지금 보고있는 기준이 되는 데이터 순서 값 
                                        int pre= 0;  // 이전값
                                        int next=0 ; //이후값
                                        
                                        JsonUtil jsonutil = new JsonUtil();
                                        ArrayList<Map<String, Object>> list = contentDAO.searchContentsJSON(bookId);//"book_ID를 넣어주면 된다."
                                     
                                        String treeMenu = jsonutil.convertorTreeMap(list, "0", "id", "pid", "label", "seq", bookId).toString();
                                        
                                        treeMenu = treeMenu.replaceAll("=",":");
                                        treeMenu = treeMenu.replaceAll("###","=");
                                        
                                        System.out.println("treeMenu===>"+treeMenu);
                                        
                                        
                                 %>
                                    <%-- <div style="padding-left:20px;padding-right:20px; "> 
                                    
                                     <%
                                        BookDAO bookDAO = new BookDAO();
                                        Book book = bookDAO.searchBook(bookId);//""
                                     
                                        ContentDAO contentDAO = new ContentDAO();
                                        Util util = new Util();
                                        ArrayList<Content> list = contentDAO.searchContents(bookId);//""
                                        Content content = contentDAO.searchContent(contentId);//한건 찾기 
                                        
                                         // 조회수 추가  2018.10.19
                                        contentDAO.updateCnt(contentId);
                                        
                                        int base=0 ; // 지금 보고있는 기준이 되는 데이터 순서 값 
                                        int pre= 0;  // 이전값
                                        int next=0 ; //이후값
                                        for(int i =0 ; i < list.size(); i++){
                                         
                                    %>
                                    
                                        <div class="row"   
                                            <% if(contentId.equals(list.get(i).getId().toString())){ 
                                                base = i ; // 현재 보고 있는 데이터의 순서를 가져옴
                                            %> style="background-color:#E0ECF8;" 
                                            <%} %> >
                                            <div class="sidebar" >
                                                <a href="contentDetail.jsp?contentId=<%=list.get(i).getId() %>&bookId=<%=bookId%>"> <%=list.get(i).getTitle()  %></a>   
                                            </div>
                                        </div>
                                        
                                      <%
                                          } 
                                      %>
                                      
                                    </div> --%>
                                    
                                    <div id="tree1"></div>

                                    <ul id="ContextMenu" class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                        <li class="add"><a href="#add"><i class="icon-plus"></i> Add</a></li>
                                        <li class="edit"><a href="#edit"><i class="icon-edit"></i> Edit</a></li>
                                        <li class="divider"></li>
                                        <li class="delete"><a href="#delete"><i class="icon-remove"></i> Delete</a></li>
                                    </ul>
					                  
					                  
					                  
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
    
     <!-- jqtree -->
    <script src="../vendors/jqtree/tree.jquery.js"></script>
    <script src="../vendors/jqtree/jqTreeContextMenu.js"></script>
    
    <script>
$(function () {
    var edt_node = null;

    /* var data = [{
        label: "node1",
        children: [{ label: '<a href="#">child1</a>' },
                   { label: "<a href='#'>child2</a>" }]
    },{
        label: "node2",
        children: [{ label: "<a href='#'>child3</a>"}]
    }, {
        label: "node3"
    }]; */
    
    
    var data = <%=treeMenu%>;

    var $tree = $("#tree1");

    $tree.tree({
        data: data,
        onCreateLi: function(node, $li) {
            // Add 'icon' span before title
            $li.find('.jqtree-title').before('<span class="icon"></span>');
        },
        closedIcon: $('<i class="fa fa-arrow-circle-right"></i>'),
        openedIcon: $('<i class="fa fa-arrow-circle-down"></i>'),
        autoOpen: true,
        autoEscape: false,// html태그 적용
        dragAndDrop: true,
        usecontextmenu: true
    });
    

    $tree.jqTreeContextMenu($("#ContextMenu"), {
        "add": function (node) {
            $tree.tree("appendNode", { label: "new node" }, node);
            $tree.tree("openNode", node);
        },
        "edit": function (node) {
            var $edit = $("#edit_label");
            if(edt_node != node && $edit.size() > 0) {
                var $input = $edit.find("input:text");
                var label = $.trim($input.val());

                updateNodeLabel(edt_node, label);
                $edit.remove();
            }

            edt_node = node;
            var $el = $(node.element);
            $el.find("span.jqtree-title:first").after('<span id="edit_label"><input type="text" name="label" value="'+node.name+'"><button type="button" id="edit_submit">수정</button></span>').hide();
        },
        "delete": function (node) {
            $tree.tree("removeNode", node);
        }
    });

    $(document).on("click", "#edit_submit", function() {
        var $this = $(this);
        var $input = $this.siblings("input:text");
        var label = $.trim($input.val());
        $this.siblings(".jqtree-title").show();
        $("#edit_label").remove();

        updateNodeLabel(edt_node, label);
    });

    function updateNodeLabel(node, label)
    {
        $tree.tree("updateNode", node, label);
        edt_node = null;
    }
});


$('#tree1').on(
        'tree.move',
        function(event) {
            console.log('moved_node', event.move_info.moved_node);
            console.log('target_node', event.move_info.target_node);
            console.log('position', event.move_info.position);
            console.log('previous_parent', event.move_info.previous_parent);
        }
    );
    


</script>
    
  </body>
</html>