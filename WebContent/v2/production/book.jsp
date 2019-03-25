<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.book.BookDAO" %>  
<%@ page import="com.book.Book" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Book </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3> Book </h3>
              </div>
              <form  action="bookSearch.jsp" method="post">
              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    
                    <input type="text" class="form-control" placeholder="Search for..." name="search">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" onclick="bookSearch()">Go!</button>
                    </span>
                    
                  </div>
                </div>
              </div>
              </form>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Book Gallery </h2>
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




 <%
    BookDAO bookDAO = new BookDAO();
    Util util = new Util();
    ArrayList<Book> list = bookDAO.searchBookList("");//""
    for(int i =0 ; i < list.size(); i++){
%> 

                      <div class="col-md-55"> <!-- col-md-55 -->
                        <div class="thumbnail">
                          <div class="image view view-first">
                            <%=  list.get(i).getMainImgUrl() %>
                            <div class="mask">
                              <a href="bookDetail.jsp?bookId=<%=  list.get(i).getId() %>"><p><%=  list.get(i).getTitle() %></p></a>
                              <div class="tools tools-bottom">
                                <a href="bookDetail.jsp?bookId=<%=  list.get(i).getId() %>"><i class="fa fa-link"></i></a>
                                <a href="../../bookUpdate.jsp?bookId=<%=  list.get(i).getId() %>"><i class="fa fa-pencil"></i></a>
                                <a href="#"><i class="fa fa-times"></i></a>
                              </div>
                            </div>
                          </div>
                          <div class="caption">
                            <a href="bookDetail.jsp?bookId=<%=  list.get(i).getId() %>"><p><%=  list.get(i).getDescription() %></p></a>
                            <p> by <%=list.get(i).getAuthor()  %></p>
                          </div>
                        </div>
                      </div>
                      
<%
    }
%>              
            <div class="col-md-55"> <!-- col-md-55 -->
                        <div class="thumbnail">
                          <div class="image view view-first">
                            <img src="../../img/add_book.png" alt="" class="img-responsive" style="width:100%; height:100%; object-fit: contain;"/>
                            <div class="mask">
                              <a href="../../bookCreate.jsp"><p>새책 만들기 </p></a>
                              <div class="tools tools-bottom">
                                <a href="../../bookCreate.jsp"><i class="fa fa-link"></i></a>
                                <a href="../../bookCreate.jsp"><i class="fa fa-pencil"></i></a>
                                <a href="#"><i class="fa fa-times"></i></a>
                              </div>
                            </div>
                          </div>
                          <div class="caption">
                            <a href="../../bookCreate.jsp"><p>새책 만들기</p></a>
                            <p> by ...</p>
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
    
    
    
    <script>
    function bookSearch(){
    	location.href ="bookSearch.jsp";
    }
    </script>
    
  </body>
</html>