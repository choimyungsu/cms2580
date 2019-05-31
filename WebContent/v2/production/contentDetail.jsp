<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %> 
<%@ page import="com.book.CommentDAO" %>  
<%@ page import="com.book.Comment" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.common.JsonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.PrintWriter" %>
    

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
        String userID = null;
        if(session.getAttribute("userID") !=null ){
            userID = (String) session.getAttribute("userID");
            
        }
        
        if(userID == null){
            //System.out.println("userID==>"+userID);
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert(' 로그인을 하세요.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
            
        }
        String bookId = "";// 
        if(request.getParameter("bookId")!=null && request.getParameter("bookId")!=""){
            bookId = request.getParameter("bookId");
        }
        
        String contentId= "";//
        if(request.getParameter("contentId")!=null && request.getParameter("contentId")!=""){
            contentId = request.getParameter("contentId");
        }
        
        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.searchBook(bookId);//""
        ContentDAO contentDAO = new ContentDAO();
        Util util = new Util();
        Content content = contentDAO.searchContent(contentId);//한건 찾기 
        String contentListJSON = contentDAO.getContentListJSON(bookId,contentId);//""
    %>
    <script>
    var previousNode
    var nextNode
    var curr
    var tree
    
    function showComment(){//comment 보이도록
        var x = document.getElementById("commentBlock");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
    
    function contentDelete(){
    	if(confirm('정말 삭제하시겠습니까?')){
    		location.href="contentDelete.jsp?contentId=<%=content.getId() %>&bookId=<%=bookId%>";
    	}
    }
    </script>
  
  
  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Content </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/custom.css">
    
    <!-- tree viewer CSS -->
    <link rel="stylesheet" href="../vendors/tree-viewer/tree-viewer.css">
    
    <!-- timeline -->
    <link rel="stylesheet" type="text/css" href="../vendors/timeline/style.css">
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

<style>
/* 이미지를 자동으로 화면에 맞게 리사이즈 되도록 */
img {
    max-width: 100%; /* 이미지의 최대사이즈 */
    width /***/: auto; /* IE8 */
    height: auto;
    vertical-align: bottom;
}
</style>
    
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
              <!-- <div class="col-md-12"> -->
                <!-- <div class="x_panel"> -->
                  <!-- <div class="x_title">
                    <h2>Content Detail </h2>
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
                  </div> -->
                  
                 <div class="x_content"> 

                    <div class="row">

     
                      <!-- <div class="container"> -->
                        <div class="content row" style="margin-top:0;">
                            <div class="col-sm-3" id="leftmenuinner" style="overflow-y:auto; border-right:1px solid #BDBDBD">
                                <h3 style="text-align:left; margin-top:0;display: inline-block;">
                                    <a href="bookDetail.jsp?bookId=<%=bookId%>">Contents</a>
                                </h3>
                                <a class="js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>                 
                                <div class="row">
                                        <!-- 트리 시작   --> <!-- class="form-control" -->
                                        <input type="text" id="plugins4_q" value=""  style="margin:0em 0em 1em 0em; display:inline-block; padding:3px; border-radius:4px; border:1px solid silver;" placeholder="Search" />
                                        
                                        <div id="jstree1"> </div>
                                    
                                </div>
                                <% if(userID.equals(book.getAuthor())){ %>
                                <h3 style="text-align: center;margin-top:0;"><a class="btn btn-default " href="contentCreate.jsp?bookId=<%=bookId %>" >Add Contents</a></h3>
                                <% } %>
                            </div>
                                <div class="page  col-sm-9 " style="border-left:1px solid #BDBDBD; margin-left:-1px" id="load_content" > 
                                
                                
                                
                                
                                
                                    <a class="pull-left js-toolbar-action" aria-label="" onclick="showandhide()" title="메뉴"><i class="fa fa-align-justify"></i></a>
                                    <% if(userID.equals(book.getAuthor())){ %>
                                        <a class="pull-right" href="#"  onclick="contentDelete()" ><span class="glyphicon glyphicon-remove"></span>삭제</a>
                                        
                                        <a class="pull-right" href="contentUpdate.jsp?contentId=<%=content.getId() %>&bookId=<%=bookId%>" ><span class="glyphicon glyphicon-pencil"></span>편집 &nbsp;&nbsp;</a>
                                    <% } %>
                                    <div class="post">
                                        <h4><%=content.getTitle() %></h4>
                                        <div class="date">
                                            <p><%=content.getCDate() %>   조회수 : <%=content.getCnt() %></p>
                                        </div>
                                        <div class="img">
                                        <% if(content.getContentsImgUrl() !=null) {%>
                                            <%= util.imgurlcheck(content.getContentsImgUrl()) %>
                                        <% } %>
                                        </div>
                                        <div class="img"><%=content.getText() %></div>
                                    </div>
                                    <a class="btn btn-default" onclick="showComment()" >Add comment</a>
                                    <div id="commentBlock" style="display: none;">
                                    <form method="POST" class="post-form" action="../../commentCreateAction.jsp">
                                        <p><label for="id_author">Author:</label> <input type="text" name="author" maxlength="200" required id="id_author" /></p>
                                        <p><label for="id_text">Comment:</label> <textarea name="comment" cols="40" rows="2" class="form-control" placeholder="댓글을 입력해주세요." required id="id_text"></textarea></p>
                                        <input type='hidden' name="contentId"  value="<%=content.getId()%>"/>
                                        <input type='hidden' name="bookId"  value="<%=content.getBookId()%>"/>
                                        <button type="submit" class="save btn btn-default">Send</button>
                                    </form>
                                </div>
                                    <hr>
                                    <%
                                        // comment 가져오기 
                                        CommentDAO commentDAO = new CommentDAO();
                                        ArrayList<Comment> list2 = commentDAO.searchComments(content.getId().toString());
                                        for(int i =0 ; i < list2.size(); i++){
                                    %>
                                        <h5><%=list2.get(i).getComment() %> by <%=list2.get(i).getAuthor() %> at <%=list2.get(i).getcDate() %>         
                                           <!--  <a href="">승인</a> -->
                                            <a href="../../commentDelete.jsp?commentId=<%=list2.get(i).getId()%>&contentId=<%=content.getId() %>&bookId=<%=bookId%>">삭제</a>
                                        </h5> 
                                    
                                    <%
                                        }
                                    %> 
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
                                
                                
                                
                            </div>
                        </div> 

                      
                      
                    



                    <!-- </div> -->
                  </div>
                <!-- </div> -->
              <!-- </div> -->
            </div> 
          </div> 
          

                        
                        
                        <div style="" class="prev_next_indicator">
                        
                        <prev_icon class="prev_icon"   role="button"><span class="glyphicon glyphicon-chevron-left" style="font-size:2em;"></span></prev_icon>
                        <next_icon class="next_icon"   role="button"><span class="glyphicon glyphicon-chevron-right" style="font-size:2em;"></span></next_icon>
                        
                           <!-- <a class="prev_icon"   role="button" >
                              <span class="glyphicon glyphicon-chevron-left" style="font-size:2em;"></span>
                           </a>  
                               
                           <a class="next_icon"  role="button" >  onclick="getNextNode()"
                               <span class="glyphicon glyphicon-chevron-right" style="font-size:2em;"></span>
                           </a>  -->               
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
    
    <!-- Tree Viewer JS -->
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
                     /* "dnd", */ "search",
                     "types","wholerow","ui"
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
  
                  //alert( data.node.text);
                }); 
                
                // 링크 처리
                $('#jstree1').bind("select_node.jstree", function (e, data) {
                	
                    var href = data.node.a_attr.href;
                    window.location.href = href;
                });
               
                
                // 8 interact with the tree - either way is OK
                /*
                 $('button').on('click', function (e, data) {
                    //alert( data.node.text);
                     
                    
                  $('#jstree1').jstree(true).select_node('child_node_1');
                  $('#jstree1').jstree('select_node', 'child_node_1');
                  $.jstree.reference('#jstree1').select_node('child_node_1');
                }); 
                 */

                // 앞으로  이동  
                $ ("prev_icon").click (function () {
	                var tree = $ ('#jstree1').jstree (true)
	                curr = tree.get_selected (false);
	                tree.deselect_all ();
	                tree.open_all ();
	                var n = tree.get_prev_dom (curr);
	                tree.select_node (n);
                });
                 
			     // 뒤로 이동
                 $ ("next_icon").click (function () {
                     var tree = $ ('#jstree1').jstree (true)
                     curr = tree.get_selected (false);
                     tree.deselect_all ();
                     tree.open_all ();
                     var n = tree.get_next_dom (curr);
                     tree.select_node (n);
                 }); 
                
                 /*  
                $('#jstree1').bind("move_node.jstree", function (e, data) {
                            //data.rslt.o.each(function (i) {
                                $.ajax({
                                    async : false,
                                    type: 'POST',
                                    url: "contentUpdate.jsp",
                                    data : {
                                        "operation" : "move_node",
                                        "id" : $(this).attr("id").replace("node_",""),
                                        "ref" : data.rslt.cr === -1 ? 1 : data.rslt.np.attr("id").replace("node_",""),
                                        "position" : data.rslt.cp + i,
                                        "title" : data.rslt.name,
                                        "copy" : data.rslt.cy ? 1 : 0
                                    },
                                    success : function (r) {
                                        if(!r.status) {
                                            $.jstree.rollback(data.rlbk);
                                        }
                                        else {
                                            $(data.rslt.oc).attr("id", "node_" + r.id);
                                            if(data.rslt.cy && $(data.rslt.oc).children("UL").length) {
                                                data.inst.refresh(data.inst._get_parent(data.rslt.oc));
                                            }
                                        }
                                        $("#analyze").click();
                                    }
                                });
                           // });
                        });
                 */
                
        
              });
            
           // $('#tree').on("select_node.jstree", function (e, data) { alert("node_id: " + data.node.id); });
            

           
             <%if( content.getTitle() !=null && content.getTitle().length()>0 ){ %>              // 검색결과 찾기 
               
                /*************************
                                       초기값 찾아서 검색값으로 넣고 조회하기
                **************************/
                
                <%-- $('#plugins4_q').val('<%=content.getTitle()%>');
                setTimeout(function () {
                    var v = $('#plugins4_q').val();
                    $('#jstree1').jstree(true).search(v);
                  }, 1000); --%>
                
                
             <%}%>
             
             

</script>
                     
    
    
  </body>
</html>