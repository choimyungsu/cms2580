package com.auth;

//���ҽ� ���� 
public class Aclresource {

 // ���ҽ��ڵ� 
 private String resourceCd;

 
 // ���ҽ���Ī 
 private String resourceNm;

 // ���� 
 private String resourceDc;

 // ���� 
 private String resourceUrl;

 // ����� 
 private String createDt;

 // ������ 
 private String updateDt;

 public String getResourceCd() {
     return resourceCd;
 }

 public void setResourceCd(String resourceCd) {
     this.resourceCd = resourceCd;
 }

 public String getResourceNm() {
     return resourceNm;
 }

 public void setResourceNm(String resourceNm) {
     this.resourceNm = resourceNm;
 }

 public String getResourceDc() {
     return resourceDc;
 }

 public void setResourceDc(String resourceDc) {
     this.resourceDc = resourceDc;
 }

 public String getResourceUrl() {
     return resourceUrl;
 }

 public void setResourceUrl(String resourceUrl) {
     this.resourceUrl = resourceUrl;
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

 // Aclresource �� ����
 public void CopyData(Aclresource param)
 {
     this.resourceCd = param.getResourceCd();
     this.resourceNm = param.getResourceNm();
     this.resourceDc = param.getResourceDc();
     this.resourceUrl = param.getResourceUrl();
     this.createDt = param.getCreateDt();
     this.updateDt = param.getUpdateDt();
 }
}