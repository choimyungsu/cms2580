package com.auth;

//����ڱ��Ѱ��� 
public class Acluserauth {

 // ����ھ��̵� 
 private String userId;

 // �����ڵ� 
 private String authCd;

 // ����� 
 private String createDt;

 // ������ 
 private String updateDt;

 public String getUserId() {
     return userId;
 }

 public void setUserId(String userId) {
     this.userId = userId;
 }

 public String getAuthCd() {
     return authCd;
 }

 public void setAuthCd(String authCd) {
     this.authCd = authCd;
 }

 public String getCreateDt() {
     return createDt;
 }

 public void setCreateDt(String createDt) {
     this.createDt = createDt;
 }

 public String getUpdateDt() {
     return updateDt;
 }

 public void setUpdateDt(String updateDt) {
     this.updateDt = updateDt;
 }

 // Acluserauth �� ����
 public void CopyData(Acluserauth param)
 {
     this.userId = param.getUserId();
     this.authCd = param.getAuthCd();
     this.createDt = param.getCreateDt();
     this.updateDt = param.getUpdateDt();
 }
}
