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

    <title> ���ǰ�� </title>

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



function testCreate(){
	//���ǰ��

    var firstSelect = document.getElementById("level1");
    var firstValue = firstSelect.options[firstSelect.selectedIndex].value;    // select element���� ���õ� option�� value�� ����ȴ�.
    
    document.form1.target = "resultExam";
    document.form1.action = "../../randomTest.jsp";
    document.form1.examcode.value = firstValue;
    
    document.form1.submit();
}


  

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
					        <select id="level1" name="level1"  class="form-control">
					            <option value="">���� ����</option>
					            <option value="B001">�������ȱ��</option>
					            <option value="A003">�������ȱ�� �Ǳ�</option>
					            <option value="B011">9�� ������(������ȣ)</option>
					            <option value="B012">9�� ������(���갳��)</option>
					            <option value="B014">7�� ������</option>
					            <option value="B015">����� 9�� ������</option>
					            <option value="B016">����� 7�� ������</option>
					            <option value="B005">�����ý��� ������</option>
					            <option value="B003">������������1��</option>
					            <option value="B004">��Ʈ��ũ������1��</option>
					            <option value="B013">����ó�����</option>
					            
					            
					        </select>
					     </div>
					     <div class="col-sm-3" >
					            <button type="button" class="btn btn-primary btn-sm " onclick="testCreate();">����</button>
					        <!-- <select id="level2" name="level2" onchange="changeSelect2()" class="form-control">
					            <option value="" selected="selected">ȸ��</option>
					        </select> -->
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