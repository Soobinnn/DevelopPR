package com.DevelopPR.resume.controller;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.photo.FileUtil;
import com.DevelopPR.resume.service.ResumeService;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/resume/*")
public class ResumeController {
  
	@Inject
	ResumeService resumeService; 
	
	//이력서 목록 폼 보기
	@RequestMapping("list")
	public ModelAndView resumeList() throws Exception{	

	 List<ResumeVO> list = resumeService.resumeList();
	
	 ModelAndView mav = new ModelAndView();
     mav.addObject("list", list); 
     mav.setViewName("basic/resume/list");
     System.out.println(list);
	   return mav;
	}
	
	//이력서 등록 폼 보기
   @RequestMapping(value="regist", method=RequestMethod.GET)
   public String resumeRegist() throws Exception{
      return "resume/regist";
   }
   
   //이력서 등록 처리
   @RequestMapping(value="registConfirm", method=RequestMethod.POST)
   public String resumeRegistConfirm(@ModelAttribute ResumeVO vo, @RequestParam("profile_photo") String file) throws Exception{
	  
	  vo.setProfile_photo(file.toString());
	  resumeService.resumeRegistConfirm(vo);
	  
      return "redirect:detail?email="+ vo.getEmail();  
   }
   
   //이력서 상세보기 폼
   @RequestMapping(value="detail", method=RequestMethod.GET)
   public String resumeDetail(String name, String email, Model model) throws Exception{
	  // 팔로잉 하는 사람의 닉네임(이름)을 가지고 옵니다.
	  String Fname = resumeService.resumeDetail(email).getName(); 
	  
	  // 맵에 팔로워 닉, 팔로잉 닉을 담아 전송합니다.
	  // 각 계정마다 임의의 다른 계정을 팔로우 하고 있는지 하지 않고있는지 확인하기 위함.
	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("follower_nick", name);
	  map.put("following_nick", Fname);
	  
	  model.addAttribute("dto", resumeService.resumeDetail(email));
	  // 내 계정이 다른 계정을 팔로우 하고 있는지 아닌지 확인합니다.
	  // resumeMapper.xml 에서 is_follow로 만약 내 계정이 다른 임의의 계정을 팔로우 하고있다면
	  // count()로 1을 return 받고, 아니면 null을 리턴 받습니다.
	  // (detail.jsp에서 언팔로우 버튼을 누르면 delete되어 버튼이 바뀝니다. 
	  // 하지만 팔로우를 누르면 insert되어 count를 1로 리턴받아 언팔로우 버튼으로 바뀌어야하는데, DB와 즉각적으로 동기화가 되지 않아 버튼이 변경되지 않습니다.) => Ajax로 변경해야 할 듯 합니다.
	  // 이 과정을 통해 detail.jsp에서 팔로우, 언팔로우 버튼을 각 계정마다 선택적으로 보여줍니다.
	  model.addAttribute("chkFollow", resumeService.is_following(map));

      return "resume/detail";
   }
   
   //팔로잉(Ajax써서 detail로 페이지 이동시키지 않게끔 하면 될듯합니다.)
   @RequestMapping(value="following", method=RequestMethod.POST)
   public String following(@ModelAttribute FollowVO vo, String email, Model model) throws Exception {
	   resumeService.following(vo);
	   //해당 계정 정보들을 다시 가지고와서 jsp에 뿌려줌
	   model.addAttribute("dto", resumeService.resumeDetail(email));
	   
	   return "resume/detail";
   }
   
   //언팔로잉(Ajax써서 detail로 페이지 이동시키지 않게끔 하면 될듯합니다.)
   @RequestMapping(value="unfollowing", method=RequestMethod.POST)
   public String unfollowing(@ModelAttribute FollowVO vo, String email, Model model) throws Exception {
	   resumeService.unfollowing(vo);
	   //해당 계정 정보들을 다시 가지고와서 jsp에 뿌려줌
	   model.addAttribute("dto", resumeService.resumeDetail(email));
	   
	   return "resume/detail";
   }
   
   
} 
