package com.DevelopPR.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.project.dto.ProjectVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO
{

@Inject
SqlSession sqlSession;
	
	

// 프로젝트 등록
@Override
public void regist(ProjectVO vo) throws Exception
{
	sqlSession.insert("project.insert", vo);
}

// 프로젝트 수정

@Override	
public void modify(ProjectVO vo) throws Exception
{
	sqlSession.update("project.modify", vo);
}
	
@Override
public ProjectVO modifyForm(int pno) throws Exception {
	return sqlSession.selectOne("project.modifyForm", pno);
}

//프로젝트 삭제
@Override	
public void remove(int pno) throws Exception
{
	sqlSession.delete("project.remove", pno);
}

//프로젝트명 등록
@Override
public List<ProjectVO> lookup(String tech_name_input) throws Exception
{
List<ProjectVO> listLook = sqlSession.selectList("project.lookup", tech_name_input);
return listLook;

}

@Override
public List<ProjectVO> projectList(String email) throws Exception {
		return sqlSession.selectList("project.projectlist", email);
}
public ProjectVO detail(int pno) throws Exception{
	return sqlSession.selectOne("project.detail", pno);
}

	
} // end of class
