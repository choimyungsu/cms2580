package com.user;

public class User {

	
    // ���̵� 
    private String userid;

    // �н����� 
    private String password;

    // �̸� 
    private String username;

    // �̸��� 
    private String email;

    // Ż�𿩺� 
    private Integer available;
    
    // ������ 
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

    // User �� ����
    public void CopyData(User param)
    {
        this.userid = param.getUserid();
        this.password = param.getPassword();
        this.username = param.getUsername();
        this.email = param.getEmail();
        this.available = param.getAvailable();
    }
}