package com.visit;

//������Ʈ �湮 ��� 
public class Visit {

 // pk 
 private Integer visitId;

 // �湮�� 
 private String visitDt;

 // ����� 
 private String userId;

 // IP 
 private String userIp;

 public Integer getVisitId() {
     return visitId;
 }

 public void setVisitId(Integer visitId) {
     this.visitId = visitId;
 }

 public String getVisitDt() {
     return visitDt;
 }

 public void setVisitDt(String visitDt) {
     this.visitDt = visitDt;
 }

 public String getUserId() {
     return userId;
 }

 public void setUserId(String userId) {
     this.userId = userId;
 }

 public String getUserIp() {
     return userIp;
 }

 public void setUserIp(String userIp) {
     this.userIp = userIp;
 }

 // Visit �� ����
 public void CopyData(Visit param)
 {
     this.visitId = param.getVisitId();
     this.visitDt = param.getVisitDt();
     this.userId = param.getUserId();
     this.userIp = param.getUserIp();
 }
}