package com.DevelopPR.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/resume/*")
public class ResumeController {
  
	
	
   @RequestMapping(value="regist", method=RequestMethod.GET)
   public String resumeRegist() throws Exception{
      return "resume/regist";
   }
   
   
   
} 