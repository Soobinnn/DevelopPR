package com.DevelopPR.resume.controller;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.photo.FileUtil;
import com.DevelopPR.resume.service.ResumeService;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/resume/*")
public class ResumeController {
  
	@Inject
	ResumeService resumeService; 
	
	//이력서 등록 폼
   @RequestMapping(value="regist", method=RequestMethod.GET)
   public String resumeRegist() throws Exception{
	  
      return "resume/regist";
   }
   
   //이력서 등록 처리
   @RequestMapping(value="registConfirm", method=RequestMethod.POST)
   public String resumeRegistConfirm(@ModelAttribute ResumeVO vo, @RequestParam("profile_photo") String file) throws Exception{
	  System.out.println(vo.toString());
	  vo.setProfile_photo(file.toString());
	  System.out.println(vo.toString());
	  resumeService.resumeRegistConfirm(vo);
      return "resume/registConfirm";
   }
   
   //이력서 상세보기 폼
   @RequestMapping(value="detail", method=RequestMethod.GET)
   public String resumeDetail(String email, Model model) throws Exception{
	 
	  model.addAttribute("dto", resumeService.resumeDetail(email));

	  
	  
	  
	  
	  
	  
      return "resume/detail";
   }
   
   
} 