package com.exam;

//시험관련 목차(범위) 
public class Examcontents {

 // pk 
 private Integer examcontentsid;

 // 시험코드 
 private String examcode;

 // 시퀀스 
 private String seq;
 
 // 영역 
 private String domain;

 // 목차 
 private String subject;
 
 //linkUrl
 private String linkurl;

 public String getLinkurl() {
	return linkurl;
}

public void setLinkurl(String linkurl) {
	this.linkurl = linkurl;
}

public String getDomain() {
    return domain;
}

public void setDomain(String domain) {
    this.domain = domain;
}

public Integer getExamcontentsid() {
     return examcontentsid;
 }

 public void setExamcontentsid(Integer examcontentsid) {
     this.examcontentsid = examcontentsid;
 }

 public String getExamcode() {
     return examcode;
 }

 public void setExamcode(String examcode) {
     this.examcode = examcode;
 }

 public String getSeq() {
     return seq;
 }

 public void setSeq(String seq) {
     this.seq = seq;
 }

 public String getSubject() {
     return subject;
 }

 public void setSubject(String subject) {
     this.subject = subject;
 }

 // Examcontents 모델 복사
 public void CopyData(Examcontents param)
 {
     this.examcontentsid = param.getExamcontentsid();
     this.examcode = param.getExamcode();
     this.seq = param.getSeq();
     this.subject = param.getSubject();
     this.linkurl = param.getLinkurl();
     this.domain = param.getDomain();
 }
 
 
}
