package com.DevelopPR.resume.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.project.service.ProjectService;
import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.GoodVO;
import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.service.ResumePager;
import com.DevelopPR.resume.service.ResumeService;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
@RequestMapping("/resume/*")
public class ResumeController {
  
	@Inject
	ResumeService resumeService; 
	@Inject
	UserService userService;
	@Inject
	ProjectService projectService;
	
	
	//이력서 목록 폼 보기
	@RequestMapping("list")
	public ModelAndView resumeList(@RequestParam(defaultValue="all") String searchOption,
            @RequestParam(defaultValue="") String keyword,
            @RequestParam(defaultValue="1") int curPage) throws Exception{	

		 // 레코드의 갯수 계산
	     int count = resumeService.countArticle(searchOption, keyword);
	     
	     // 페이지 나누기 관련 처리
	     ResumePager resumePager = new ResumePager(count, curPage);
	     int start = resumePager.getPageBegin();
	     int end = resumePager.getPageEnd();		
		
		 List<ResumeVO> list = resumeService.resumeList(start, end, searchOption, keyword);
		
		 
		// 데이터를 맵에 저장
	     Map<String, Object> map = new HashMap<String, Object>();
	     map.put("list", list); // list
	     map.put("count", count); // 레코드의 갯수
	     map.put("searchOption", searchOption); // 검색옵션
	     map.put("keyword", keyword); // 검색키워드
	     map.put("resumePager", resumePager);
		 
		 ModelAndView mav = new ModelAndView();
	     mav.addObject("map", map); 
	     mav.setViewName("basic/resume/list");
	     
		   return mav;
		}
	
	//이력서 등록 폼 보기
   @RequestMapping(value="regist", method=RequestMethod.GET)
   public String resumeRegist(HttpSession session, Model model) throws Exception{
	   
	   UserVO uservo = (UserVO)session.getAttribute("login");
	   String email = uservo.getUserEmail();
	   
	   int chkRegist = resumeService.is_regist(email);
	   if(chkRegist==1) {
		   return "redirect:modify/"+email+"/";
	   }
		   
	   else {
		   
		   model.addAttribute("dto", userService.viewId(email));
	   
	   		return "footmenu/resume/regist";
	   }
   }
   
   //이력서 등록 처리
   @RequestMapping(value="registConfirm", method=RequestMethod.POST)
   public String resumeRegistConfirm(HttpSession session, @ModelAttribute ResumeVO vo, @RequestParam("profile_photo") String file) throws Exception{
	   UserVO uservo = (UserVO)session.getAttribute("login");
	   String loginemail = uservo.getUserEmail();
	   
	  vo.setProfile_photo(file.toString());
	  vo.setLoginemail(loginemail);
	  resumeService.resumeRegistConfirm(vo);
	  
      return "redirect:list";  
   }

   //이력서 상세보기 폼
   @RequestMapping(value="detail/{email}/", method=RequestMethod.GET)
   public String resumeDetail(HttpSession session, @PathVariable("email") String email, Model model) throws Exception{
	  // 팔로잉 하는 사람의 닉네임(user의 닉네임)을 가지고 옵니다.
	  UserVO uservo = (UserVO)session.getAttribute("login");
	  String myemail = uservo.getUserEmail();
	  String myname = userService.viewId(myemail).getUserNick();
	  String name= userService.viewId(email).getUserNick(); 
	  // 맵에 팔로워 닉, 팔로잉 닉을 담아 전송합니다.
	  // 각 계정마다 임의의 다른 계정을 팔로우 하고 있는지 하지 않고있는지 확인하기 위함.
	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("follower_nick", myname);
	  map.put("following_nick", name);
	
	  model.addAttribute("dto", resumeService.resumeDetail(email));
	  model.addAttribute("project", projectService.projectList(email));
	  GoodVO goodvo = new GoodVO();
	  goodvo.setGood_email(email);
	  goodvo.setGood_nick(myname);
	  model.addAttribute("chkFollow", resumeService.is_following(map));
	  // 내 계정이 다른 계정을 팔로우 하고 있는지 아닌지 확인합니다.
	  // resumeMapper.xml 에서 is_follow로 만약 내 계정이 다른 임의의 계정을 팔로우 하고있다면
	  // count()로 1을 return 받고, 아니면 null을 리턴 받습니다.
	  // (detail.jsp에서 언팔로우 버튼을 누르면 delete되어 버튼이 바뀝니다. 
	  // 하지만 팔로우를 누르면 insert되어 count를 1로 리턴받아 언팔로우 버튼으로 바뀌어야하는데, DB와 즉각적으로 동기화가 되지 않아 버튼이 변경되지 않습니다.) => Ajax로 변경.
	  // 이 과정을 통해 detail.jsp에서 팔로우, 언팔로우 버튼을 각 계정마다 선택적으로 보여줍니다.
	  model.addAttribute("chkGood", resumeService.is_good(goodvo));
      return "footmenu/resume/detail";
   }
   
