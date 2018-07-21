<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.exam.ExamlistDAO" %>  
<%@ page import="com.exam.Examlist" %> 
<%@ page import="com.common.Util" %> 
<%@ page import="java.util.ArrayList" %>

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

function scoreResult(){ // 전체 문제 채점하기
	
	var sum=0;
	var count = document.getElementsByName('count')[0].value;
	//alert ("conut "+ count);
	
	for (var i=0;i<count;i++) { //문제 카우트 만큼 돌면서 비교
	     var checkanswerNo = "checkanswer"+i;
	     var realanswerNo = "realanswer"+i;
	     var userCheckAnswer 
		 var arrRadio = document.getElementsByName(checkanswerNo);
	     
	     var real = document.getElementsByName(realanswerNo)[0].value;
		 for (var j=0;j<arrRadio.length;j++) {
			    if (arrRadio[j].checked) {
			    	userCheckAnswer = arrRadio[j].value ;
			    	if(userCheckAnswer == real){
			    		sum = sum + 1;
			    		$("#"+i).children(".o").show();
			    	}else{
			    		$("#"+i).children(".x").show();
			    		
			    	}
			    }
		 }
	 }

	alert(" 맞춘 갯수가 " + sum +" 입니다.");
}
</script>
  
<body>  
  <div class="content-wrapper">
  
	<div class="container-fluid">

	<div class="row">
	
	<% 	if(!examcode.startsWith("A")){ %><%-- 주관식 시험이면 채점 버튼 안보임 --%>
		<button onclick="scoreResult()" id="myBtn2" title="score" class="btn btn-primary btn-sm">채점</button>
	<% } %>	

 <%
	ExamlistDAO examlistDAO = new ExamlistDAO();
  	Util util = new Util();
	//String temp ="";
	ArrayList<Examlist> list = examlistDAO.searchExamList(examcode,turn);//""
	String[] a = new String[2];// 교시를 출력하기 위한 배열
	int j=1;
	for(int i =0 ; i < list.size(); i++){
		
		
%>					<div <% if(examcode.startsWith("B")){ %> class="col-sm-6" <%}else{%> class="col-sm-12"  <%}%>>
					
					<%-- 하나의 문제 유형 시작 --%>	
						<div id="<%= i %>" style="position:relative" class="text-muted mt-0 mb-1"> <%-- 문제 영역 --%>
						<img src="img/o.png" class="o" style="position:absolute; top:0px; left:0px; display:none;">
						<img src="img/x.png" class="x" style="position:absolute; top:0px; left:0px; display:none;">
						<img src="img/t.png" class="t" style="position:absolute; top:0px; left:0px; display:none;">
						<%    
						    if(examcode.startsWith("B") || examcode.equals("A003") || examcode.equals("A004")){
	                            // 서로 다른 도메인(과목) 일때만 도메인을 출력  , 정보보안기사 실기 추가
                                a[1]=a[0];
                                a[0]=list.get(i).getDomain();
                                if(!a[0].equals(a[1])){
						    	
						
						%>
						          <div id="domain" style="border:1px solid gray; text-align:center; box-shadow: 5px 5px 10px grey ; padding:10px; margin: 40px">
									<h4><%=  list.get(i).getDomain() %></h4>
								  </div>
						          
						<% 
						        } // 도메인 이 다를때만 
                        %>
						 <hr>	
						<% 
						     } // B유형(객관식 시험) 
						%>
						<% 
						      if(examcode.equals("A001") || examcode.equals("A002")){ // 정보처리 기술사 일때만. 
						    	 // 서로 다른값일때만 교시를 출력  
						    	  a[1]=a[0];
						    	  a[0]=list.get(i).getPeriod();
						    	  if(!a[0].equals(a[1])){
						    		  j=1;//교시별 문제 번호 초기화 
							
						%>	
                        
                         <div id="domain" style="border:1px solid gray; text-align:center; box-shadow: 5px 5px 10px grey ; padding:10px; margin: 40px">
						         <p> <%=  list.get(i).getPeriod() %> 교시</p>
						 </div>
						 
						<%
						            }//서로다른 교시를 확인하는 코드 끝
						     }//기술사 문제일때만 끝 
						%>

						<% if(list.get(i).getExamdesc()!=null) { %>
						<%=  j %>. 
						<%=		util.nulltoString(list.get(i).getExamdesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")) %> <%-- 줄바꿈 처리 --%>
						
						    <%-- 보기가 있을때 --%>
                            <% if(list.get(i).getExambogi()!=null && list.get(i).getExambogi().length()> 0 ) { %>
                            <div class="row">	
                                <div class="col-sm-6" style="border: 1px solid ; border-radius: 5px; margin: 10px"><%= list.get(i).getExambogi().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") %> </div>
                            </div>
                            <% } %>
                            <%-- 소스 지문이  있을때 --%>
                            <% if(list.get(i).getSyntexDesc()!=null && list.get(i).getSyntexDesc().length()> 0) { %>
                            <div class="row">
                                <%= list.get(i).getSyntexDesc() %>
                            </div>
                            <% } %>
                            
						    <%-- 문제 이미지가  있을때 --%>
							<% if(list.get(i).getExamImg()!=null && list.get(i).getExamImg().length()> 0 ) { %>
							<div class="row" style=" margin: 10px ">
									<%=  list.get(i).getExamImg()%>
                            </div>									
							<% } %>
							 <%-- 문제 보기가  있을때 --%>
							<% if(list.get(i).getAnswer1()!=null && list.get(i).getAnswer1().length()> 0 ) { %>
                            <div class="row" style=" margin: 10px ">
                                    <%=  list.get(i).getAnswer1()%>
                                    <br><%=  list.get(i).getAnswer2()%>
                                    <br><%=  list.get(i).getAnswer3()%>
                                    <br><%=  list.get(i).getAnswer4()%>
                            </div>                                  
                            <% } %>
                            
<%--                              문제 해설이 있는 주관식 시험 일때
                            <% if(list.get(i).getAnswerdesc()!=null && list.get(i).getAnswerdesc().length()> 0 && examcode.equals("A003")) { %>
                            <br> <button type="button" class="btn btn-primary btn-sm " onclick="comment( <%= i %>);">해설</button> 

							<%} %> --%>
							
						<% 
						    j++;//문제 번호 올리기 
						   }
						
						%>
						</div>
						<br>
						
							
							<% if(examcode.startsWith("B")){ %>
							<div class="row">
								<div class="col-sm-6" style="border: 1px solid ; border-radius: 5px;  margin: 10px ">&nbsp;
									① <input type=radio name="checkanswer<%=i%>" value="1">  
									② <input type=radio name="checkanswer<%=i%>" value="2">  
									③ <input type=radio name="checkanswer<%=i%>" value="3">  
									④ <input type=radio name="checkanswer<%=i%>" value="4">
									<% if(examcode.equals("B007")){ %> ⑤ <input type=radio name="checkanswer<%=i%>" value="5"> <!-- 공인중개사 시험 --> <% } %>
								</div>
							</div>
							<% } %>
							<div class="row">
								<div class="col-sm-6">
							<% if(examcode.startsWith("B")){ %>	
									<button type="button" class="btn btn-primary btn-sm " onclick="answer( <%=i%> , <%= list.get(i).getAnswer() %>);">정답</button>
									<button type="button" class="btn btn-primary btn-sm " onclick="clearAnswer( <%=i%> );">다시</button>
							<% } %>		
							<% if(list.get(i).getAnswerdesc() !=null && list.get(i).getAnswerdesc().length()> 0){ %>
							         <button type="button" class="btn btn-primary btn-sm " onclick="comment( <%= i %>);">해설</button> 
							<% } %>
							
							<%    if(userID !=null && userID.equals("cms")){     %>  
									<a href="examView.jsp?examListID=<%= list.get(i).getExamlistid() %>" class="btn btn-primary btn-sm pull-right"> 수정 </a>
							<% } %>
									
								</div>
							</div>
							
							<% if(userID !=null && userID.length()>0) { %>  
							<!-- 로그인 한 사용자들만 해설등록 및 보기를 할 수 있음. -->
							<div class="row">
                                <div class="col-sm-6">
                                    <a href="socialAnswer.jsp?examListID=<%= list.get(i).getExamlistid() %>" class="btn btn-success btn-sm"> 해설등록 </a>
                                    <!-- 회원 해설이 있는 경우만 나타나도록 변경 필요함. -->
                                    <a href="socialAnswerList.jsp?examListID=<%= list.get(i).getExamlistid() %>" class="btn btn-success btn-sm"> 회원해설 </a>
                           
                                </div>
                           </div>
	                           <% if(list.get(i).getUrl().length()>0) { %>  
	                           <div class="row">
	                                <div class="col-sm-6">
	                                <a href="<%= list.get(i).getUrl() %>" target="_blank"> 관련해설 URL: <%= list.get(i).getUrl()  %> </a>
	                                </div>
	                           </div>
	                           <% } %>
                           
                            <% } %>
						
						<div id="d<%=i%>" class="collapse" style="border: 1px dashed red; border-radius: 5px"><%-- 해설/이미지 영역 --%>
							&nbsp;<%= list.get(i).getAnswer() %>
						</div>
						<input type="hidden" name="realanswer<%=i %>" value="<%= list.get(i).getAnswer() %>">
						
						<% if(list.get(i).getAnswerdesc()!=null) { %>
						<input type="hidden" name="answerDesc<%=i %>" value="<%= list.get(i).getAnswerdesc().replaceAll("(\r\n|\r|\n|\n\r)", "<br>") %>">
						<%} %>
					<%-- 하나의 문제 유형 끝 --%>	


					</div> <!-- col-sm-6 blog-main 끝  -->

<%
	}
%>					
	<input type="hidden" name="count" value="<%= list.size() %>">
	
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
