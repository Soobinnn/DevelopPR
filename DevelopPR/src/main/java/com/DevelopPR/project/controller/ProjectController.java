package com.DevelopPR.project.controller;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.project.dto.ProjectVO;
import com.DevelopPR.project.service.ProjectService;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
public class ProjectController 
{

@Inject
ProjectService projectService;
@Inject
UserService userService;

@Resource(name="uploadPath") //servlet-context에 있는 bean id="uploadPath 경로를 불러온다.
String uploadPath= "";
private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);




// 01. 프로젝트 등록 폼, 단순히 폼출력만을 위한 메소드이므로 서비스, DAO로 가지 않고 여기서 끝낸다.
@RequestMapping(value = "/project/registForm", method= RequestMethod.GET)
public String projectRegistForm(HttpSession session) throws Exception
{

	return "basic/project/registForm";

}



//02. 프로젝트 등록 및 파일 업로드, registForm에서  post 방식으로 입력받은 값들을 service->dao->mapper를 통해 db에 등록한다.
@RequestMapping(value="/project/regist", method=RequestMethod.POST)
public ModelAndView projectRegist(MultipartFile file, ModelAndView mav, HttpSession session, @RequestParam(value="techstack", required=false, defaultValue="none") String techstack, @RequestParam(value="pr_file_name", required=false, defaultValue="false") String pr_file_name, @RequestParam(value="project_image", required=false, defaultValue="false") String project_image,  @ModelAttribute ProjectVO vo) throws Exception
{

	
	UserVO uservo = (UserVO)session.getAttribute("login");          // 세션 값에서 받아서 형변환 후 uservo에 담는다.
	  String myemail = uservo.getUserEmail();                         // uservo형태의 이메일 값을 스트링 타입 변수인 myemail에 담는다.
	  vo.setEmail(uservo.getUserEmail());
	 
	  String Fname = file.getOriginalFilename(); 
	  
	  System.out.println("파일 이름 잘 갖고 오는지 확인!!!!!! : "+Fname);
	  
	  String file_name = uploadPath+file.getOriginalFilename();
	  String empty_value="파일 업로드가 없습니다.";
	  
	  if(Fname == null || Fname == "") {
		  
		vo.setPr_file_name(empty_value);
	  
	  } else if(Fname != null) {
		  vo.setPr_file_name(file_name); 
	  }

	  
      vo.setDownload_name(file.getOriginalFilename());
	  
	  vo.setNick(userService.viewId(myemail).getUserNick());          // 세션에서 Email값을 가져와서 email값과 일치하는 db의 닉네임을 가져와서 setNick에 넣는다.
     
       logger.info("파일이름 :"+file.getOriginalFilename());
 	  logger.info("파일크기 : "+file.getSize());
 	  logger.info("컨텐트 타입 : "+file.getContentType());
 	 

 	  String savedName = file.getOriginalFilename();      
	       
    
 	 if(Fname == null || Fname == "") {
		  savedName = "not_uploded.good";
 		
 	  } else if(Fname != null) {
 		 savedName = file.getOriginalFilename();
 	  }
     
     String pr_test= vo.getProject_image();
 	 if(pr_test == null || pr_test =="") {
 		 pr_test = "입력된 이미지가 없습니다.";
 		 vo.setProject_image(pr_test);
 	 } 
 	 
     projectService.regist(vo);
				 
     File target = new File(uploadPath, savedName);

	    // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
	    // FileCopyUtils.copy(바이트배열, 파일객체)
	    FileCopyUtils.copy(file.getBytes(), target);

	    mav.setViewName("redirect:/resume/detail/"+myemail+"/");
	    /* return "redirect:/resume/detail/"+ uservo.getUserEmail() +"/"; */
	    mav.addObject("savedName", savedName);

	    return mav; // registForm.jsp(결과화면)로 포워딩
	    
}

@RequestMapping(value="/project/registsuccess", method=RequestMethod.POST)
public String projectRegistsuccess(HttpSession session) throws Exception
{
	UserVO uservo = (UserVO)session.getAttribute("login");          // 세션 값에서 받아서 형변환 후 uservo에 담는다.
	 
	 return "redirect:/resume/detail/"+ uservo.getUserEmail() +"/";
}
//02. 프로젝트 수정 폼
@RequestMapping("/project/modifyForm/{pno}")
public String projectModifyForm(ProjectVO vo, @PathVariable("pno") int pno, Model model) throws Exception
{
	     

		/* vo.setDownload_name(file.getOriginalFilename()); */
	      vo = projectService.modifyForm(pno);
		  model.addAttribute("dto", vo);
    return "basic/project/modifyForm";
}

@RequestMapping(value="/project/modify", method=RequestMethod.POST)
public String projectModify(MultipartFile file, @ModelAttribute ProjectVO vo, @RequestParam(value="pr_file_name", required=false) String pr_file_name, HttpSession session) throws Exception
{
	
	UserVO uservo = (UserVO)session.getAttribute("login");          // 세션 값에서 받아서 형변환 후 uservo에 담는다.
	  String myemail = uservo.getUserEmail();  
	  String Fname = file.getOriginalFilename();
	  String file_name = uploadPath+file.getOriginalFilename();
	  String empty_value="파일 업로드가 없습니다.";
	  	 
	  
	  if(Fname == null || Fname == "") {
		  
			vo.setPr_file_name(empty_value);
		  
		  } else if(Fname != null) {
			  vo.setPr_file_name(file_name); 
		  }  
	  vo.setDownload_name(file.getOriginalFilename());
	
	
	vo.setPr_file_name(file_name); 
	  vo.setDownload_name(file.getOriginalFilename());
	  
	  vo.setNick(userService.viewId(myemail).getUserNick());
	  
	  logger.info("파일이름 :"+file.getOriginalFilename());
	  logger.info("파일크기 : "+file.getSize());
	  logger.info("컨텐트 타입 : "+file.getContentType());
      String savedName = file.getOriginalFilename();    
	 
      if(Fname == null || Fname == "") {
		  savedName = "not_uploded.good";
 		
 	  } else if(Fname != null) {
 		 savedName = file.getOriginalFilename();
 	  }
     
     String pr_test= vo.getProject_image();
 	 if(pr_test == null || pr_test =="") {
 		 pr_test = "입력된 이미지가 없습니다.";
 		 vo.setProject_image(pr_test);
 	 } 
      
	  projectService.modify(vo);
	  File target = new File(uploadPath, savedName);
     
	  // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
	  // FileCopyUtils.copy(바이트배열, 파일객체)
	  FileCopyUtils.copy(file.getBytes(), target);
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
//	리턴값으로 경로를 주면 안 되고 값을 담아서 전달할 매개변수를 전달해야 한다.
	

List<ProjectVO> result = projectService.lookup(tech_name_input);
return result;
} 


@RequestMapping("/project/detail/{pno}")
public String projectDetail(ProjectVO vo, @PathVariable("pno") int pno, Model model) throws Exception{
	 vo = projectService.detail(pno);
	  model.addAttribute("dto", vo);
	
	 
	return "basic/project/detail";
}


} //end of class