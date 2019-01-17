package com.DevelopPR.user.controller;

import com.DevelopPR.util.*;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController 
{
  @Inject
  UserService userService;
  
  // 회원 목록
  @RequestMapping("list")
  public String userList(Model model)
  {
	  List<UserVO> list = userService.listUser();
	  model.addAttribute("list", list);
	  return "user/list";
  }
  
  @RequestMapping("login")
  public String userLogin()
  {
	  return "user/login";
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
  @RequestMapping("joining")
  public String userJoining(@ModelAttribute UserVO vo) throws Exception
  {
	  userService.insertUser(vo);
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
  public String authCheckForm() {
	  return "user/authCheck";
  }
  // 휴대폰인증
  @RequestMapping("phoneCheck")
  public String sendSMS(@RequestParam String phone) throws Exception {
	  userService.authCheck(phone);
	  return "user/authCheck";
  } 
  
  
  
}
