package com.user;

public class Useranswerdesc {

    // pk 
    private Integer useranswerdescid;

    // userID 
    private String userid;

    // 문제고유번호 
    private Integer examlistid;

    // 해설 
    private String answerdesc;

    public Integer getUseranswerdescid() {
        return useranswerdescid;
    }

    public void setUseranswerdescid(Integer useranswerdescid) {
        this.useranswerdescid = useranswerdescid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getExamlistid() {
        return examlistid;
    }

    public void setExamlistid(Integer examlistid) {
        this.examlistid = examlistid;
    }

    public String getAnswerdesc() {
        return answerdesc;
    }

    public void setAnswerdesc(String answerdesc) {
        this.answerdesc = answerdesc;
    }

    // Useranswerdesc 모델 복사
    public void CopyData(Useranswerdesc param)
    {
        this.useranswerdescid = param.getUseranswerdescid();
        this.userid = param.getUserid();
        this.examlistid = param.getExamlistid();
        this.answerdesc = param.getAnswerdesc();
    }
    
}
