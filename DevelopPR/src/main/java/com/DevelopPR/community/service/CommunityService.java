package com.DevelopPR.community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.DevelopPR.community.model.dto.CommunityVO;
 
public interface CommunityService 
{
    //01. �Խñ� ��� �ҷ�����
	public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	// 02. �Խñ� �ۼ�
    public void regist(CommunityVO vo) throws Exception;
    
    // 03. �Խñ� �󼼺���
    public CommunityVO detail(int bno) throws Exception;
    
    // 04. �Խñ� ���� �� �ҷ�����
    public CommunityVO modifyForm(int bno) throws Exception;

    // 05. �Խñ� ����
    public void modify(CommunityVO vo) throws Exception;
    
   // 06. �Խñ� ����
    public void remove(int bno) throws Exception;
    
    // 07. �Խñ� ��ȸ�� ����
    public void increaseViewcnt(int bno, HttpSession session) throws Exception;
 
     // 08. �Խñ� ���ڵ� ���� �޼ҵ�
    public int countArticle(String searchOption, String keyword) throws Exception;
}