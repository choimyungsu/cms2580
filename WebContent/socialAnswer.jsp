<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.user.Useranswerdesc" %>
<%@ page import="com.user.UseranswerdescDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<!-- SynaxHighlighter 시작 -->
<script type="text/javascript" src="js/vendor/sh/shCore.js"></script>
<script type="text/javascript" src="js/vendor/sh/shBrushJScript.js"></script>
<script type="text/javascript" src="js/vendor/sh/shBrushJava.js"></script>
<script type="text/javascript" src="js/vendor/sh/shBrushCpp.js"></script>
<link type="text/css" rel="stylesheet" href="css/vendor/sh/shCoreDefault.css"/>
<script type="text/javascript">SyntaxHighlighter.all();</script>



<style>
#myBtn {
  display: none;
  position: fixed;
  top: 60px;
  right: 20px;
  z-index: 99;
  font-size: 12px;
  border: none;
  outline: none;
  background-color: #0080FF ;
  color: white;
  cursor: pointer;
  padding: 5px;
  border-radius: 4px;
  opacity: 0.5; /* 투명도 설정 */
}

#myBtn:hover {
  background-color: #555;
}

#myBtn2 {
  position: fixed;
  top: 20px;
  right: 20px;
  z-index: 99;
  font-size: 12px;
  border: none;
  outline: none;
  background-color: #0080FF ;
  color: white;
  cursor: pointer;
  padding: 5px;
  border-radius: 4px;
  opacity: 0.5; /* 투명도 설정 */
}

#myBtn2:hover {
  background-color: #555;
}


</style>
</head>

<%
	ExamlistDAO examlistDAO = new ExamlistDAO();
	Util util = new Util();
	Examlist examlist;
	
	String userID = null;
    if(session.getAttribute("userID") !=null ){
        userID = (String) session.getAttribute("userID");
    }

	String examcode = "";// 시험 종목
	if(request.getParameter("examcode")!=null && request.getParameter("examcode")!=""){
		examcode = request.getParameter("examcode");
		//System.out.println("examcode========="+ examcode);
	}
	
	String turn = "";// 회차
	if(request.getParameter("turn")!=null && request.getParameter("turn")!=""){
		turn = request.getParameter("turn");
		//System.out.println("turn========="+ turn);
	}
	
   String examnum ="1.0";//문제 번호 
   if(request.getParameter("examnum")!=null && request.getParameter("examnum")!=""){
	   examnum = request.getParameter("examnum");
       //System.out.println("examnum========="+ examnum);
    }
   
   String examListID = "";// 시험 종목
   if(request.getParameter("examListID")!=null && request.getParameter("examListID")!=""){
       examListID = request.getParameter("examListID");
       //System.out.println("examListID========="+ examListID);
   }

   //String examnum = "1.0";
   //Examlist examlist = examlistDAO.searchExamListId(examListID);
   //Examlist examlist = examlistDAO.searchExamList(examcode,turn,examnum);
   if(examListID !="" ){
	   examlist = examlistDAO.searchExamListId(examListID);
   }else{
	   examlist = examlistDAO.searchExamList(examcode,turn,examnum);
   }
   
   // 수정모드로 들어올때 
   UseranswerdescDAO useranswerdescDAO = new UseranswerdescDAO();
   Useranswerdesc useranswerdesc =  new Useranswerdesc();
   Integer Useranswerdescid = 0 ;
   if(request.getParameter("Useranswerdescid")!=null && request.getParameter("Useranswerdescid")!=""){
	   
	  
	   
	   Useranswerdescid = Integer.parseInt(request.getParameter("Useranswerdescid"));
	   useranswerdesc =   useranswerdescDAO.searchUseranswerdescId(Useranswerdescid);
	   
	   System.out.println("Useranswerdescid========="+ Useranswerdescid);
   }

   
   
   
   String preExamnum;
   String postExamnum;
   
   
   Double i = Double.parseDouble(examnum) + 1.0; // 이후 문제 번호
   Double j = Double.parseDouble(examnum) - 1.0; // 이전 문제 번호

   postExamnum = Double.toString(i);
   preExamnum = Double.toString(j);
%>
 
<!-- 본문 시작  -->

