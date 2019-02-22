package com.DevelopPR.community.model.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class CommunityVO {
    
	private int bno;            
    

    @NotNull(message="제목을 입력해주세요.")
    @NotEmpty(message="제목을 입력해주세요.")
    @Size(min=1, max=99, message="제목은 1자 이상, 99자 이하로 입력해주세요.")
    private String title;      
    
    @NotNull(message="글 내용을 입력해주세요.")
    @NotEmpty(message="글 내용을 입력해주세요.")
    @Size(min=1, max=2000, message="제목은 1자 이상, 2000자 이하로 입력해주세요.")
    private String content;        
    
    private String writer;        
    private String userName;     
    private Date regdate;         
    private int viewcnt;         
    private int recnt;             
    private String[] files;      // 파일 업로드 추가
    
////////////////대댓글용 매개변수 추가////////////////    
    private String reparent;     //부모
    private String redepth;      //깊이
    private Integer reorder;     //순서


    
    int remove; //
    
    
    
    
	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	

	public String getReparent() {
		return reparent;
	}

	public void setReparent(String reparent) {
		this.reparent = reparent;
	}

	public String getRedepth() {
		return redepth;
	}

	public void setRedepth(String redepth) {
		this.redepth = redepth;
	}

	public Integer getReorder() {
		return reorder;
	}

	public void setReorder(Integer reorder) {
		this.reorder = reorder;
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
