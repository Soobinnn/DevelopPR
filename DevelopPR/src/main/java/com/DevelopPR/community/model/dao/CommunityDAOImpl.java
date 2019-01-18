package com.DevelopPR.community.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.community.model.dto.CommunityVO;

@Repository    // ���� Ŭ������ dao bean���� ���
public class CommunityDAOImpl implements CommunityDAO 
{
   @Inject
   SqlSession SqlSession;
   
   //01. �Խñ� ��ü ���
   @Override
   public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
       // �˻��ɼ�, Ű���� �ʿ� ����
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("searchOption", searchOption);
       map.put("keyword", keyword);
       // BETWEEN #{start}, #{end}�� �Էµ� ���� �ʿ� 
       map.put("start", start);
       map.put("end", end);
       return SqlSession.selectList("community.listAll", map);
   }
   
   //02. �Խñ� �ۼ�
   @Override
   public void regist(CommunityVO vo) throws Exception 
   {
       SqlSession.insert("community.insert", vo);
   }
   
   //03. �Խñ� �󼼺���
   @Override
   public CommunityVO detail(int bno) throws Exception 
   {
       return SqlSession.selectOne("community.view", bno);
   }
   //04. �Խñ� ���� �� �ҷ�����
   @Override
   public CommunityVO modifyForm(int bno)
   {
   	return SqlSession.selectOne("community.updateForm", bno);
   }
   
   //05. �Խñ� ����
   @Override
   public void modify(CommunityVO vo) throws Exception 
   {
       SqlSession.update("community.updateArticle", vo);
   }
   
   //06. �Խñ� ����
   @Override
   public void remove(int bno) throws Exception 
   {
       SqlSession.delete("community.deleteArticle",bno);
   }

   //07. �Խñ� ��ȸ�� ����
   @Override
   public void increaseViewcnt(int bno) throws Exception 
   {
       SqlSession.update("community.increaseViewcnt", bno);
   }
   
   // 08. �Խñ� ���ڵ� ����
   @Override
   public int countArticle(String searchOption, String keyword) throws Exception {
    // �˻��ɼ�, Ű���� �ʿ� ����
    Map<String, String> map = new HashMap<String, String>();
    map.put("searchOption", searchOption);
    map.put("keyword", keyword);
    return SqlSession.selectOne("community.countArticle", map);
  }
}
