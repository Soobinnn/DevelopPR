package com.DevelopPR.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.DevelopPR.project.dao.ProjectDAO;
import com.DevelopPR.project.dto.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService
{
@Inject
ProjectDAO projectDao;
	
	
@Override
public void regist(ProjectVO vo) throws Exception
{
	projectDao.regist(vo);
}

@Override
public ProjectVO modifyForm(int pno) throws Exception {
	return projectDao.modifyForm(pno);
}

@Override
public void modify(ProjectVO vo) throws Exception
{
	projectDao.modify(vo);
}


@Override
public void remove(int pno) throws Exception
{
	projectDao.remove(pno);
}

@Override
public List<ProjectVO> lookup(String tech_name_input) throws Exception
{
	List<ProjectVO> RV = projectDao.lookup(tech_name_input); 
	
	
  return RV;

}

@Override
public List<ProjectVO> projectList(String email) throws Exception {
	return projectDao.projectList(email);
}
public ProjectVO detail(int pno) throws Exception{
	return projectDao.detail(pno);
}

}