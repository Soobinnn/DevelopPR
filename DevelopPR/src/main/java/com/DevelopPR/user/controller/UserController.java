package com.DevelopPR.user.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
