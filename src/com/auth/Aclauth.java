package com.auth;

//���Ѱ��� 
public class Aclauth {

 // �����ڵ� 
 private String authCd;

 // ���Ѹ�Ī 
 private String authNm;

 // ���Ѽ��� 
 private String authDc;

 // ����� 
 private String createDt;

 // ������ 
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

 // Aclauth �� ����
 public void CopyData(Aclauth param)
 {
     this.authCd = param.getAuthCd();
     this.authNm = param.getAuthNm();
     this.authDc = param.getAuthDc();
     this.createDt = param.getCreateDt();
     this.updateDt = param.getUpdateDt();
 }
}