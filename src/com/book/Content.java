package com.book;


public class Content {

    // id 
    private Integer id;
    
    // pid 부모id
    private Integer pid;    

    public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	// 책마스터id 
    private String bookId;

    // 목차 
    private String order;

    // 순서 
    private String seq;

    // 내용 
    private String text;

    // 생성일 
    private String cDate;

    // 변경일 
    private String uDate;

    // 발행일 
    private String pDate;

    // 대표이미지 
    private String contentsImgUrl;

    // contents 제목 
    private String title;
    
    // 조회수 
    private String cnt;

    public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getCDate() {
        return cDate;
    }

    public void setCDate(String cDate) {
        this.cDate = cDate;
    }

    public String getUDate() {
        return uDate;
    }

    public void setUDate(String uDate) {
        this.uDate = uDate;
    }

    public String getPDate() {
        return pDate;
    }

    public void setPDate(String pDate) {
        this.pDate = pDate;
    }

    public String getContentsImgUrl() {
        return contentsImgUrl;
    }

    public void setContentsImgUrl(String contentsImgUrl) {
        this.contentsImgUrl = contentsImgUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    // BContentsTb 모델 복사
    public void CopyData(Content param)
    {
        this.id = param.getId();
        this.bookId = param.getBookId();
        this.order = param.getOrder();
        this.seq = param.getSeq();
        this.text = param.getText();
        this.cDate = param.getCDate();
        this.uDate = param.getUDate();
        this.pDate = param.getPDate();
        this.contentsImgUrl = param.getContentsImgUrl();
        this.title = param.getTitle();
    }
}