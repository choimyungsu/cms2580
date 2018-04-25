<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.ExamcontentsDAO" %>  
<%@ page import="com.exam.Examcontents" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sticky Note</title>
<link  href="http://fonts.googleapis.com/css?family=Reenie+Beanie:regular" rel="stylesheet" type="text/css"> 
<link  href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet" type="text/css"> 
<link  href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css"> 
<link  href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" type="text/css">
<link  href="http://fonts.googleapis.com/earlyaccess/notosanssc.css" rel="stylesheet" type="text/css"> 


<style type="text/css">
*{
  margin:0;
  padding:0;
}
body{
  font-family:arial,sans-serif;
  font-size:90%;
  margin:0em; /* 여백  */
  background:#666;
  color:#fff;
}
h2,p{
  font-size:90%;
  font-weight:normal;
}
ul,li{
  list-style:none;
}
ul{
  overflow:hidden;
  padding:3em;
}
ul li a{
  text-decoration:none;
  color:#000;
  background:#ffc;
  display:block;
  height:15em; /* 포스트잇 높이 */ 
  width:15em;  /* 포스트이 넓이 */
  padding:1em;
  -moz-box-shadow:5px 5px 7px rgba(33,33,33,1);
  -webkit-box-shadow: 5px 5px 7px rgba(33,33,33,.7);
  box-shadow: 5px 5px 7px rgba(33,33,33,.7);
  -moz-transition:-moz-transform .15s linear;
  -o-transition:-o-transform .15s linear;
  -webkit-transition:-webkit-transform .15s linear;
}
ul li{
  margin:1em;
  float:left;
}
ul li h2{
  font-size:120%;
  font-weight:bold;
  padding-bottom:10px;
}
ul li p{
  font-family:"Nanum Pen Script",arial,sans-serif, "Noto Sans SC";/* 글씨체 추가 */
  /*font-family:"Reenie Beanie","Hanna",arial,sans-serif;/* 글씨체 추가 */
  font-size:140%;
}
ul li a{
  -webkit-transform: rotate(-6deg);
  -o-transform: rotate(-6deg);
  -moz-transform:rotate(-6deg);
}
ul li:nth-child(even) a{
  -o-transform:rotate(4deg);
  -webkit-transform:rotate(4deg);
  -moz-transform:rotate(4deg);
  position:relative;
  top:5px;
  background:#cfc;
}
ul li:nth-child(3n) a{
  -o-transform:rotate(-3deg);
  -webkit-transform:rotate(-3deg);
  -moz-transform:rotate(-3deg);
  position:relative;
  top:-5px;
  background:#ccf;
}
ul li:nth-child(5n) a{
  -o-transform:rotate(5deg);
  -webkit-transform:rotate(5deg);
  -moz-transform:rotate(5deg);
  position:relative;
  top:-10px;
}
ul li a:hover,ul li a:focus{
  box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -moz-box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);
  -webkit-transform: scale(1.25);
  -moz-transform: scale(1.25);
  -o-transform: scale(1.25);
  position:relative;
  z-index:5;
}
ol{text-align:center;}
ol li{display:inline;padding-right:1em;}
ol li a{color:#fff;}
</style>
</head>
<body>

  <ul>
   
      <%
          ExamcontentsDAO examcontentsDAO = new ExamcontentsDAO();
          ArrayList<Examcontents> list = examcontentsDAO.searchRandomExamcontents("A001");
          Util util = new Util();
         for(int i =0 ; i < list.size() ; i++){
        	String Linkurl="#";
        	String target="";
        	Boolean imgShow = false;
              if(list.get(i).getLinkurl() !=""){
            	  Linkurl =list.get(i).getLinkurl();
            	  imgShow = true;
            	  target="target=\"_blank\"";
              }
      %>
    <li>   
      <a href="<%= Linkurl%>" <%= target %>>
      <table border="0">
	      <tr><td><h2> <%= list.get(i).getSubject() %></h2></td></tr>
	      <tr><td><p><%= list.get(i).getDefinition() %> </p></td></tr>
	      <tr><td align="right"> <% if(imgShow){ %><img  src="userImages/Link.png" width="20" height="20"> <% } %></td></tr>
      </table>
        <%-- <h2> <%= list.get(i).getSubject() %></h2>
        <!-- <img class="img-circle" src="userImages/OL_Photo (1).jpg" width="60" height="70" alt="사진"> -->
        <p><%= list.get(i).getDefinition() %> </p>
        <img  src="userImages/Link.png" width="30" height="30"> --%>
      </a>
    </li>
    
    <%
    
        } 
    
    %>
    
  </ul>
  
  
</body>
</html>