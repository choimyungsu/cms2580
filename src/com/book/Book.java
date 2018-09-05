package com.book;

public class Book {

    // id 
    private Integer id;

    // ���� 
    private String title;

    // ���� 
    private String author;

    // ������ 
    private String cdate;

    // Ŀ���̹��� 
    private String mainImgUrl;

    // ������ 
    private String udate;

    // �з� 
    private String catagory;

    // ����(open or not) 
    private String status;

    // ������ 
    private String pdate;
    
    // å ����  
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

    // BMasterTb �� ����
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