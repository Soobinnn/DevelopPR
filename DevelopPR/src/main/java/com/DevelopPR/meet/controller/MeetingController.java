package com.DevelopPR.meet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetingController 
{
	@RequestMapping("/meeting")
	public String meeting(Model model, HttpSession session)
	{
		return "meet/meeting";
	}
}
