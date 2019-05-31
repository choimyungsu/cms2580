<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
 
<head>
    <title>jsPDF</title>

    <style>


    </style>
</head>
 
<body>

<div id="content">
     <h3>Generate PDF files in client-side JavaScript</h3>

<p>href="https://parall.ax/products/jspdf#"</p>
<p>Or refer to the YouTube video: https://www.youtube.com/watch?v=CnprxD_sJFE<p>
<p> 한글 </p>

jsPDF를 활용하여 원하는 DOM 영역을 PDF 로 다운받을 수 있다. 해당 라이브러리를 살펴보면 image to pdf, html to pdf, svg to pdf text to pdf 등 여러 방법들을 소개하고 있지만, 텍스트 기반의 pdf 를 생성하고자 하는게 아니라면 DOM to JPG to PDF 방식이 속편하다.

아래 소스코드는 DOM의 특정 영역을 셀렉트하여 html2canvas 를 통해 이미지로 렌더링하고, 해당 이미지를 jsPDF를 통해 pdf로 변환하는 작업이다. window.html2canvas = heml2canvas 를 제외하고는 makePDF 함수는 일반 자바스크립트 환경에서도 충분히 사용할 수 있을것이다.

설정한 canvas 높이를 넘어서면 자동으로 페이징을 처리해주도록 했다. 그리고 당연하게도 html2canvas, jspdf 패키지는 별도로 설치해주어야 한다. 아래 소스는 html2canvas: 0.5.0-beta4, jspdf: 1.3.5를 기준으로 테스트되었다.


더 구체적인 설명은 코드로 대체한다. 도움이 되었다면 

2018년 9월 업데이트
html2canvas 가 1.0으로 버전업되면서 이미지의 화질이 대폭 개선되었다. 아직 알파단계이긴하나 많이 안정화되었다. 위 코드는 정상적으로 작동하는것을 확인했다. scale옵션을 통해 스케일을 원하는대로 크게 확대할 수 있다.
대신 용량이 커질 수 있다. 특히 pdf로 다운받으면 더욱 심해지는데, png나 jpg를 사용하지 말고 jpeg를 사용하면 많이 줄일 수 있다.
참고
[html2canvas] html페이지를 canvas로 변환한 후 binary파일로 변환하기
Multiple Canvas Page


import html2canvas from 'html2canvas'
import jsPDF from 'jspdf'
export default {
    name: 'pdf',
    data () {
        return {
            propTitle: 'mypdf'
        }
    },
    methods: {  
        makePDF (selector = 'body') {
            window.html2canvas = html2canvas //Vue.js 특성상 window 객체에 직접 할당해야한다.
            let that = this
            let pdf = new jsPDF('p', 'mm', 'a4')
            let canvas = pdf.canvas
            const pageWidth = 210 //캔버스 너비 mm
            const pageHeight = 295 //캔버스 높이 mm
            canvas.width = pageWidth
            let ele = document.querySelector(selector)
            let width = ele.offsetWidth // 셀렉트한 요소의 px 너비
            let height = ele.offsetHeight // 셀렉트한 요소의 px 높이
            let imgHeight = pageWidth * height/width // 이미지 높이값 px to mm 변환
            if(!ele){
                console.warn(selector + ' is not exist.')
                return false
            }
            html2canvas(ele, {
                onrendered: function(canvas) {
                    let position = 0
                    const imgData = canvas.toDataURL('image/png')
                    pdf.addImage(imgData, 'png', 0, position, pageWidth, imgHeight, undefined, 'slow')
                    //Paging 처리
                    let heightLeft = imgHeight //페이징 처리를 위해 남은 페이지 높이 세팅.
                    heightLeft -= pageHeight
                    while (heightLeft >= 0) {
                        position = heightLeft - imgHeight
                        pdf.addPage();
                        pdf.addImage(imgData, 'png', 0, position, pageWidth, imgHeight)
                        heightLeft -= pageHeight
                    }
                    pdf.save(that.propTitle.toLowerCase() +'.pdf')
                },
            }); 
        },




</div>

<div id="editor"> editor 영역</div>

<button id="cmd">Generate PDF</button>

       
    
  </body>
  <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    
<script>


var doc = new jsPDF();
var specialElementHandlers = {
    '#editor': function (element, renderer) {
        return true;
    }
};


$("#cmd").click(function () {
/*         $("#usr-state").hide();
        $("#p-dept").css("width","40%");
        $("#usr-nm").css("width","38.7%"); */
        
       // var pdf = new jsPDF('p', 'mm', 'a4')
      //  var canvas = pdf.canvas
        var pageWidth = 200 //캔버스 너비 mm
        var pageHeight = 295 //캔버스 높이 mm
        // canvas.width = pageWidth
        /*
        var ele = document.querySelector("content")
        var width = ele.width // 셀렉트한 요소의 px 너비
        var height = ele.height // 셀렉트한 요소의 px 높이
        var imgHeight = pageWidth * height/width // 이미지 높이값 px to mm 변환
        */
        var imgHeight = $("content").outerHeight();
        
        
        html2canvas(document.getElementById("content"), {
             onrendered : function(canvas){
              var imgData = canvas.toDataURL('image/png');
              var doc = new jsPDF('p','mm','a4');
              //doc.addImage(imgData, 'PNG', 5,5,200,25);//pdf.addImage(imgData, 'png', 0, position, pageWidth, imgHeight, undefined, 'slow')
              doc.addImage(imgData, 'PNG', 5,5,pageWidth,imgHeight);
              doc.save('problem.pdf');
                } 
            });
         
    });


/*
 
//단순 PDF 파일 변환
var doc = new jsPDF();
var specialElementHandlers = {
    '#editor': function (element, renderer) {
        return true;
    }
};

$('#cmd').click(function () {
    doc.fromHTML($('#content').html(), 15, 15, {
        'width': 170,
            'elementHandlers': specialElementHandlers
    });
    doc.save('sample-file.pdf');
});
*/
    </script>
</html>