package com.DevelopPR.community.model.dao;

import java.util.List;

import com.DevelopPR.community.model.dto.ReplyVO;
 
public interface ReplyDAO {
    // 1. ��� �Է�
    public void create(ReplyVO vo);
    // 2. ��� ���
    public List<ReplyVO> list(Integer bno, int start, int end);
    // 3. ��� �󼼺���
    public ReplyVO detail(Integer rno);
    // 4. ��� ����
    public void update(ReplyVO vo);
    // 5. ��� ����
    public void delete(Integer rno);
    // 6. ��� ����
    public int count(Integer bno);
}