<script>
function answer(check, real) {
	var name = "checkanswer"+check;
	var checkValue
	var arrRadio = document.getElementsByName(name);
	for (var i=0;i<arrRadio.length;i++) {
	    if (arrRadio[i].checked) {
	    	checkValue = arrRadio[i].value ;
	     break;
	    }
	 }
	//초기화
	$("#"+check).children(".o").hide();
	$("#"+check).children(".x").hide();
	$("#"+check).children(".t").hide();
	
	if(checkValue == real){
		//alert("정답입니다.");
		$("#"+check).children(".o").show();
	}else{
		//alert("오답입니다.");
		$("#"+check).children(".x").show();
	}
}

function clearAnswer(check){
	//alert("clear check" + check);
	
	$("#"+check).children(".o").hide();
	$("#"+check).children(".x").hide();
	$("#"+check).children(".t").hide();
	
	//라디오 선택값 초기화
	var name = "checkanswer"+check;
	var arrRadio = document.getElementsByName(name);
	for (var i=0;i<arrRadio.length;i++) {
	   arrRadio[i].checked = false;
	 }
	
}


function comment(check){
    //호출시 넘겨준 값을 이용하여  modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
    var name = "answerDesc"+check;
    //alert(name);
    var str = document.getElementsByName(name);
  
    $("#title").html("해설");
    $("#content").html(str[0].value);
    // 해설 이미지가 있는 경우 이미지도 모달창에 띄워준다.
    //var img = document.getElementById('myImg');
    
    //modal을 띄워준다.  
    $("#myModal").modal('show');
}


</script>
  
<body>  
  <div class="content-wrapper">
  
	<div class="container-fluid">

	<div class="row">


 <%
	
	if(examlist ==null){
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert(' 조회 결과가  없습니다.')");
	    script.println("location.href = history.back()");
	    script.println("</script>");
	}
		
