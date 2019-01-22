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

		// ���ڵ��� ���� ���
		int count = communityService.countArticle(searchOption, keyword);

		// ������ ������ ���� ó��
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<CommunityVO> list = communityService.listAll(start, end, searchOption, keyword);

		// �����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // ���ڵ��� ����
		map.put("searchOption", searchOption); // �˻��ɼ�
		map.put("keyword", keyword); // �˻�Ű����
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // �ʿ� ����� �����͸� mav�� ����
		mav.setViewName("community/list"); // �並 list.jsp�� ����

		return mav; // list.jsp�� List�� ���޵ȴ�.
	}

	// 02. 
	@RequestMapping(value = "registForm", method = RequestMethod.GET)
	public String communityRegistForm() 
	{
		return "community/registForm"; //
	}

	// 03..
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String communityRegist(@ModelAttribute CommunityVO vo, HttpSession session) throws Exception {
		// session�� ����� userId�� writer�� ����
		String writer = (String) session.getAttribute("userId");
		// 
		vo.setWriter(writer);
		communityService.regist(vo);
		return "redirect:list";
	}

	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView communityDetail(@ModelAttribute CommunityVO vo, @RequestParam int bno, HttpSession session)
			throws Exception {
		// ��ȸ�� ���� ó��
		communityService.increaseViewcnt(bno, session);
		// ��(������)+��(ȭ��)�� �Բ� �����ϴ� ��ü
		ModelAndView mav = new ModelAndView();
		// ���� �̸�
		mav.setViewName("/community/detail");

		// �信 ������ ������
		mav.addObject("dto", communityService.detail(bno));
		return mav;
	}

	// 05. �Խñ� ���� ��, updateForm.jsp�� �ҷ��ͼ� �� ������ �ִ´�.
	@RequestMapping(value = "modifyForm", method = RequestMethod.POST)
	public ModelAndView communityModifyForm(@RequestParam int bno, @ModelAttribute CommunityVO vo) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", communityService.modifyForm(bno));
		mav.setViewName("/community/modifyForm"); // �並 list.jsp�� ����

		return mav; // list.jsp�� List�� ���޵ȴ�.
	}

	// 06. �Խñ� ����, list�� �ƴ϶� view�� �̵��ϵ��� �����Ѵ�.
	// updateForm���� bno���� ���������� �Ѵ�.
	// ������ �Է��� ������� @ModelAttribute BoardVO vo�� ���޵�
	@RequestMapping(value="modify", method=RequestMethod.POST)
    public ModelAndView communityModify(@ModelAttribute CommunityVO vo, @RequestParam int bno) throws Exception
    { 
		communityService.modify(vo); 
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/community/detail");
	    mav.addObject("dto", communityService.detail(bno));
		 return mav;
    }
      
    // 07. �Խñ� ����
    @RequestMapping("remove")
    public String communityRemove(@RequestParam int bno) throws Exception
    {
        communityService.remove(bno);
        return "redirect:list";
    }

	// 08. �亯 ����
	@RequestMapping(value = "/reply/{bno}", method = RequestMethod.GET)

	public String prereply(@ModelAttribute CommunityVO vo, @PathVariable int bno, ModelMap map) throws Exception {
		communityService.detail(bno);

		// ������ �����ϱ� ���ؼ� writer(Ȥ�� no)�� ���ش�.

		vo.setWriter("");
		vo.setTitle("RE: " + vo.getTitle());

		vo.setContent("-----������ ����-----<br />" + vo.getContent()

				+ "<br />-----������ ��-----<br />");

		map.addAttribute("item", vo);

		return "community/update";

	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(@ModelAttribute CommunityVO vo) throws Exception {

		communityService.reply(vo);

		return "redirect:/community/list";
	}
}