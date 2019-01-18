package com.DevelopPR.community.model.dao;

import java.util.List;

import com.DevelopPR.community.model.dto.ReplyVO;
 
public interface ReplyDAO {
    // ��� ���
    public List<ReplyVO> list(Integer bno);
    // ��� �Է�
    public void create(ReplyVO vo);
    // ��� ����
    public void update(ReplyVO vo);
    // ��� ����
    public void delete(Integer rno);
}