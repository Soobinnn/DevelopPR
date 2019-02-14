package com.DevelopPR.project.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.community.model.dto.CommunityVO;
import com.DevelopPR.project.dto.ProjectVO;
import com.DevelopPR.project.service.ProjectService;
import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
public class ProjectController 
{

@Inject
ProjectService projectService;
@Inject
UserService userService;

// 01. 프로젝트 등록 폼, 단순히 폼출력만을 위한 메소드이므로 서비스, DAO로 가지 않고 여기서 끝낸다.
@RequestMapping(value = "/project/registForm", method= RequestMethod.GET)
public String projectRegistForm(HttpSession session) throws Exception
{

	return "project/registForm";

}



//02. 프로젝트 등록 및 파일 업로드, registForm에서  post 방식으로 입력받은 값들을 service->dao->mapper를 통해 db에 등록한다.
@RequestMapping(value="/project/regist", method=RequestMethod.POST)
public String projectRegist(HttpSession session, @RequestParam(value="techstack", required=false) String techstack, @ModelAttribute ProjectVO vo) throws Exception
{

	  UserVO uservo = (UserVO)session.getAttribute("login");
	  vo.setEmail(uservo.getUserEmail());
	  projectService.regist(vo);
		
	  return "redirect:registForm"; //나중에 연결할 페이지를 수정해서 표시한다.
}



//02. 프로젝트 수정 폼
@RequestMapping("/project/modifyForm/{pno}")
public String projectModifyForm(@PathVariable("pno") int pno, Model model) throws Exception
{
	  System.out.println(pno);
	  model.addAttribute("dto", projectService.modifyForm(pno));

    return "/project/modifyForm";
}

@RequestMapping("/project/modify")
public String projectModify(@ModelAttribute ProjectVO vo, HttpSession session) throws Exception
{
	 UserVO uservo = (UserVO)session.getAttribute("login");
	
	 projectService.modify(vo);
	  
    return "redirect:/resume/detail/"+ uservo.getUserEmail() +"/";
}


//03. 프로젝트 삭제
@RequestMapping("/project/remove/{pno}")
public String projectRemove(@PathVariable("pno") int pno, HttpSession session) throws Exception
{
	 UserVO uservo = (UserVO)session.getAttribute("login");
		
	 projectService.remove(pno);
	  
	    return "redirect:/resume/detail/"+ uservo.getUserEmail() +"/";
}


//TechStack Ajax 통신
@RequestMapping(value="/project/autocomplete", method=RequestMethod.POST)
@ResponseBody
public List<ProjectVO> projectAutocomplete(@RequestParam("tech_name_input") String tech_name_input) throws Exception
{
	System.out.println(tech_name_input+"뷰에서 컨트롤러로 값을 가져오는가?");
//	리턴값으로 경로를 주면 안 되고 값을 담아서 전달할 매개변수를 전달해야 한다.
	

List<ProjectVO> result = projectService.lookup(tech_name_input);


return result;
} 


} //end of class