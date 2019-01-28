package com.DevelopPR.resume.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.DevelopPR.resume.model.dao.ResumeDAO;
import com.DevelopPR.resume.model.dto.ResumeVO; 

@Service
public class ResumeServiceImpl implements ResumeService{
	@Inject
	ResumeDAO resumeDAO;
	
	//이력서 목록보기
	@Override
	public List<ResumeVO> resumeList(int start, int end, String searchOption, String keyword) throws Exception {
		return resumeDAO.resumeList(start, end, searchOption, keyword);
	}
	//이력서 목록보기에서 레코드 갯수  메서드 추가 (검색된 자료의 갯수 출력)
	@Override
    public int countArticle(String searchOption, String keyword) throws Exception {
        return resumeDAO.countArticle(searchOption, keyword);
    }
	
	
	
	
	//이력서 등록 처리
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		   System.out.println(vo.toString());
	       resumeDAO.resumeRegistConfirm(vo);
	}
	//이력서 상세보기
	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return resumeDAO.resumeDetail(email);
	}
	
	//이력서 수정하기
	@Override
	public void resumeModify(ResumeVO vo) throws Exception {
		System.out.println(vo.toString());
		resumeDAO.resumeModify(vo);
	}
	
	
	//목록에서 이미지 가져오기
	@Override
	public List<ResumeVO> mainList() throws Exception {
		return resumeDAO.mainList();
	}
	
	
	
	

}
