package com.exam;

//���⹮�� 
public class Examlist {

 // pk 
 private Integer examlistid;

 // �����ڵ�(����) 
 private String examcode;

 // ����(����) 
 private String domain;

 // �����⵵ 
 private String year;

 // ȸ�� 
 private String turn;

 // ���� 
 private String period;

 // ������ȣ 
 private String examnum;

 // �������� 
 private String examdesc;

 // �������� 
 private String exambogi;

 // 1�� 
 private String answer1;

 // 2�� 
 private String answer2;

 // 3�� 
 private String answer3;

 // 4�� 
 private String answer4;

 // 5�� 
 private String answer5;

 // ����Ǯ�� 
 private String answerdesc;

 // ���� 
 private String answer;
 


// ���� �̹���
 private String examImg;
 
 //Ǯ�� �̹���
 private String answerImg;
 
 //�ҽ� ����
 private String syntexDesc;

 public String getSyntexDesc() {
	return syntexDesc;
}

public void setSyntexDesc(String syntexDesc) {
	this.syntexDesc = syntexDesc;
}

public Integer getExamlistid() {
     return examlistid;
 }

 public void setExamlistid(Integer examlistid) {
     this.examlistid = examlistid;
 }

 public String getExamcode() {
     return examcode;
 }

 public void setExamcode(String examcode) {
     this.examcode = examcode;
 }

 public String getDomain() {
     return domain;
 }

 public void setDomain(String domain) {
     this.domain = domain;
 }

 public String getYear() {
     return year;
 }

 public void setYear(String year) {
     this.year = year;
 }

 public String getTurn() {
     return turn;
 }

 public void setTurn(String turn) {
     this.turn = turn;
 }

 public String getPeriod() {
     return period;
 }

 public void setPeriod(String period) {
     this.period = period;
 }

 public String getExamnum() {
     return examnum;
 }

 public void setExamnum(String examnum) {
     this.examnum = examnum;
 }

 public String getExamdesc() {
     return examdesc;
 }

 public void setExamdesc(String examdesc) {
     this.examdesc = examdesc;
 }

 public String getExambogi() {
     return exambogi;
 }

 public void setExambogi(String exambogi) {
     this.exambogi = exambogi;
 }

 public String getAnswer1() {
     return answer1;
 }

 public void setAnswer1(String answer1) {
     this.answer1 = answer1;
 }

 public String getAnswer2() {
     return answer2;
 }

 public void setAnswer2(String answer2) {
     this.answer2 = answer2;
 }

 public String getAnswer3() {
     return answer3;
 }

 public void setAnswer3(String answer3) {
     this.answer3 = answer3;
 }

 public String getAnswer4() {
     return answer4;
 }

 public void setAnswer4(String answer4) {
     this.answer4 = answer4;
 }

 public String getAnswer5() {
     return answer5;
 }

 public void setAnswer5(String answer5) {
     this.answer5 = answer5;
 }

 public String getAnswerdesc() {
     return answerdesc;
 }

 public void setAnswerdesc(String answerdesc) {
     this.answerdesc = answerdesc;
 }

 public String getAnswer() {
     return answer;
 }

 public void setAnswer(String answer) {
     this.answer = answer;
 }

public String getExamImg() {
	return examImg;
}

public void setExamImg(String examImg) {
	this.examImg = examImg;
}

public String getAnswerImg() {
	return answerImg;
}

public void setAnswerImg(String answerImg) {
	this.answerImg = answerImg;
}
 // Examlist �� ����
 public void CopyData(Examlist param)
 {
     this.examlistid = param.getExamlistid();
     this.examcode = param.getExamcode();
     this.domain = param.getDomain();
     this.year = param.getYear();
     this.turn = param.getTurn();
     this.period = param.getPeriod();
     this.examnum = param.getExamnum();
     this.examdesc = param.getExamdesc();
     this.exambogi = param.getExambogi();
     this.answer1 = param.getAnswer1();
     this.answer2 = param.getAnswer2();
     this.answer3 = param.getAnswer3();
     this.answer4 = param.getAnswer4();
     this.answer5 = param.getAnswer5();
     this.answerdesc = param.getAnswerdesc();
     this.answer = param.getAnswer();
     this.examImg = param.getExamImg();
     this.answerImg = param.getAnswerImg();
     this.syntexDesc = param.getSyntexDesc();
 }
}
