package com.DevelopPR;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController 
{
	// 시작페이지 mapping 변경
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String welcome(Model model)
    {
        return "main/intro"; // main.jsp로 포워딩
    }
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() throws Exception
	{
	    return "basic/main/main";
	 }
	   
}
