package com.DevelopPR;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.service.ResumeService;


@Controller
public class HomeController 
{
	@Inject
	ResumeService resumeService; 
	
	// 시작페이지 mapping 변경
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String welcome(Model model)
    {
        return "main/intro"; // main.jsp로 포워딩
    }
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView main(Model model) throws Exception
	{		 
		 List<ResumeVO> list = resumeService.mainList();
		
	     ModelAndView mav = new ModelAndView();
	     mav.addObject("list", list); 
	     mav.setViewName("basic/main/main");
	     System.out.println(list);
	     
		return mav;
	}

}
