<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.book.ContentDAO" %>  
<%@ page import="com.book.Content" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Note </title>

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
                <H3>Catagory</H3>
              </div>
              <form  action="bookSearch.jsp" method="post">
              <div class="title_right">
                <div class="col-md-9 col-sm-9 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    
                    <div class="col-sm-1" >
                                <select id="level1" name="level1" onchange="changeSelect()" class="form-control">
                                    <option value="">1단계</option>
                                    <option value="기타">기타</option>
                                </select>
                             </div>
                             <div class="col-sm-1" >
                                <select id="level2" name="level2" onchange="changeSelect2()" class="form-control">
                                    <option value="" selected="selected">2단계</option>
                                </select>
                            </div>
                             <div class="col-sm-1" >
                                <select id="level3" name="level3" onchange="changeSelect3()" class="form-control">
                                    <option value="all" selected="selected">3단계</option>
                                    <option value="one" >..</option>
                                </select>
                            </div>
                    
                  </div>
                </div>
              </div>
              </form>
            </div>
          
          
            <!-- <div class="page-title">
              <div class="row">

	              <div class="form-group">
	                    <form name="form1" method="post">                                        
	                      <div class="row">
	                         <div class="col-sm-3" >
	                            <select id="level1" name="level1" onchange="changeSelect()" class="form-control">
	                                <option value="">1단계</option>
	                                <option value="기타">기타</option>
	                            </select>
	                         </div>
	                         <div class="col-sm-3" >
	                            <select id="level2" name="level2" onchange="changeSelect2()" class="form-control">
	                                <option value="" selected="selected">2단계</option>
	                            </select>
	                        </div>
	                         <div class="col-sm-3" >
	                            <select id="level3" name="level3" onchange="changeSelect3()" class="form-control">
	                                <option value="all" selected="selected">3단계</option>
	                                <option value="one" >..</option>
	                            </select>
	                        </div>
	                      </div>row 
	                      <input type="hidden" name="examcode">
	                      <input type="hidden" name="turn">
	                      
	                    </form>
	                </div>form-group 
              </div>
              
            </div> -->

            <div class="clearfix"></div>


            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Note</h2>
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

                    
                    
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                    <% 
                     
                    ContentDAO contentDAO = new ContentDAO();
                    ArrayList<Content> list = contentDAO.searchContentsNoLinkBook();//"" 
                    
                    for(int i =0 ; i < list.size(); i++){
                    
                    %>
                      <li data-target="#myCarousel" data-slide-to="<%= i %>" <% if(i==0){ %> class="active" <%}%>></li>
                    
                    <% } %>
                  
                    </ol>
                
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                    <%
                    
                    for(int i =0 ; i < list.size(); i++){
                    
                    %>
                      <div class="item <% if(i==0){ %>active<%}%>">
                      <%=list.get(i).getContentsImgUrl() %>
                        <!-- <img src="../../img/first.jpg" alt="first" style="width:100%;"> -->
                      </div>
                      
                      <% } %>
                    
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                      <span class="sr-only">Next</span>
                    </a>
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
  </body>
</html>