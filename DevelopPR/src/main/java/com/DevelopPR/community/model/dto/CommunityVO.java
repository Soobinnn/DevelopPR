package com.DevelopPR.community.model.dto;


import java.util.Date;

public class CommunityVO {
    private int bno;            // 
    private String title;        //
    private String content;        //
    private String writer;        // 
    private String userName;    // 
    private Date regdate;        // 
    private int viewcnt;        // 
    private int recnt;            // 
    private String[] files;      // 파일 업로드 추가
    
    private int originNo;
    
    
    private int groupOrd;
 
    
    private int groupLayer;
    
    int remove; //
    
    
    
    
	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public int getOriginNo() {
		return originNo;
	}

	public void setOriginNo(int originNo) {
		this.originNo = originNo;
	}

	public int getGroupOrd() {
		return groupOrd;
	}

	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}

	public int getGroupLayer() {
		return groupLayer;
	}

	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}
	

	// Getter/Setter
    public int getBno() {
        return bno;
    }
 
    public int getRemove() {
		return remove;
	}

	public void setRemove(int remove) {
		this.remove = remove;
	}

	
	public void setBno(int bno) {
        this.bno = bno;
    }
 
    public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
        this.title = title;
    }
 
    public String getContent() {
        return content;
    }
 
    public void setContent(String content) {
        this.content = content;
    }
 
    public String getWriter() {
        return writer;
    }
 
    public void setWriter(String writer) {
        this.writer = writer;
    }
 
    public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public Date getRegdate() {
        return regdate;
    }
 
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
 
    public int getViewcnt() {
        return viewcnt;
    }
 
    public void setViewcnt(int viewcnt) {
        this.viewcnt = viewcnt;
    }
 
    public int getRecnt() {
        return recnt;
    }
 
    public void setRecnt(int recnt) {
        this.recnt = recnt;
    }
    // toString()
    @Override
    public String toString() {
        return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
                + ", userName=" + userName + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", recnt=" + recnt
                + ", files=" + files + "]";
    }
        
}
