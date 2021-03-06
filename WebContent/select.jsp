<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDAO" %>
<%@ page import="com.file.Linkfile" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<!--1. clipboard.js 파일 cdn을 통해서 로드-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>

<script>
//json 처리 스크립트 
var request = new XMLHttpRequest();

function changeSelect(){
    var langSelect = document.getElementById("level1");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    var selectText = langSelect.options[langSelect.selectedIndex].text; // select element에서 선택된 option의 text가 저장된다.
    var level2 =$("#level2");// ajax로 데이터 뿌려줄 부분 
    
    $.ajax({
        url:"./Level2SearchServlet",    
        type:'POST',
        data:'level1='+selectValue ,
        dataType:'json',
        success : function(data){
            $(level2).children().remove();// 두번째 셀렉트 부분 데이터 삭제
            $(level2).append("<option value=''>선택</option>");// 옵션 하나 추가
        var result = data["result"];
            
            var mcCode = "";
            //var mcName = "";
            for(var i=0; i<result.length; i++){
                mcCode=result[i].resultMccode; //
                $(level2).append("<option value='"+mcCode+"'>"+mcCode+" 회 </option>");
            } 
        },
        error : function(response){
            var err = response.status + ''+ response.statusText;
            alert(err);
            alert("처리중 오류가 발생햇습니다. 관리자에게 문의하세요.")
        }
    });
}

function changeSelect2(){

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var secondSelect = document.getElementById("level2");
    var secondValue = secondSelect.options[secondSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var thirdSelect = document.getElementById("level3");
    thirdSelect.selectedIndex = 0; // 초기화
    
    document.form1.target = "resultExam";
    document.form1.action = "examList.jsp";
    document.form1.examcode.value = firstValue;
    document.form1.turn.value = secondValue;
    
    document.form1.submit();
}

function changeSelect3(){

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var secondSelect = document.getElementById("level2");
    var secondValue = secondSelect.options[secondSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    var thirdSelect = document.getElementById("level3");
    var thirdValue = thirdSelect.options[thirdSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    
    document.form1.target = "resultExam";
    
    if(thirdValue=='one'){
        document.form1.action = "examDetailView.jsp";
    }else{
    	document.form1.action = "examList.jsp";
    }
    
    document.form1.examcode.value = firstValue;
    document.form1.turn.value = secondValue;
    
    document.form1.submit();
}



</script>
</head>
<body>
<jsp:include page="header.jsp" flush="true" />


<div class="content-wrapper">
<div class="container-fluid">
<div class="form-group">
<form name="form1" method="post">                                        
  <div class="row">
     <div class="col-sm-3" >
        <select id="level1" name="level1" onchange="changeSelect()" class="form-control">
            <option value="">시험 선택</option>
            <option value="B011">9급 전산직(정보보호)</option>
            <option value="B012">9급 전산직(전산개발)</option>
            <option value="B014">7급 전산직</option>
            <option value="B015">서울시 9급 전산직</option>
            <option value="B016">서울시 7급 전산직</option>
            <option value="A001">정보관리기술사</option>
            <option value="A002">컴퓨터시스템응용기술사</option>
            <option value="B005">정보시스템 감리사</option>
            <option value="B001">정보보안기사</option>
            <option value="A003">정보보안기사 실기</option>
            <option value="B003">리눅스마스터1급</option>
            <option value="A004">리눅스마스터1급 실기</option>
            <option value="B004">네트워크관리사1급</option>
            <option value="B020">네트워크관리사2급</option>
            <option value="B013">정보처리기사</option>
            <option value="B007">공인중개사1차</option>
            <option value="B017">국어(9급 국가직)</option>
            <option value="B018">영어(9급 국가직)</option>
            <option value="B019">한국사(9급 국가직)</option>
            <option value="기타">기타</option>
        </select>
     </div>
     <div class="col-sm-3" >
        <select id="level2" name="level2" onchange="changeSelect2()" class="form-control">
            <option value="" selected="selected">회차</option>
        </select>
    </div>
     <div class="col-sm-3" >
        <select id="level3" name="level3" onchange="changeSelect3()" class="form-control">
            <option value="all" selected="selected">전체 보기</option>
            <option value="one" >한문제씩 보기</option>
        </select>
    </div>
    <div class="col-sm-3" >
        <button class="btn btn-primary btn-sm" data-clipboard-text="http://cms2580.cafe24.com">URL 클립보드 복사</button>
        <!-- <button onclick="urlcopy()" id="btn1"  class="btn btn-primary btn-sm">URL 클립보드 복사</button> -->
    </div>


  </div><!-- row  -->
  <input type="hidden" name="examcode">
  <input type="hidden" name="turn">
  </form>
  </div><!-- form-group  -->
  <iframe id="resultExam" src="examCount.jsp" name="resultExam" style="display:block; width:100%; height: 80vh; frameborder:1"> </iframe>
</div><!-- container  -->


</div>
<script>
//3. 웹 문서가 로드되면 클립보드 객체 생성
$(document).ready(function(){

    var clipboard = new Clipboard('.btn');
    clipboard.on('success', function(e) {
        console.log("Success");

        /*
        아래 함수를 통해서 블록지정을 없앨 수 있습니다.
        */
        var selection = window.getSelection();
        //selection.removeAllRanges();
    });
    clipboard.on('error', function(e) {
        console.log("Fail");
    });

    // 아래와 같이 button 태그만 가져오는 방법도 가능하다.
    /*
    var btns = document.querySelectorAll('button');
    var clipboard = new Clipboard(btns);
    */


});

</script>
 
</body>
 
</html>