   //이력서 수정하기
   @RequestMapping(value="modify/{email}/")
   public String resumeModifyform(@PathVariable("email") String email, Model model) throws Exception{
	  
	  model.addAttribute("dto", resumeService.resumeDetail(email));
	  
      return "footmenu/resume/modify";
   }


   //이력서 수정하기
   @RequestMapping(value="modifyupdate", method=RequestMethod.POST)
   public String resumeModify(@ModelAttribute ResumeVO vo, @RequestParam("profile_photo") String file) throws Exception{
	   	
		  vo.setProfile_photo(file.toString());
		  resumeService.resumeModify(vo);
		  
	      return "redirect:detail/"+ vo.getEmail()+"/";  
   }
  
   //follow
   @RequestMapping(value ="follow", method = RequestMethod.POST)
   @ResponseBody
   public String follow(@RequestParam("email") String email, HttpSession session) throws Exception
   {
	  UserVO uservo = (UserVO)session.getAttribute("login");
	  String myemail = uservo.getUserEmail();
	  String Fname = userService.viewId(myemail).getUserNick();
	  String name = userService.viewId(email).getUserNick();
	  
 	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("follower_nick", Fname);
	  map.put("following_nick", name);
	  
 	  
	  FollowVO vo = new FollowVO();
	  vo.setFollower_nick(Fname);
	  vo.setFollowing_nick(name);
	   
	   resumeService.following(vo);

	   String chkFollow = resumeService.is_following(map);
	  return chkFollow;
   }
    

   
   //언팔로잉(Ajax써서 detail로 페이지 이동시키지 않게끔 하면 될듯합니다.)
   @RequestMapping(value="unfollow", method=RequestMethod.POST)
   @ResponseBody
   public String unfollow(@RequestParam("email") String email, HttpSession session) throws Exception
   {
	  UserVO uservo = (UserVO)session.getAttribute("login");
	  String myemail = uservo.getUserEmail();
	  String Fname = userService.viewId(myemail).getUserNick();
	  String name = userService.viewId(email).getUserNick();
	  
 	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("follower_nick", Fname);
	  map.put("following_nick", name);
	  
 	  
	  FollowVO vo = new FollowVO();
	  vo.setFollower_nick(Fname);
	  vo.setFollowing_nick(name);
	   
	   resumeService.unfollowing(vo);

	   String chkFollow = resumeService.is_following(map);
	  return chkFollow;
   }
   
   //좋아요
   @RequestMapping(value="good", method=RequestMethod.POST)
   @ResponseBody
   public String good(@ModelAttribute GoodVO vo) throws Exception
   {
	   resumeService.good(vo);

	   String chkGood = resumeService.is_good(vo);
	  return chkGood;
   }
   
   @RequestMapping(value="ungood", method=RequestMethod.POST)
   @ResponseBody
   public String ungood(@ModelAttribute GoodVO vo) throws Exception
   {
	   resumeService.ungood(vo);

	   String chkGood = resumeService.is_good(vo);
	  return chkGood;
   }
   
   @RequestMapping(value="background", method=RequestMethod.POST)
   @ResponseBody
   public String color(@RequestParam("color") String color) throws Exception
   {
	   String url="/DevelopPR/resources/resume/"+color+".jpg";
	   return url;
   }
} 
