package com.exam;

//������� ����(����) 
public class Examcontents {

 // pk 
 private Integer examcontentsid;

 // �����ڵ� 
 private String examcode;

 // ������ 
 private String seq;
 
 // ���� 
 private String domain;

 // ���� 
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

 // Examcontents �� ����
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
