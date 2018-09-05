package com.book;

public class Book {

    // id 
    private Integer id;

    // 제목 
    private String title;

    // 저자 
    private String author;

    // 생성일 
    private String cdate;

    // 커버이미지 
    private String mainImgUrl;

    // 변경일 
    private String udate;

    // 분류 
    private String catagory;

    // 상태(open or not) 
    private String status;

    // 발행일 
    private String pdate;
    
    // 책 설명  
    private String description;

    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    public String getMainImgUrl() {
        return mainImgUrl;
    }

    public void setMainImgUrl(String mainImgUrl) {
        this.mainImgUrl = mainImgUrl;
    }

    public String getUdate() {
        return udate;
    }

    public void setUdate(String udate) {
        this.udate = udate;
    }

    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPdate() {
        return pdate;
    }

    public void setPdate(String pdate) {
        this.pdate = pdate;
    }

    // BMasterTb 모델 복사
    public void CopyData(Book param)
    {
        this.id = param.getId();
        this.title = param.getTitle();
        this.author = param.getAuthor();
        this.cdate = param.getCdate();
        this.mainImgUrl = param.getMainImgUrl();
        this.udate = param.getUdate();
        this.catagory = param.getCatagory();
        this.status = param.getStatus();
        this.pdate = param.getPdate();
    }
}