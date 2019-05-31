<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.visit.VisitDAO" %>
<%@ page import="com.file.Linkfile" %>  
<%@ page import="java.util.*, java.text.*"  %>  
<% 
    String userID = null;
    String userImg = "default.png";
    Integer userCount = 0;
    UserDAO userDAO = new UserDAO();
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
        
        //user 테이블에서 해당 사용자 이미지 가져오기
        
        Linkfile fileDTO = userDAO.getFileInformation("user",userID);//
        if(fileDTO != null){
            if( fileDTO.getRealfilename() !=null ){
                   userImg = fileDTO.getRealfilename();
            }
        }
    }
    userCount = userDAO.userCount();
    
    
    //오늘 방문자수 구하기
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
	VisitDAO visitDAO = new VisitDAO();
	String VisitCount = visitDAO.visitCount(today);

%>
    
    
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>CMS</span></a>
            </div>

            <div class="clearfix"></div>

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>MENU</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="bbs.jsp">공지사항</a></li>
                      <li><a href="stickyNote.jsp">오늘의 토픽</a></li>
                      <li><a href="https://cafe.naver.com/ictbox" target="_blank">원본자료 Cafe</a></li>
                      <li><a href="https://cms2580.tistory.com" target="_blank">보안블로그</a></li>
                    </ul>
                  </li>

                  
                  <li><a href="select2.jsp"><i class="fa fa-database"></i> 기출문제</a>
                  <li><a href="select3.jsp"><i class="fa fa-random"></i> 모의고사(랜덤)</a>
                  <li><a href="timeline.jsp"><i class="fa fa-image"></i> 긍정의 한줄</a>
                  <li><a href="book.jsp"><i class="fa fa-book"></i> Book</a>
                  <li><a href="calendar.jsp"><i class="fa fa-calendar"></i>시험일정</a>
                  </li>
                  
                  <li><a><i class="fa fa-edit"></i> IT 기술사 문제출제 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="gisulsaExamList.jsp">1교시형</a></li>
                      <li><a href="gisulsaExamListB.jsp">2교시형</a></li>
                      <li><a href="gisulsaSelect.jsp">맞춤조건형출제</a></li>
                    </ul>
                  </li>
                  
                  <li><a><i class="fa fa-desktop"></i> 동영상 강좌 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#">샘플강좌</a></li>
                    </ul>
                  </li>
                  
                  
                  
                  
                </ul>
              </div>
              
    <%   if(userID!=null && userID.equals("cms")){    %>              
              <div class="menu_section">
                <h3>관리자</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> 관리자 기능 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="noteCreate.jsp">노트 등록</a></li>
                      <li><a href="noteLinkBook.jsp">노트 <->Book 연결</a></li>
                      <li><a href="../../fileUpload.jsp">파일업로드</a></li>
                      <li><a><i class="fa fa-sitemap"></i> 회원 및 권한관리 <span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                        <li><a href="../../userList.jsp">회원 현황</a></li>
	                        <li><a href="acl.jsp">권한-리소스</a></li>
	                        <li><a href="aclUser.jsp">유저-권한</a></li>
	                    </ul>
	                  </li>
                     <!--  <li><a href="acl.jsp">권한관리</a></li> -->
                      <li><a href="word.jsp">IT용어</a></li>
                      <li><a href="chart.jsp">chart</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">회원정보</a></li>
                    </ul>
                  </li>
                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>

    <% } %>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" <%   if(userID != null){%> href="../../logoutAction.jsp" <%}%> >
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
              
              <%
			       if(userID == null){
			  %>
				<li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                접속하기
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="login.jsp"> 로그인</a></li>
                    <li><a href="login.jsp#signup">회원가입</a></li>
                  </ul>
                </li>
			  
			  <% }else{ %>
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <!-- <img src="images/img.jpg" alt=""> -->
                    <img src="../../userImages/<%= userImg %>"  alt="사진">
                    <%= userID%> 
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <!-- <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li> -->
                    <li><a href="../../logoutAction.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
               <% } %>
               <li role="presentation" class="dropdown">
               <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-eye"></i>
                    <span class="badge bg-green"><%=VisitCount %></span>
                  </a>
               </li>
               <li role="presentation" class="dropdown">
               <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-group"></i>
                    <span class="badge bg-green"><%=userCount %></span>
                  </a>
               </li>
                
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->