package com.DevelopPR.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.community.model.dto.CommunityVO;
import com.DevelopPR.community.service.BoardPager;
import com.DevelopPR.community.service.CommunityService;

@Controller 
@RequestMapping("/community/")
public class CommunityController {

   @Inject
   CommunityService communityService;

   @RequestMapping("list")
   public ModelAndView communitylist(@RequestParam(defaultValue = "title") String searchOption,
         @RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
         throws Exception {

      int count = communityService.countArticle(searchOption, keyword);

      
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin();
      int end = boardPager.getPageEnd();

      List<CommunityVO> list = communityService.listAll(start, end, searchOption, keyword);

      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list); // list
      map.put("count", count);
      map.put("searchOption", searchOption); 
      map.put("keyword", keyword);
      map.put("boardPager", boardPager);

      ModelAndView mav = new ModelAndView();
      mav.addObject("map", map); 
      mav.setViewName("community/list"); 

      return mav; 
   }

   // 02. 
   @RequestMapping(value = "registForm", method = RequestMethod.GET)
   public String communityRegistForm() 
   {
      return "community/registForm"; //
   }

   // 03..
   @RequestMapping(value = "regist", method = RequestMethod.POST)
   public String communityRegist(@ModelAttribute CommunityVO vo, HttpSession session) throws Exception 
   {
   
      String writer = (String) session.getAttribute("userId");
      // 
      vo.setWriter(writer);
      communityService.regist(vo);
      return "redirect:list";
   }

   
   @RequestMapping(value = "detail", method = RequestMethod.GET)
   public ModelAndView communityDetail(@ModelAttribute CommunityVO vo, @RequestParam int bno, HttpSession session)
         throws Exception {
    
      communityService.increaseViewcnt(bno, session);
  
      ModelAndView mav = new ModelAndView();

      mav.setViewName("/community/detail");

 
      mav.addObject("dto", communityService.detail(bno));
      return mav;
   }

  
   @RequestMapping(value = "modifyForm", method = RequestMethod.POST)
   public ModelAndView communityModifyForm(@RequestParam int bno, @ModelAttribute CommunityVO vo) throws Exception {

      ModelAndView mav = new ModelAndView();
      mav.addObject("dto", communityService.modifyForm(bno));
      mav.setViewName("/community/modifyForm"); // 

      return mav; // 
   }

   
   // 
   @RequestMapping(value="modify", method=RequestMethod.POST)
    public ModelAndView communityModify(@ModelAttribute CommunityVO vo, @RequestParam int bno) throws Exception
    { 
      communityService.modify(vo); 
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/community/detail");
       mav.addObject("dto", communityService.detail(bno));
       return mav;
    }
      
   
    @RequestMapping("remove")
    public String communityRemove(@RequestParam int bno) throws Exception
    {
        communityService.remove(bno);
        return "redirect:list";
    }

  
   @RequestMapping(value = "/reply/{bno}", method = RequestMethod.GET)

   public String prereply(@ModelAttribute CommunityVO vo, @PathVariable int bno, ModelMap map) throws Exception {
      communityService.detail(bno);

    

      vo.setWriter("");
      vo.setTitle("RE: " + vo.getTitle());

      vo.setContent("----------------<br />" + vo.getContent()

            + "<br />----------------<br />");

      map.addAttribute("item", vo);

      return "community/update";

   }

   @RequestMapping(value = "/reply", method = RequestMethod.POST)
   public String reply(@ModelAttribute CommunityVO vo) throws Exception {

      communityService.reply(vo);

      return "redirect:/community/list";
   }
}