%>					
                    <div <% if(examcode.startsWith("B")){ %> class="col-sm-6" <%}else{%> class="col-sm-12"  <%}%>>
					
					<%-- 하나의 문제 유형 시작 --%>	
					<div id="0" style="position:relative" class="text-muted mt-0 mb-1"> <%-- 문제 영역 --%>
					<img src="img/o.png" class="o" style="position:absolute; top:0px; left:0px; display:none;">
					<img src="img/x.png" class="x" style="position:absolute; top:0px; left:0px; display:none;">
					<img src="img/t.png" class="t" style="position:absolute; top:0px; left:0px; display:none;">
		
			          <div id="domain" >
						<h4><%=  examlist.getDomain() %> / <%=  examlist.getExamnum() %> 번</h4>
					  </div>
					  <hr>	

						<%=	util.nulltoString(examlist.getExamdesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")) %> <%-- 줄바꿈 처리 --%>
						
						    <%-- 보기가 있을때 --%>
                            <% if(examlist.getExambogi()!=null && examlist.getExambogi().length()> 0 ) { %>
                            <div class="row">	
                                <div class="col-sm-6" style="border: 1px solid ; border-radius: 5px; margin: 10px"><%= examlist.getExambogi().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") %> </div>
                            </div>
                            <% } %>
                            
						    <%-- 문제 이미지가  있을때 --%>
							<% if(examlist.getExamImg()!=null && examlist.getExamImg().length()> 0 ) { %>
							<div class="row" style=" margin: 10px ">
									<br><%=  examlist.getExamImg()%>
                            </div>									
							<% } %>
							<%-- 소스 지문이  있을때 --%>
                            <% if(examlist.getSyntexDesc()!=null && examlist.getSyntexDesc().length()> 0) { %>
                            <div class="row">
                                <%= examlist.getSyntexDesc() %>
                            </div>
                            <% } %>
							 <%-- 문제 보기가  있을때 --%>
							<% if(examlist.getAnswer1()!=null && examlist.getAnswer1().length()> 0 ) { %>
                            <div class="row" style=" margin: 10px ">
                                    <br><%=  examlist.getAnswer1()%>
                                    <br><%=  examlist.getAnswer2()%>
                                    <br><%=  examlist.getAnswer3()%>
                                    <br><%=  examlist.getAnswer4()%>
                            </div>                                  
                            <% } %>
                            
							
				
						</div>
						<br>
						<% if(examcode.startsWith("B")){ %>
							<div class="row">
								<div class="col-sm-6" style="border: 1px solid ; border-radius: 5px;  margin: 10px ">&nbsp;
									① <input type=radio name="checkanswer0" value="1">  
									② <input type=radio name="checkanswer0" value="2">  
									③ <input type=radio name="checkanswer0" value="3">  
									④ <input type=radio name="checkanswer0" value="4"> 
							<% if(examcode.equals("B007")){ %> ⑤ <input type=radio name="checkanswer0" value="5"> <!-- 공인중개사 시험 --> <% } %>		
								</div>
							</div>
						<% } %>
						
							<div class="row">
								<div class="col-sm-6">
								<% if(examcode.startsWith("B")){ %> 
									<button type="button" class="btn btn-primary btn-sm " onclick="answer( '0' , <%= examlist.getAnswer() %>);">정답</button>
									<button type="button" class="btn btn-primary btn-sm " onclick="clearAnswer( '0' );">다시</button>
								<% } %> 	
									<% if(examlist.getAnswerdesc() !=null && examlist.getAnswerdesc().length()> 0){ %><button type="button" class="btn btn-primary btn-sm " onclick="comment( '0');">해설</button> <% } %>
									<%-- <a href="examDetailView.jsp?examnum=<%= preExamnum %>&examcode=<%=examcode %>&turn=<%= turn %>" class="btn btn-primary btn-sm "> 이전 </a>
									<a href="examDetailView.jsp?examnum=<%= postExamnum %>&examcode=<%=examcode %>&turn=<%= turn %>" class="btn btn-primary btn-sm "> 다음 </a> --%>
									
								  <%--   <% if(userID !=null && userID.equals("cms")){  %>  
									<a href="examView.jsp?examListID=<%= examlist.getExamlistid() %>" class="btn btn-primary btn-sm pull-right"> 수정 </a>
									<% } %> --%>
									
								</div>
							</div>
						
						<div id="d0" class="collapse" style="border: 1px dashed red; border-radius: 5px"><%-- 해설/이미지 영역 --%>
							&nbsp;<%= examlist.getAnswer() %>
						</div>
						<input type="hidden" name="realanswer0" value="<%= examlist.getAnswer() %>">
						
						<% if(examlist.getAnswerdesc()!=null) { %>
						<input type="hidden" name="answerDesc0" value="<%= examlist.getAnswerdesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") %>">
						<% } %>
						
						
				<div class="row">
				<form class="form-horizontal" action="socialAnswerInsert.jsp" method="post" target="_self">		
                <div class="form-group">
                  <label class="control-label col-sm-1" for="answerDesc">문제 해설</label>
                  <div class="col-sm-11"> 
                  <textarea class="form-control" placeholder="글 내용" name="answerDesc" maxlength="1024" style="height: 50px;" ><% if(useranswerdesc.getAnswerdesc()!=null && useranswerdesc.getAnswerdesc().length()>0){ %><%= useranswerdesc.getAnswerdesc()%><% } %>
                  </textarea>
                  </div>
                </div>
                <div class="form-group"> 
                   <div class="col-sm-offset-1 col-sm-11">
                     <input type="submit" class="btn btn-success pull-right" value="등록">
                   </div>
                </div>
                <input type="hidden" name="userID" value="<%= userID %>">
                <input type="hidden" name="examListID" value="<%= examListID %>"> 
                <input type="hidden" name="updateYN" <% if(Useranswerdescid !=0){%> value="Y" <%}else{ %> value="N"<%} %>> 
                <input type="hidden" name="Useranswerdescid" value="<%= Useranswerdescid %>">
                
                
                </form>
                </div>

						
						
					<%-- 하나의 문제 유형 끝 --%>	


					</div> <!-- col-sm-6 blog-main 끝  -->

	
	<button onclick="topFunction()" id="myBtn" title="Go to top" class="btn btn-primary btn-sm">위로</button>
	
		</div><!-- row 끝  -->
	</div><!-- container 끝  -->
</div><!-- container wrapper 끝  -->


 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="title"></h4>
        </div>
        <div class="modal-body">
          <p id="content"></p>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>  

		
<script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}



</script>		

	
</body>
  
  
  
 <!-- 본문 끝  -->
   


</html>
