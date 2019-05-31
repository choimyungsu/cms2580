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
	
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
	    <!-- Bootstrap -->
	    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Font Awesome -->
	    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	    <!-- NProgress -->
	    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
	    
        <!-- timeline -->
        <link rel="stylesheet" type="text/css" href="../vendors/timeline/style.css">
        <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        
        <!-- Custom styling plus plugins -->
        <link href="../build/css/custom.min.css" rel="stylesheet">
        
        
    </head>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      
       <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">

            <div class="row">
            


        <div class="timeLine">
            <div class="row">
                <div class="lineHeader hidden-sm hidden-xs"></div>
                <div class="lineFooter hidden-sm hidden-xs"></div>

                    <!-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item" >
                        <div class="caption">
                            <div class="star center-block">
                                <span class="h3">27</span>
                                <span>Jan</span>
                                <span>1990</span>
                            </div>
                            <div class="image">
                                <img src="https://picsum.photos/600/400/?random">
                                <div class="title">
                                    <h2>집을 아름답게꾸미는 최상의 장식은 집을 자주 찾아오는 친구들이다. <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h2>
                                </div>
                            </div>
                            <div class="textContent">
                                <p class="lead">Hi, this is my very short history, lets start from my berthday that was in 27 of January 1990. I thing my feet was bigger than this because now i just can buy shoes with size 45 LOL.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item">
                        <div class="caption">
                            <div class="star center-block">
                                <span class="h3">15</span>
                                <span>Sep</span>
                                <span>2007</span>
                            </div>
                            <div class="image">
                                <img src="https://picsum.photos/600/401/?random">
                                <div class="title">
                                    <h2>School Study <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h2>
                                </div>
                            </div>
                            <div class="textContent">
                                <p class="lead">I have studied for 12 years until i complete school then i was ready for joining university. i sufferd really but i dont know why!! may be i don't like studing in the past.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item">
                        <div class="caption">
                            <div class="star center-block">
                                <span class="h3">18</span>
                                <span>Aug</span>
                                <span>2011</span>
                            </div>
                            <div class="image">
                                <img src="https://picsum.photos/601/400/?random">
                                <div class="title">
                                    <h2>University <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h2>
                                </div>
                            </div>
                            <div class="textContent">
                                <p class="lead">University was the level that i didn't feel it, it just 4 years passed through like a wink.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item">
                        <div class="caption">
                            <div class="star center-block">
                                <span class="h3">01</span>
                                <span>May</span>
                                <span>2012</span>
                            </div>
                            <div class="image">
                                <img src="https://picsum.photos/603/400/?random">
                                <div class="title">
                                    <h2>Work field <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h2>
                                </div>
                            </div>
                            <div class="textContent">
                                <p class="lead">For 2 years of work as support engineer responsible about installing and maintenance SWIFT packages for banks. I gain a lot from it before i leave country.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item">
                        <div class="caption">
                            <div class="star center-block">
                                <span class="h3">14</span>
                                <span>Apr</span>
                                <span>2015</span>
                            </div>
                            <div class="image">
                                <img src="https://picsum.photos/600/403/?random">
                                <div class="title">
                                    <h2>Refugee <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h2>
                                </div>
                            </div>
                            <div class="textContent">
                                <p class="lead">Since then i came to Austria as refugee far from my lovers and friends far a way escaping from wars and threats searching a new life that i didn't find until yet.</p>
                            </div>
                        </div>
                    </div> -->
                    
                    
                    <% 
                     
                    ContentDAO contentDAO = new ContentDAO();
                    ArrayList<Content> list = contentDAO.searchContentsNoLinkBook();//"" 
                    
                    for(int i =0 ; i < list.size(); i++){
                    
                    %>
                    
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 item">
                        <div class="caption">
                            <div class="star center-block">
                                <% if (list.get(i).gettdate()!=null && list.get(i).gettdate().length()>9){  %>
                                <span class="h3"><%=list.get(i).gettdate().substring(8) %></span>
                                <br>
                                <span><%=list.get(i).gettdate().substring(5, 7) %></span>
                                <br>
                                <span><%=list.get(i).gettdate().substring(0, 4) %></span>
                                <%}else{ %>
                                <span class="h3">Day</span>
                                <span>Month</span>
                                <span>Year</span>
                                
                                <%} %>
                            </div>
                            <div class="image">
                                <img src="https://picsum.photos/60<%= (int)(Math.random()*10) %>/40<%= (int)(Math.random()*10) %>/?random">
                                <div class="title">
                                    <span><%=list.get(i).getTitle() %> &nbsp;<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span>
                                </div>
                            </div>
                            <div class="textContent">
                                <p class="lead"><%=list.get(i).getText() %></p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <%} %>
                   

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
    <!-- timeline -->
    <script src="../vendors/timeline/timeLine.js"></script>
    <script src="../vendors/timeline/script.js"></script>

    </body>
</html>
