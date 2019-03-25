<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.bbs.BbsDAO" %>
<%@ page import="com.bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="ko">

  <head>
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
                <h3> 공지사항 </h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

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




						<% 
						    int pageNumber = 1;
						    if(request.getParameter("pageNumber") !=null){
						        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						    }
						    
						%>
						    <div class="container">
						        <div class="row">
						            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						                <thead>
						                    <tr>
						                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
						                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
						                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
						                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
						                    </tr>
						                </thead>
						                <tbody>
						                
						                <%
						                    BbsDAO bbsDAO = new BbsDAO();
						                    ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						                    for(int i =0 ; i < list.size(); i++){
						                %>
						                    <tr>
						                        <td><%= list.get(i).getBbsid() %></td>
						                        <td><a href ="../../bbsView.jsp?bbsID=<%= list.get(i).getBbsid() %>"><%= list.get(i).getBbstitle() %></a> </td>
						                        <td><%= list.get(i).getUserid() %></td>
						                        <td><%= list.get(i).getBbsdate().substring(0,11) + list.get(i).getBbsdate().substring(11,13) + "시" +list.get(i).getBbsdate().substring(14,16)+"분 "  %></td>
						                    </tr>
						                    <%
						                    
						                    }
						                        
						                    %>
						                </tbody>
						            </table>
						            <%
						                if(pageNumber !=1){
						            %>
						                <a href = "bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
						            <%
						                }   if(bbsDAO.nextPage(pageNumber + 1)) {
						            %>
						                <a href = "bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
						            <%
						                }
						            %>
						        <a href="bbsWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
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
  </body>
</html>