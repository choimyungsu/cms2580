<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 로그인 </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
  
  <% 
    String userID = null;
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어 있습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }
%>
  
  
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form method="post" action="../../loginAction.jsp">
              <h1>로그인</h1>
              <div>
                <input type="text" class="form-control" placeholder="ID" name="userid" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password"  name="password"  required="" />
              </div>
              <div>
               <input type="submit" class="btn btn-primary" value="Log in">
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> cms </h1>
                  <p>©2019 All Rights Reserved. </p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form method="post" action="../../joinAction.jsp" enctype="multipart/form-data">
              <h1>회원 가입</h1>
              <div>
                <input type="text" class="form-control" placeholder="ID" name="userID" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" name="userPassword" required="" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Username" name="userName" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" name="userEmail" required="" />
              </div>
              <div>
                <!-- <a class="btn btn-default submit" href="index.html">Submit</a> -->
                <input type="submit" class="btn btn-primary form-control" value="Submit">
              </div>

              <div class="clearfix"></div>
              
              <div class="separator">
              
              
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                  <a href="index.jsp" class="to_register"> Go HomePage! </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> cms </h1>
                  <p>©2019 All Rights Reserved. </p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>

