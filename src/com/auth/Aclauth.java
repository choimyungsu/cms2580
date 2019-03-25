package com.auth;

//권한관리 
public class Aclauth {

 // 권한코드 
 private String authCd;

 // 권한명칭 
 private String authNm;

 // 권한설명 
 private String authDc;

 // 등록일 
 private String createDt;

 // 수정일 
 private String updateDt;

 public String getAuthCd() {
     return authCd;
 }

 public void setAuthCd(String authCd) {
     this.authCd = authCd;
 }

 public String getAuthNm() {
     return authNm;
 }

 public void setAuthNm(String authNm) {
     this.authNm = authNm;
 }

 public String getAuthDc() {
     return authDc;
 }

 public void setAuthDc(String authDc) {
     this.authDc = authDc;
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

 // Aclauth 모델 복사
 public void CopyData(Aclauth param)
 {
     this.authCd = param.getAuthCd();
     this.authNm = param.getAuthNm();
     this.authDc = param.getAuthDc();
     this.createDt = param.getCreateDt();
     this.updateDt = param.getUpdateDt();
 }
}