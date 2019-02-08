package com.DevelopPR.community.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.community.model.dto.CommunityVO;

@Repository  
public class CommunityDAOImpl implements CommunityDAO 
{
   @Inject
   SqlSession SqlSession;
   
 
   @Override
   public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
       // 
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("searchOption", searchOption);
       map.put("keyword", keyword);
       // BETWEEN #{start}, #{end}�� �Էµ� ���� �ʿ� 
       map.put("start", start);
       map.put("end", end);
       return SqlSession.selectList("community.listAll", map);
   }
   
  
   @Override
   public void regist(CommunityVO vo) throws Exception 
   {
       SqlSession.insert("community.insert", vo);
   }
   
   
   @Override
   public CommunityVO detail(int bno) throws Exception 
   {
       return SqlSession.selectOne("community.view", bno);
   }
  
   @Override
   public CommunityVO modifyForm(int bno)
   {
   	return SqlSession.selectOne("community.updateForm", bno);
   }
   
   //05. 
   @Override
   public void modify(CommunityVO vo) throws Exception 
   {
       SqlSession.update("community.updateArticle", vo);
   }
   
   //06. 
   @Override
   public void remove(int bno) throws Exception 
   {
       SqlSession.delete("community.deleteArticle",bno);
   }

   //07.
   @Override
   public void increaseViewcnt(int bno) throws Exception 
   {
       SqlSession.update("community.increaseViewcnt", bno);
   }
   
   // 08. 
   @Override
   public int countArticle(String searchOption, String keyword) throws Exception {
    // 
    Map<String, String> map = new HashMap<String, String>();
    map.put("searchOption", searchOption);
    map.put("keyword", keyword);
    return SqlSession.selectOne("community.countArticle", map);
  }

   @Override
   public void reply(CommunityVO vo) throws Exception 
   {
     // transaction 
     // update step+1

       SqlSession.update("reboard.addStep", vo);

       // insert
       SqlSession.insert("reboard.reply", vo);
    }


   @Override
   public void addAttach(String fullName) {
       SqlSession.insert("board.addAttach", fullName);
   }


}
