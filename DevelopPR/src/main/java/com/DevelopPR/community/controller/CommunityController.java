package com.DevelopPR.community.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DevelopPR.community.model.dto.CommunityVO;
import com.DevelopPR.community.model.dto.PhotoVO;
import com.DevelopPR.community.service.BoardPager;
import com.DevelopPR.community.service.CommunityService;
import com.DevelopPR.user.dto.UserVO;

@Controller 
@RequestMapping("/community/")
public class CommunityController {
	
	@Resource
	private Validator validator;
	
	 @InitBinder
	    private void initBinder(WebDataBinder binder){
	        binder.setValidator(this.validator);
	    }	

  @Inject
   CommunityService communityService;

   @RequestMapping("list")
   public ModelAndView communitylist(@ModelAttribute UserVO vo, @RequestParam(defaultValue = "title") String searchOption,
         @RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage, HttpSession session)
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
      mav.setViewName("basic/community/list"); 

      return mav; 
   }

   // 02. 
   @RequestMapping(value = "registForm", method = RequestMethod.GET)
   public String communityRegistForm(@ModelAttribute CommunityVO vo, HttpSession session) 
   {
	   return "basic/community/registForm"; //
   }

   // 03..
   @RequestMapping(value = "regist", method = RequestMethod.POST)
   public String communityRegist(@ModelAttribute @Valid CommunityVO vo, HttpSession session, HttpServletRequest request, BindingResult bindingResult) throws Exception 
   {
	
	   
	   
	   
	   UserVO userVo = (UserVO) session.getAttribute("login");
	  
	   
	   String writer = userVo.getUserNick();
	   
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

      mav.setViewName("basic/community/detail");

 
      mav.addObject("dto", communityService.detail(bno));
      return mav;
   }

  
   @RequestMapping(value = "modifyForm", method = RequestMethod.POST)
   public ModelAndView communityModifyForm(@RequestParam int bno, @ModelAttribute CommunityVO vo) throws Exception {

      ModelAndView mav = new ModelAndView();
      mav.addObject("dto", communityService.modifyForm(bno));
      mav.setViewName("basic/community/modifyForm"); // 

      return mav; // 
   }

   
   // 
   @RequestMapping(value="modify", method=RequestMethod.POST)
    public ModelAndView communityModify(@ModelAttribute CommunityVO vo, @RequestParam int bno) throws Exception
    { 
      communityService.modify(vo); 
       ModelAndView mav = new ModelAndView();
       mav.setViewName("basic/community/detail");
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

      return "basic/community/update";

   }

   @RequestMapping(value = "/reply", method = RequestMethod.POST)
   public String reply(@ModelAttribute CommunityVO vo) throws Exception 
   {

      communityService.reply(vo);

      return "redirect:list";
   }

   /*네이버 스마트 에디터 사진업로드 구현 컨트롤러*/
 //단일파일업로드
   @RequestMapping("photoUpload")
   public String photoUpload(HttpServletRequest request, PhotoVO vo){
       String callback = vo.getCallback();
       String callback_func = vo.getCallback_func();
       String file_result = "";
       try {
           if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
               //파일이 존재하면
               String original_name = vo.getFiledata().getOriginalFilename();
               String ext = original_name.substring(original_name.lastIndexOf(".")+1);
               //파일 기본경로
               String defaultPath = request.getSession().getServletContext().getRealPath("/");
               //파일 기본경로 _ 상세경로
               String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;             
               File file = new File(path);
              
               //디렉토리 존재하지 않을경우 디렉토리 생성
               if(!file.exists()) {
                   file.mkdirs();
               }
               //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
               String realname = UUID.randomUUID().toString() + "." + ext;
           ///////////////// 서버에 파일쓰기 /////////////////
               vo.getFiledata().transferTo(new File(path+realname));
               file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
           } else {
               file_result += "&errstr=error";
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
       return "redirect:" + callback + "?callback_func="+callback_func+file_result;
   }

   @RequestMapping("multiplePhotoUpload")
   public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
       try {
            //파일정보
            String sFileInfo = "";
            //파일명을 받는다 - 일반 원본파일명
            String filename = request.getHeader("file-name");
            //파일 확장자
            String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
            //확장자를소문자로 변경
            filename_ext = filename_ext.toLowerCase();
            //파일 기본경로
            String dftFilePath = request.getSession().getServletContext().getRealPath("/");
            //파일 기본경로 _ 상세경로
            String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
            File file = new File(filePath);
            if(!file.exists()) {
               file.mkdirs();
            }
            String realFileNm = "";
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String today= formatter.format(new java.util.Date());
            realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
            String rlFileNm = filePath + realFileNm;
            ///////////////// 서버에 파일쓰기 /////////////////
            InputStream is = request.getInputStream();
            OutputStream os=new FileOutputStream(rlFileNm);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while((numRead = is.read(b,0,b.length)) != -1){
               os.write(b,0,numRead);
            }
            if(is != null) {
               is.close();
            }
            os.flush();
            os.close();
            ///////////////// 서버에 파일쓰기 /////////////////
            // 정보 출력
            sFileInfo += "&bNewLine=true";
            // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
            sFileInfo += "&sFileName="+ filename;;
            sFileInfo += "&sFileURL="+"/DevelopPR/resources/photo_upload/"+realFileNm;
            
			/*  src/main/webapp/
			 * request.getSession().getServletContext().getRealPath("/resource/pamphlet.pdf"
			 * );
			 */
            
            
            PrintWriter print = response.getWriter();
            print.print(sFileInfo);
            print.flush();
            print.close();
       } catch (Exception e) {
           e.printStackTrace();
       }
   }

}
