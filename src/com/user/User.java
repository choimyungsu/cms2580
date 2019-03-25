package com.user;

public class User {

	
    // 아이디 
    private String userid;

    // 패스워드 
    private String password;

    // 이름 
    private String username;

    // 이메일 
    private String email;

    // 탈퇴여부 
    private Integer available;
    
    // 가입일 
    private String joinDate;
    

    public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    // User 모델 복사
    public void CopyData(User param)
    {
        this.userid = param.getUserid();
        this.password = param.getPassword();
        this.username = param.getUsername();
        this.email = param.getEmail();
        this.available = param.getAvailable();
    }
}