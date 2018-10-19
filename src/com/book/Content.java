package com.book;


public class Content {

    // id 
    private Integer id;
    
    // pid �θ�id
    private Integer pid;    

    public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	// å������id 
    private String bookId;

    // ���� 
    private String order;

    // ���� 
    private String seq;

    // ���� 
    private String text;

    // ������ 
    private String cDate;

    // ������ 
    private String uDate;

    // ������ 
    private String pDate;

    // ��ǥ�̹��� 
    private String contentsImgUrl;

    // contents ���� 
    private String title;
    
    // ��ȸ�� 
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

    // BContentsTb �� ����
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