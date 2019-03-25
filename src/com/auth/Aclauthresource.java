package com.auth;

//권한별 리소스 관리 
public class Aclauthresource {

 // 권한코드 
 private String authCd;

 // 리소스코드 
 private String resourceCd;
 
 // 리소스명칭 
 private String resourceNm;


// 사용여부 
 private String useYn;

 // 생성권한 
 private String createYn;

 // 읽기권한 
 private String readYn;

 // 수정권한 
 private String updateYn;

 // 삭제권한 
 private String deleteYn;

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

 public String getResourceCd() {
     return resourceCd;
 }

 public void setResourceCd(String resourceCd) {
     this.resourceCd = resourceCd;
 }

 public String getUseYn() {
     return useYn;
 }

 public void setUseYn(String useYn) {
     this.useYn = useYn;
 }

 public String getCreateYn() {
     return createYn;
 }

 public void setCreateYn(String createYn) {
     this.createYn = createYn;
 }

 public String getReadYn() {
     return readYn;
 }

 public void setReadYn(String readYn) {
     this.readYn = readYn;
 }

 public String getUpdateYn() {
     return updateYn;
 }

 public void setUpdateYn(String updateYn) {
     this.updateYn = updateYn;
 }

 public String getDeleteYn() {
     return deleteYn;
 }

 public void setDeleteYn(String deleteYn) {
     this.deleteYn = deleteYn;
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
 
 public String getResourceNm() {
	return resourceNm;
}

public void setResourceNm(String resourceNm) {
	this.resourceNm = resourceNm;
}
 // Aclauthresource 모델 복사
 public void CopyData(Aclauthresource param)
 {
     this.authCd = param.getAuthCd();
     this.resourceCd = param.getResourceCd();
     this.resourceNm = param.getResourceNm();
     this.useYn = param.getUseYn();
     this.createYn = param.getCreateYn();
     this.readYn = param.getReadYn();
     this.updateYn = param.getUpdateYn();
     this.deleteYn = param.getDeleteYn();
     this.createDt = param.getCreateDt();
     this.updateDt = param.getUpdateDt();
 }
}