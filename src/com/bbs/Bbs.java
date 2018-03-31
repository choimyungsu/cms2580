package com.bbs;


//단순게시판 
public class Bbs {

	private Integer bbsid;
	
	private String bbstitle;
	
	private String userid;
	
	private String bbsdate;
	
	private String bbscontent;
	
	private Integer bbsavailable;
	
	public Integer getBbsid() {
	   return bbsid;
	}
	
	public void setBbsid(Integer bbsid) {
	   this.bbsid = bbsid;
	}
	
	public String getBbstitle() {
	   return bbstitle;
	}
	
	public void setBbstitle(String bbstitle) {
	   this.bbstitle = bbstitle;
	}
	
	public String getUserid() {
	   return userid;
	}
	
	public void setUserid(String userid) {
	   this.userid = userid;
	}
	
	public String getBbsdate() {
	   return bbsdate;
	}
	
	public void setBbsdate(String bbsdate) {
	   this.bbsdate = bbsdate;
	}
	
	public String getBbscontent() {
	   return bbscontent;
	}
	
	public void setBbscontent(String bbscontent) {
	   this.bbscontent = bbscontent;
	}
	
	public Integer getBbsavailable() {
	   return bbsavailable;
	}
	
	public void setBbsavailable(Integer bbsavailable) {
	   this.bbsavailable = bbsavailable;
	}
	
	// Bbs 모델 복사
	public void CopyData(Bbs param)
	{
	   this.bbsid = param.getBbsid();
	   this.bbstitle = param.getBbstitle();
	   this.userid = param.getUserid();
	   this.bbsdate = param.getBbsdate();
	   this.bbscontent = param.getBbscontent();
	   this.bbsavailable = param.getBbsavailable();
	}
}
