package com.DevelopPR.community.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.DevelopPR.community.model.dao.CommunityDAO;
import com.DevelopPR.community.model.dto.CommunityVO;
 
@Service
public class CommunityServiceImpl implements CommunityService 
{    
    @Inject
    CommunityDAO communityDao;
    
    
    // 01. 
    @Override
    public List<CommunityVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
        return communityDao.listAll(start, end, searchOption, keyword);
    }
    
    
    // 
    @Override
    public void regist(CommunityVO vo) throws Exception 
    {
        String title = vo.getTitle();
        String content = vo.getContent();
        String writer = vo.getWriter();
        
        title = title.replace("<", "&lt;");
        title = title.replace("<", "&gt;");
        writer = writer.replace("<", "&lt;");
        writer = writer.replace("<", "&gt;");
        
        title = title.replace("  ",    "&nbsp;&nbsp;");
        writer = writer.replace("  ",    "&nbsp;&nbsp;");
       
        content = content.replace("\n", "<br>");
        vo.setTitle(title);
        vo.setContent(content);
        vo.setWriter(writer);
        communityDao.regist(vo);
    }
    
    // 03. �Խñ� �󼼺���
    @Override
    public CommunityVO detail(int bno) throws Exception 
    {
        return communityDao.detail(bno);
    }
    
    //04. �Խñ� ���� �� �ҷ�����
    @Override
    public CommunityVO modifyForm(int bno) throws Exception
    {
    	return communityDao.modifyForm(bno);
    }
    
    //05. �Խñ� ����
    @Override
    public void modify(CommunityVO vo) throws Exception 
    {
      communityDao.modify(vo);
    }
    
    //06. �Խñ� ����
    @Override
    public void remove(int bno) throws Exception 
    {
        communityDao.remove(bno);
    }
    // 07. �Խñ� ��ȸ�� ����
    @Override
    public void increaseViewcnt(int bno, HttpSession session) throws Exception 
    {
        long update_time = 0;
        // ���ǿ� ����� ��ȸ�ð� �˻�
        // ���ʷ� ��ȸ�� ��� ���ǿ� ����� ���� ���� ������ if���� ����X
        if(session.getAttribute("update_time_"+bno) != null)
        {
                                // ���ǿ��� �о����
         /*  update_time = (long)session.getAttribute("update_time_"+bno);*/
        }
        // �ý����� ����ð��� current_time�� ����
        long current_time = System.currentTimeMillis();
        // �����ð��� ��� �� ��ȸ�� ���� ó�� 24*60*60*1000(24�ð�)
        // �ý�������ð� - �����ð� > �����ð�(��ȸ�� ������ �����ϵ��� ������ �ð�)
        if(current_time - update_time > 5*1000){
            communityDao.increaseViewcnt(bno);
            // ���ǿ� �ð��� ���� : "update_time_"+bno�� �ٸ������� �ߺ����� �ʰ� ����� ��
            session.setAttribute("update_time_"+bno, current_time);
            
        }
    }
    // 08. �Խñ� ���ڵ� ���� communityDao.countArticle�޼��� 
    @Override
    public int countArticle(String searchOption, String keyword) throws Exception {
        return communityDao.countArticle(searchOption, keyword);
    }
    
    @Override
    public void reply(CommunityVO vo) throws Exception{
    	communityDao.reply(vo);
    }
}