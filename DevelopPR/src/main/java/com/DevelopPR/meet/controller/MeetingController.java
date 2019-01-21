package com.DevelopPR.meet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetingController 
{
	@RequestMapping("/meeting")
	public String meeting(Model model)
	{
		return "meet/meeting";
	}
}
