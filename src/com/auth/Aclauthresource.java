package com.auth;

//���Ѻ� ���ҽ� ���� 
public class Aclauthresource {

 // �����ڵ� 
 private String authCd;

 // ���ҽ��ڵ� 
 private String resourceCd;
 
 // ���ҽ���Ī 
 private String resourceNm;


// ��뿩�� 
 private String useYn;

 // �������� 
 private String createYn;

 // �б���� 
 private String readYn;

 // �������� 
 private String updateYn;

 // �������� 
 private String deleteYn;

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
 // Aclauthresource �� ����
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