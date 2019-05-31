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
<p> �ѱ� </p>

jsPDF�� Ȱ���Ͽ� ���ϴ� DOM ������ PDF �� �ٿ���� �� �ִ�. �ش� ���̺귯���� ���캸�� image to pdf, html to pdf, svg to pdf text to pdf �� ���� ������� �Ұ��ϰ� ������, �ؽ�Ʈ ����� pdf �� �����ϰ��� �ϴ°� �ƴ϶�� DOM to JPG to PDF ����� �����ϴ�.

�Ʒ� �ҽ��ڵ�� DOM�� Ư�� ������ ����Ʈ�Ͽ� html2canvas �� ���� �̹����� �������ϰ�, �ش� �̹����� jsPDF�� ���� pdf�� ��ȯ�ϴ� �۾��̴�. window.html2canvas = heml2canvas �� �����ϰ�� makePDF �Լ��� �Ϲ� �ڹٽ�ũ��Ʈ ȯ�濡���� ����� ����� �� �������̴�.

������ canvas ���̸� �Ѿ�� �ڵ����� ����¡�� ó�����ֵ��� �ߴ�. �׸��� �翬�ϰԵ� html2canvas, jspdf ��Ű���� ������ ��ġ���־�� �Ѵ�. �Ʒ� �ҽ��� html2canvas: 0.5.0-beta4, jspdf: 1.3.5�� �������� �׽�Ʈ�Ǿ���.


�� ��ü���� ������ �ڵ�� ��ü�Ѵ�. ������ �Ǿ��ٸ� 

2018�� 9�� ������Ʈ
html2canvas �� 1.0���� �������Ǹ鼭 �̹����� ȭ���� ���� �����Ǿ���. ���� ���Ĵܰ��̱��ϳ� ���� ����ȭ�Ǿ���. �� �ڵ�� ���������� �۵��ϴ°��� Ȯ���ߴ�. scale�ɼ��� ���� �������� ���ϴ´�� ũ�� Ȯ���� �� �ִ�.
��� �뷮�� Ŀ�� �� �ִ�. Ư�� pdf�� �ٿ������ ���� �������µ�, png�� jpg�� ������� ���� jpeg�� ����ϸ� ���� ���� �� �ִ�.
����
[html2canvas] html�������� canvas�� ��ȯ�� �� binary���Ϸ� ��ȯ�ϱ�
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
            window.html2canvas = html2canvas //Vue.js Ư���� window ��ü�� ���� �Ҵ��ؾ��Ѵ�.
            let that = this
            let pdf = new jsPDF('p', 'mm', 'a4')
            let canvas = pdf.canvas
            const pageWidth = 210 //ĵ���� �ʺ� mm
            const pageHeight = 295 //ĵ���� ���� mm
            canvas.width = pageWidth
            let ele = document.querySelector(selector)
            let width = ele.offsetWidth // ����Ʈ�� ����� px �ʺ�
            let height = ele.offsetHeight // ����Ʈ�� ����� px ����
            let imgHeight = pageWidth * height/width // �̹��� ���̰� px to mm ��ȯ
            if(!ele){
                console.warn(selector + ' is not exist.')
                return false
            }
            html2canvas(ele, {
                onrendered: function(canvas) {
                    let position = 0
                    const imgData = canvas.toDataURL('image/png')
                    pdf.addImage(imgData, 'png', 0, position, pageWidth, imgHeight, undefined, 'slow')
                    //Paging ó��
                    let heightLeft = imgHeight //����¡ ó���� ���� ���� ������ ���� ����.
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

<div id="editor"> editor ����</div>

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
        var pageWidth = 200 //ĵ���� �ʺ� mm
        var pageHeight = 295 //ĵ���� ���� mm
        // canvas.width = pageWidth
        /*
        var ele = document.querySelector("content")
        var width = ele.width // ����Ʈ�� ����� px �ʺ�
        var height = ele.height // ����Ʈ�� ����� px ����
        var imgHeight = pageWidth * height/width // �̹��� ���̰� px to mm ��ȯ
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
 
//�ܼ� PDF ���� ��ȯ
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