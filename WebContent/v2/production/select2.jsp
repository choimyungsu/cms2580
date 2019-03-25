<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 기출문제 </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    
    
    
    
    <script>
//json 처리 스크립트 
var request = new XMLHttpRequest();

function changeSelect(){
    var langSelect = document.getElementById("level1");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;    // select element에서 선택된 option의 value가 저장된다.
    var selectText = langSelect.options[langSelect.selectedIndex].text; // select element에서 선택된 option의 text가 저장된다.
    var level2 =$("#level2");// ajax로 데이터 뿌려줄 부분 
    
    $.ajax({
        url:"../../Level2SearchServlet",    
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
    document.form1.action = "../../examList.jsp";
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
        document.form1.action = "../../examDetailView.jsp";
    }else{
        document.form1.action = "../../examList.jsp";
    }
    
    document.form1.examcode.value = firstValue;
    document.form1.turn.value = secondValue;
    
    document.form1.submit();
}

  

</script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-3728893017240396",
    enable_page_level_ads: true
  });
</script>    
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
        <jsp:include page="common.jsp" flush="true" />

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="clearfix"></div>

            <div class="row">
                  

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
					
					
					  </div><!-- row  -->
					  <input type="hidden" name="examcode">
					  <input type="hidden" name="turn">
					  
					  </form>
					  </div><!-- form-group  -->
					  <iframe id="resultExam" src="../../examCount.jsp" name="resultExam" style="display:block; width:100%; height: 80vh; frameborder:1"> </iframe>
					</div><!-- container  -->
					
					
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