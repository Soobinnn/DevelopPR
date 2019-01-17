package com.DevelopPR.user.controller;

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
  public String userJoining(@ModelAttribute UserVO vo) throws Exception
  {
	  String pwdBycrypt = passwordEncoder.encode(vo.getUserPw());
	  vo.setUserPw(pwdBycrypt);
	  userService.insertUser(vo);
	  return "user/joining";
  }
  
  // 로그인 화면
  @RequestMapping("login")
  public String userLogin()
  {
	  return "user/login";
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
          mav.addObject("msg", "success");
          mav.setViewName("main/main");
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
  /*// 로그아웃 처리
  @RequestMapping("member/logout.do")
  public ModelAndView logout(HttpSession session)
  {
      memberService.logout(session);
      ModelAndView mav = new ModelAndView();
      mav.setViewName("login");
      mav.addObject("msg", "logout");
      return mav;
  }*/
}
