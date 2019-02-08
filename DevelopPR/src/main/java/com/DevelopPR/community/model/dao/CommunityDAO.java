package com.DevelopPR.community.model.dao;

import java.util.List;

import com.DevelopPR.community.model.dto.CommunityVO;

public interface CommunityDAO 
{
	// 01. 
	public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
    
   // 02. 
   public void regist(CommunityVO vo) throws Exception;
   
   // 03.
   public CommunityVO detail(int bno) throws Exception;
   
   //04. 
   public CommunityVO modifyForm(int bno) throws Exception;

   //05. 
   public void modify(CommunityVO vo) throws Exception;
   
   //06. 
   public void remove(int bno) throws Exception;

   //07. 
   public void increaseViewcnt(int bno) throws Exception;
   
   //08. 
   public int countArticle(String searchOption, String keyword) throws Exception;

   public void reply(CommunityVO vo) throws Exception;
   
   public void addAttach(String fullName);
}
