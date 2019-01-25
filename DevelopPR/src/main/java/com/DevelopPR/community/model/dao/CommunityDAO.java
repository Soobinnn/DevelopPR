package com.DevelopPR.community.model.dao;

import java.util.List;

import com.DevelopPR.community.model.dto.CommunityVO;

public interface CommunityDAO 
{
	// 01. �Խñ� ��ü ��� ==> �˻��ɼ�, Ű���� �Ű����� �߰�
	public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
    
   // 02. �Խñ� �ۼ�(���)
   public void regist(CommunityVO vo) throws Exception;
   
   // 03. �Խñ� �󼼺���
   public CommunityVO detail(int bno) throws Exception;
   
   //04. �Խñ� ���� �� �ҷ�����
   public CommunityVO modifyForm(int bno) throws Exception;

   //05. �Խñ� ����
   public void modify(CommunityVO vo) throws Exception;
   
   //06. �Խñ� ����
   public void remove(int bno) throws Exception;

   //07. �Խñ� ��ȸ ����
   public void increaseViewcnt(int bno) throws Exception;
   
   //08. �Խñ� ���ڵ� ���� �޼ҵ�
   public int countArticle(String searchOption, String keyword) throws Exception;

   public void reply(CommunityVO vo) throws Exception;
}
