package com.DevelopPR.resume.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.service.ResumePager;
import com.DevelopPR.resume.service.ResumeService;

@Controller
@RequestMapping("/resume/*")
public class ResumeController {
  
	@Inject
	ResumeService resumeService; 
	
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
	     mav.setViewName("resume/list");
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
   public String resumeDetail(String email, Model model) throws Exception{
	 
	  model.addAttribute("dto", resumeService.resumeDetail(email));

      return "resume/detail";
   }
   
   
   
   
   //이력서 수정하기
   @RequestMapping(value="modify", method=RequestMethod.GET)
   public String resumeModifyform(String email, Model model) throws Exception{
	   
	  model.addAttribute("dto", resumeService.resumeDetail(email));

      return "resume/modify";
   }


   //이력서 수정하기
   @RequestMapping(value="modifyupdate", method=RequestMethod.POST)
   public String resumeModify(@ModelAttribute ResumeVO vo, @RequestParam("profile_photo") String file) throws Exception{
	   
		  vo.setProfile_photo(file.toString());
		  resumeService.resumeModify(vo);
		  
	      return "redirect:detail?email="+ vo.getEmail();  
   }

} 
