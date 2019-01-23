package com.DevelopPR.user.controller;

import java.io.OutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController 
{
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
  @Inject
  UserService userService;
  
  @Inject
  BCryptPasswordEncoder passwordEncoder;
  
  // 회원 목록
  @RequestMapping("list")
  public String userList(Model model)
  {
	  List<UserVO> list = userService.listUser();
	  model.addAttribute("list", list);
	  return "user/list";
  }
  
  // 이용약관 페이지 이동
  @RequestMapping("policy")
  public String userPolicy()
  {
	  return "user/policy";
  }
  // 회원가입 페이지 이동
  @RequestMapping("joinForm")
  public String userJoinForm()
  {
	  return "user/joinForm";
  }
  // 회원 등록 
  @RequestMapping(value ="joining", method = RequestMethod.POST)
  public String userJoining(Model model, @ModelAttribute UserVO vo) throws Exception
  {
	  String pwdBycrypt = passwordEncoder.encode(vo.getUserPw());
	  vo.setUserPw(pwdBycrypt);
	  userService.insertUser(vo);
	  
	  String userEmail = vo.getUserEmail();
	  String userName =vo.getUserName();
	  System.out.println(userEmail);
	  System.out.println(userName);
	  model.addAttribute("userEmail", userEmail);
	  model.addAttribute("userName", userName);
	  return "user/joining";
  }

  // 아이디 찾기 폼
  @RequestMapping("findId")
  public String userFindIdForm()
  {
	  return "user/findId";
  }
  // 휴대폰 인증 폼
  @RequestMapping("authCheck")
  public String authCheckForm() 
  {
	  return "user/authCheck";
  }
  // 휴대폰인증
  @RequestMapping("phoneCheck")
  public ModelAndView sendSMS(@RequestParam String phone) throws Exception 
  {
	  ModelAndView mav = new ModelAndView();
	  String tempAuthNum = userService.authCheck(phone);
	  mav.addObject("phone", phone);
	  mav.addObject("authNum", tempAuthNum);
	  mav.setViewName("user/authCheck");
	  
	  return mav;
  }
  // 아이디 찾기 결과
  @RequestMapping("findIdResult")
  public ModelAndView findId(String phone) throws Exception 
  {
	  System.out.println(phone);
	  ModelAndView mav = new ModelAndView();
	  String email = userService.findId(phone);
	  mav.addObject("email", email);
	  mav.setViewName("user/findIdResult");
	  
	  return mav;
  }
  
  // 로그인 화면(GET)
  @RequestMapping(value="login", method=RequestMethod.GET)
  public String userLogin()
  {
	  return "user/login";
  }
  
  // 로그인 화면 (POST)
  @RequestMapping(value="login", method=RequestMethod.POST)
  public ModelAndView Login(String selectedId)
  {
	  ModelAndView mv = new ModelAndView();
	  mv.addObject("selectedId", selectedId);
	  mv.setViewName("user/login");
	  
	  return mv;
	  
  }
  // 로그인 처리
  @RequestMapping(value ="loginCheck", method =RequestMethod.POST)
  public ModelAndView loginCheck(@ModelAttribute UserVO vo, HttpSession session)
  {
	  
      boolean result = userService.loginCheck(vo, session);
      ModelAndView mav = new ModelAndView();
      if (result == true ) 
      { 
    	  // 로그인 성공
          // main.jsp로 이동
    	  boolean authStatus = userService.checkAuthStatus(vo.getUserEmail());
    	  if(authStatus)
    	  {
    		  mav.addObject("msg", "success");
              mav.setViewName("main/main");
    	  }
    	  // 이메일 인증안했을 경우 로그인
    	  else
    	  {
    		  mav.addObject("userEmail", vo.getUserEmail());
    		  mav.setViewName("user/joining");
    	  }
      } 
      else 
      {
   	   	  // 로그인 실패
          // login.jsp로 이동
          mav.addObject("msg", "failure");
          mav.setViewName("user/login");
      }
      
      return mav;
  }
  // 로그아웃 처리
  @RequestMapping("logout")
  public ModelAndView logout(HttpSession session)
  {
      userService.logout(session);
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", "logout");
      mav.setViewName("user/login");
      return mav;
  }
  
  // 회원가입 시 이메일 인증
  @RequestMapping(value = "joinConfirm", method = RequestMethod.GET)
  public String emailConfirm(String userEmail, Model model) throws Exception 
  { 	
	  	// 이메일인증
	   	System.out.println(userEmail);
  		userService.userAuth(userEmail);
  		model.addAttribute("userEmail", userEmail);
  		return "user/joinConfirm";
  }
  // 회원가입 - ajax 이메일 중복 체크
  @RequestMapping(value ="checkUse", method = RequestMethod.POST)
  @ResponseBody
  public int checkUse(Model model, @ModelAttribute UserVO uservo)
  {
	  int checkMail =userService.checkMail(uservo.getUserEmail());
	  return checkMail;
  }
  // 회원가입 - ajax 닉네임 중복 체크
  @RequestMapping(value ="checkNick", method = RequestMethod.POST)
  @ResponseBody
  public int checkNick(Model model, @ModelAttribute UserVO uservo)
  {
	 
	  int checkNick =userService.checkNick(uservo.getUserNick());
	  return checkNick;
  }
  
}
