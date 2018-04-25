package com.exam;

//기출문제 
public class Examlist {

 // pk 
 private Integer examlistid;

 // 종목코드(구분) 
 private String examcode;

 // 영역(과목) 
 private String domain;

 // 출제년도 
 private String year;

 // 회차 
 private String turn;

 // 교시 
 private String period;

 // 문제번호 
 private String examnum;

 // 문제지문 
 private String examdesc;

 // 문제보기 
 private String exambogi;

 // 1번 
 private String answer1;

 // 2번 
 private String answer2;

 // 3번 
 private String answer3;

 // 4번 
 private String answer4;

 // 5번 
 private String answer5;

 // 문제풀이 
 private String answerdesc;

 // 정답 
 private String answer;
 


// 문제 이미지
 private String examImg;
 
 //풀이 이미지
 private String answerImg;
 
 //소스 지문
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
 // Examlist 모델 복사
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
