package com.file;

public class Linkfile {

	
    // pk 
    private Integer linkfileid;

    // ���ᰴü(���̺�) 
    private String objectlink;

    // ���ᰴüPK 
    private String objectlinkpk;

    // ���ϸ� 
    private String filename;

    private String realfilename;

    // ��� 
    private String filepath;

    // �ٿ�ε�� 
    private Integer downloadcnt;

    public Integer getLinkfileid() {
        return linkfileid;
    }

    public void setLinkfileid(Integer linkfileid) {
        this.linkfileid = linkfileid;
    }

    public String getObjectlink() {
        return objectlink;
    }

    public void setObjectlink(String objectlink) {
        this.objectlink = objectlink;
    }

    public String getObjectlinkpk() {
        return objectlinkpk;
    }

    public void setObjectlinkpk(String objectlinkpk) {
        this.objectlinkpk = objectlinkpk;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getRealfilename() {
        return realfilename;
    }

    public void setRealfilename(String realfilename) {
        this.realfilename = realfilename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public Integer getDownloadcnt() {
        return downloadcnt;
    }

    public void setDownloadcnt(Integer downloadcnt) {
        this.downloadcnt = downloadcnt;
    }

    // Linkfile �� ����
    public void CopyData(Linkfile param)
    {
        this.linkfileid = param.getLinkfileid();
        this.objectlink = param.getObjectlink();
        this.objectlinkpk = param.getObjectlinkpk();
        this.filename = param.getFilename();
        this.realfilename = param.getRealfilename();
        this.filepath = param.getFilepath();
        this.downloadcnt = param.getDownloadcnt();
    }
    public Linkfile()
    {
    	
    }
	public Linkfile(Integer linkfileid, String objectlink, String objectlinkpk,String filename, String realfilename, String filepath, int downloadcnt) {
		super();
		this.linkfileid = linkfileid;
		this.filename = filename;
		this.realfilename = realfilename;
		this.downloadcnt = downloadcnt;
		this.filepath = filepath;
		this.objectlink = objectlink;
		this.objectlinkpk = objectlinkpk;
	}
    
    
    
    
}
