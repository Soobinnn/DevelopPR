package com.DevelopPR.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.DevelopPR.community.model.dao.ReplyDAO;
import com.DevelopPR.community.model.dto.ReplyVO;
 
@Service
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    ReplyDAO replyDao;
    
    // ��� ���
    @Override
    public List<ReplyVO> list(Integer bno) {
        return replyDao.list(bno);
    }
    // ��� �ۼ�
    @Override
    public void create(ReplyVO vo) {
        replyDao.create(vo);
    }
    // ��� ����
    @Override
    public void update(ReplyVO vo) {
        // TODO Auto-generated method stub
 
    }
    // ��� ����
    @Override
    public void delete(Integer rno) {
        // TODO Auto-generated method stub
 
    }
 
}