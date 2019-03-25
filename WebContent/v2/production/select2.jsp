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

    <title> ���⹮�� </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    
    
    
    
    <script>
//json ó�� ��ũ��Ʈ 
var request = new XMLHttpRequest();

function changeSelect(){
    var langSelect = document.getElementById("level1");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    var selectText = langSelect.options[langSelect.selectedIndex].text; // select element���� ���õ� option�� text�� ����ȴ�.
    var level2 =$("#level2");// ajax�� ������ �ѷ��� �κ� 
    
    $.ajax({
        url:"../../Level2SearchServlet",    
        type:'POST',
        data:'level1='+selectValue ,
        dataType:'json',
        success : function(data){
            $(level2).children().remove();// �ι�° ����Ʈ �κ� ������ ����
            $(level2).append("<option value=''>����</option>");// �ɼ� �ϳ� �߰�
        var result = data["result"];
            
            var mcCode = "";
            //var mcName = "";
            for(var i=0; i<result.length; i++){
                mcCode=result[i].resultMccode; //
                $(level2).append("<option value='"+mcCode+"'>"+mcCode+" ȸ </option>");
            } 
        },
        error : function(response){
            var err = response.status + ''+ response.statusText;
            alert(err);
            alert("ó���� ������ �߻��޽��ϴ�. �����ڿ��� �����ϼ���.")
        }
    });
}

function changeSelect2(){

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    
    var secondSelect = document.getElementById("level2");
    var secondValue = secondSelect.options[secondSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    
    var thirdSelect = document.getElementById("level3");
    thirdSelect.selectedIndex = 0; // �ʱ�ȭ
    
    document.form1.target = "resultExam";
    document.form1.action = "../../examList.jsp";
    document.form1.examcode.value = firstValue;
    document.form1.turn.value = secondValue;
    
    document.form1.submit();
}

function changeSelect3(){

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    
    var secondSelect = document.getElementById("level2");
    var secondValue = secondSelect.options[secondSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    
    var thirdSelect = document.getElementById("level3");
    var thirdValue = thirdSelect.options[thirdSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    
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
					            <option value="">���� ����</option>
					            <option value="B011">9�� ������(������ȣ)</option>
					            <option value="B012">9�� ������(���갳��)</option>
					            <option value="B014">7�� ������</option>
					            <option value="B015">����� 9�� ������</option>
					            <option value="B016">����� 7�� ������</option>
					            <option value="A001">�������������</option>
					            <option value="A002">��ǻ�ͽý�����������</option>
					            <option value="B005">�����ý��� ������</option>
					            <option value="B001">�������ȱ��</option>
					            <option value="A003">�������ȱ�� �Ǳ�</option>
					            <option value="B003">������������1��</option>
					            <option value="A004">������������1�� �Ǳ�</option>
					            <option value="B004">��Ʈ��ũ������1��</option>
					            <option value="B013">����ó�����</option>
					            <option value="B007">�����߰���1��</option>
					            <option value="B017">����(9�� ������)</option>
					            <option value="B018">����(9�� ������)</option>
					            <option value="B019">�ѱ���(9�� ������)</option>
					            <option value="��Ÿ">��Ÿ</option>
					        </select>
					     </div>
					     <div class="col-sm-3" >
					        <select id="level2" name="level2" onchange="changeSelect2()" class="form-control">
					            <option value="" selected="selected">ȸ��</option>
					        </select>
					    </div>
					     <div class="col-sm-3" >
					        <select id="level3" name="level3" onchange="changeSelect3()" class="form-control">
					            <option value="all" selected="selected">��ü ����</option>
					            <option value="one" >�ѹ����� ����</option>
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