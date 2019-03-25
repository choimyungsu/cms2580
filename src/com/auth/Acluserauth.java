package com.auth;

//사용자권한관리 
public class Acluserauth {

 // 사용자아이디 
 private String userId;

 // 권한코드 
 private String authCd;

 // 등록일 
 private String createDt;

 // 수정일 
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

 // Acluserauth 모델 복사
 public void CopyData(Acluserauth param)
 {
     this.userId = param.getUserId();
     this.authCd = param.getAuthCd();
     this.createDt = param.getCreateDt();
     this.updateDt = param.getUpdateDt();
 }
}
