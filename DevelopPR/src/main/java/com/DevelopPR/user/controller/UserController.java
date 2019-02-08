package com.DevelopPR.user.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.service.ResumeService;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;
import com.DevelopPR.util.JsonParser;
import com.DevelopPR.util.Kakaologinapi;
import com.DevelopPR.util.NaverloginBO;
import com.DevelopPR.util.TempKey;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping("/user/*")
public class UserController 
{
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
  @Inject
  UserService userService;
  @Inject
  ResumeService resumeService; 
  // DB 암호화
  @Inject
  BCryptPasswordEncoder passwordEncoder;
  
  // naver api
  private NaverloginBO naverLoginBO;
  @Inject
  private void setNaverLoginBO(NaverloginBO naverLoginBO) 
  {
      this.naverLoginBO = naverLoginBO;
  }
  
  @Inject
  private GoogleConnectionFactory googleConnectionFactory;
  @Inject
  private OAuth2Parameters googleOAuth2Parameters;
  private OAuth2Operations oauthOperations;
  
  // 회원 목록
  @RequestMapping("list")
  public String userList(Model model)
  {
	  List<UserVO> list = userService.listUser();
	  model.addAttribute("list", list);
	  return "basic/user/list";
  }
  
  // 이용약관 페이지 이동
  @RequestMapping("policy")
  public String userPolicy()
  {
	  return "basic/user/policy";
  }
  
  // 회원가입 페이지 이동
  @RequestMapping("joinForm")
  public String userJoinForm()
  {
	  return "basic/user/joinForm";
  }
  
  // 회원 등록 
  @RequestMapping(value ="joining", method = RequestMethod.POST)
  public String userJoining(Model model, @ModelAttribute UserVO vo) throws Exception
  {
	  String pwdBycrypt = passwordEncoder.encode(vo.getUserPw());
	  vo.setUserPw(pwdBycrypt);
	  userService.insertUser(vo);
	  
	  String userEmail = vo.getUserEmail();
	  String userName =vo.getUserName();
	  model.addAttribute("userEmail", userEmail);
	  model.addAttribute("userName", userName);
	  return "basic/user/joining";
  }

  // 아이디 찾기 폼
  @RequestMapping("findId")
  public String userFindIdForm()
  {
	  return "basic/user/findId";
  }
  // 휴대폰 인증 폼
  @RequestMapping("authCheck")
  public String authCheckForm() 
  {
	  return "basic/user/authCheck";
  }
  // 휴대폰인증
  @RequestMapping("phoneCheck")
  public ModelAndView sendSMS(@RequestParam String phone) throws Exception 
  {
	  ModelAndView mav = new ModelAndView();
	  // jsp에서 인증번호를 비교하기위해 임시로 인증번호를 받아온다.
	  String tempAuthNum = userService.authCheck(phone);
	  // phone번호 다시 jsp에 띄우기 위해 phone번호 모델에 담고
	  mav.addObject("phone", phone);
	  // 임시 인증번호도 담는다.
	  mav.addObject("authNum", tempAuthNum);
	  mav.setViewName("basic/user/authCheck");
	  
	  return mav;
  }
  // 아이디 찾기 결과
  @RequestMapping("findIdResult")
  public ModelAndView findId(String phone) throws Exception {

	  ModelAndView mav = new ModelAndView();
	  // DB에서 이메일을 찾아 이메일 가져온다.
	  String email = userService.findId(phone);
	  // email 담고,
	  mav.addObject("email", email);
	  // findIdResult.jsp로 넘긴다.
	  mav.setViewName("basic/user/findIdResult");
	  
	  return mav;
  }
  
  // 로그인 화면(GET)
  @RequestMapping(value="login", method=RequestMethod.GET)
  public String userLogin()
  {
	  return "basic/user/login";
  }
  
  // 로그인 화면 (POST)
  @RequestMapping(value="login", method=RequestMethod.POST)
  public ModelAndView Login(String selectedId)
  {
	  ModelAndView mv = new ModelAndView();
	  // 이메일 찾고나서 해당 이메일 라디오 버튼 누르고 로그인 페이지로 갔을때
	  // 이메일 입력란에 해당 이메일 바로 보여주기 위해 selectedId 사용
	  mv.addObject("selectedId", selectedId);
	  mv.setViewName("basic/user/login");
	  
	  return mv;
	  
  }
  // 로그인 처리
  @RequestMapping(value ="loginCheck", method =RequestMethod.POST)
  public ModelAndView loginCheck(@ModelAttribute UserVO vo, HttpSession session) throws Exception
  {
	  
      boolean result = userService.loginCheck(vo, session);
      ModelAndView mav = new ModelAndView();
      if (result == true ) 
      { 
    	  // 로그인 성공
          // main.jsp로 이동
    	  boolean authStatus = userService.checkAuthStatus(vo.getUserEmail());
    	  if(authStatus)
    	  {
    		  List<ResumeVO> list = resumeService.mainList();
    		   
    		  mav.addObject("list", list); 
    		  mav.addObject("msg", "success");
              mav.setViewName("basic/main/main");
    	  }
    	  // 이메일 인증안했을 경우 로그인
    	  else
    	  {
    		  mav.addObject("userEmail", vo.getUserEmail());
    		  mav.setViewName("basic/user/joining");
    	  }
      } 
      else 
      {
   	   	  // 로그인 실패
          // login.jsp로 이동
          mav.addObject("msg", "failure");
          mav.setViewName("basic/user/login");
      }
      
      return mav;
  }
  // 로그아웃 처리
  @RequestMapping("logout")
  public ModelAndView logout(HttpSession session)
  {
      userService.logout(session);
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", "logout");
      mav.setViewName("basic/user/login");
      return mav;
  }
  
  // 회원가입 시 이메일 인증
  @RequestMapping(value = "joinConfirm", method = RequestMethod.GET)
  public String emailConfirm(String userEmail, Model model) throws Exception 
  { 	
	  	// 이메일인증
	   	System.out.println(userEmail);
  		userService.userAuth(userEmail);
  		model.addAttribute("userEmail", userEmail);
  		return "basic/user/joinConfirm";
  }
  // 회원가입 - ajax 이메일 중복 체크
  @RequestMapping(value ="checkUse", method = RequestMethod.POST)
  @ResponseBody
  public int checkUse(Model model, @ModelAttribute UserVO uservo)
  {
	  int checkMail =userService.checkMail(uservo.getUserEmail());
	  return checkMail;
  }
  // 회원가입 - ajax 닉네임 중복 체크
  @RequestMapping(value ="checkNick", method = RequestMethod.POST)
  @ResponseBody
  public int checkNick(Model model, @ModelAttribute UserVO uservo)
  {
	 
	  int checkNick =userService.checkNick(uservo.getUserNick());
	  return checkNick;
  }
  
  // 회원가입 - 이메일 인증 에러시 재전송 폼
  @RequestMapping(value ="joiningError", method = RequestMethod.POST)
  public String joingError(Model model, @RequestParam String userEmail)
  {
	  model.addAttribute("userEmail", userEmail);
	  return "basic/user/joiningError";
  }
  
  //회원가입 - 이메일 인증 에러시 재전송
  @RequestMapping(value="reJoining", method  = RequestMethod.POST)
  public String reJoining(Model model,@RequestParam String userEmail, @RequestParam String reUserEmail) throws Exception
  {  
	  String _userEmail = userEmail;
	  String _reUserEmail = reUserEmail; 
	  System.out.println(_userEmail);
	  System.out.println(reUserEmail);
	  if(_userEmail.equals(_reUserEmail))
	  {
		  userService.reJoining(_reUserEmail);
		  return "basic/user/joining";
	  }
	  else
	  {	 
		  model.addAttribute("userEmail", userEmail);
		  model.addAttribute("msg", "이메일이 일치하지 않습니다. 다시입력해주세요");
		  return "basic/user/joiningError";
	  }
  }

  // 카카오 api 로그인 시
  @RequestMapping(value = "kakaooauth" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
  public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
  {

    JsonNode jsonToken = Kakaologinapi.getAccessToken(code);
    
    JsonNode accessToken = jsonToken.get("access_token");
    
    System.out.println("accessToken : " + accessToken);

    JsonNode userInfo = Kakaologinapi.getKakaoUserInfo(accessToken);
    
    // Get id
    String id = userInfo.path("id").asText();
    String name = null;
    String email = null;
    String thumbnail= null; 
    String profile= null;
    Boolean checMail = false;
    // 유저정보 카카오에서 가져오기 Get properties
    JsonNode properties = userInfo.path("properties");
    JsonNode kakao_account = userInfo.path("kakao_account");

    name = properties.path("nickname").asText();
    email = kakao_account.path("email").asText();
    thumbnail = properties.path("thumbnail_image").asText();
    profile = properties.path("profile_image").asText();
    checMail = kakao_account.path("has_email").asBoolean();
    
    System.out.println("id : " + id);
    System.out.println("name : " + name);
    System.out.println("email : " + email);
    System.out.println("thumbnail :" + thumbnail);
    System.out.println("profile : " + profile);
    System.out.println("이메일 유무테스트" + checMail);
 
    int checkMail =userService.checkMail(email+"_kakao");

    UserVO vo = new UserVO();
    
    // 이메일 허용 체크 안했을 경우 예외처리
    if(checMail)
    {
      vo.setUserEmail(email+"_kakao");
    }
    else
    {
    	vo.setUserEmail(id+"@daum.net_kakao");
    }
	  vo.setUserIs_seek(0);
	  vo.setUserNick(id);
	  vo.setUserName(name);
	  vo.setProfile(profile);
	  
	  // DB에 없을 시에
    if(checkMail ==0)
    {
  	  String pw = new TempKey().getKey(20, false);
  	  String pwBycrypt = passwordEncoder.encode(pw);
  	  	    
  	  vo.setUserPw(pwBycrypt);
  	  vo.setUserJob("0");
  	  vo.setUserJob_detail("카카오계정 로그인 입니다. 정보를 변경해주세요.");
  	  vo.setUserAuthStatus(1);
  	  vo.setUserPhone("010########");
  	  
  	  userService.insertUserApi(vo);
    }

    // 세션 등록
    UserVO vo2 = new UserVO();
    vo2.setUserEmail(vo.getUserEmail());
    vo2.setUserNick(vo.getUserNick());
    vo2.setUserName(vo.getUserName());
    vo2.setUserIs_seek(vo.getUserIs_seek());
    session.setAttribute("login", vo2 );
    
    return "user/kakaologin";
  }
  
  // 네이버 api 로그인 시
  @RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String  naverLogin(Model model, HttpSession session) 
  {
	  /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
		System.out.println(naverAuthUrl);
		/* 생성한 인증 URL을 View로 전달 */

		return "user/naverlogin";
	}

  // 네이버 콜백
  @RequestMapping("callback")
  public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model, UserVO vo) throws Exception 
  {
		logger.info("naver login............");
		JsonParser json = new JsonParser();

		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		vo = json.changeJson(apiResult); // vo에 userEmail, userGender, userNaver 저장

		int checkMail =userService.checkMail(vo.getUserEmail()+"_naver");
      
	    vo.setUserEmail(vo.getUserEmail()+"_naver");
		vo.setUserIs_seek(0);
		  
		  // DB에 없을 시에
	      if(checkMail ==0)
	      {
	    	  String pw = new TempKey().getKey(20, false);
	    	  String pwBycrypt = passwordEncoder.encode(pw);
	    	  	    
	    	  vo.setUserPw(pwBycrypt);
	    	  vo.setUserJob("0");
	    	  vo.setUserJob_detail("네이버계정 로그인 입니다. 정보를 변경해주세요.");
	    	  vo.setUserAuthStatus(1);
	    	  vo.setUserPhone("010########");	    	  
	    	  userService.insertUserApi(vo);	    	      	
	      }
	      // 세션 등록
	      UserVO vo2 = new UserVO();
	      vo2.setUserEmail(vo.getUserEmail());
	      vo2.setUserNick(vo.getUserNick());
	      vo2.setUserName(vo.getUserName());
	      vo2.setUserIs_seek(vo.getUserIs_seek());
	      session.setAttribute("login", vo2 );
		return "user/callback";
  }

  //구글 로그인 api시
  @RequestMapping(value = "googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
  public String join(HttpServletResponse response, Model model) 
  {
      oauthOperations = googleConnectionFactory.getOAuthOperations();
      String url = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
      System.out.println("/googleLogin, url : " + url);
      model.addAttribute("google_url", url);

      return "user/googlelogin";
  }
  // 구글 콜백  
  @RequestMapping(value = "googleCallback", method = { RequestMethod.GET, RequestMethod.POST })
  public String doSessionAssignActionPage(HttpServletRequest request) throws Exception 
  {

      String code = request.getParameter("code");

      oauthOperations = googleConnectionFactory.getOAuthOperations();
      AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),null);

      String accessToken = accessGrant.getAccessToken();
      Long expireTime = accessGrant.getExpireTime();

      if (expireTime != null && expireTime < System.currentTimeMillis()) 
      {
          accessToken = accessGrant.getRefreshToken();
          System.out.printf("accessToken is expired. refresh token = {}", accessToken);
      }

      Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
      Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
      System.out.println(connection);

      PlusOperations plusOperations = google.plusOperations();
      Person profile = plusOperations.getGoogleProfile();
      
      int checkMail =userService.checkMail(profile.getAccountEmail()+"_google");

      UserVO vo = new UserVO();
      
      vo.setUserEmail(profile.getAccountEmail()+"_google");
	  vo.setUserIs_seek(0);
	  vo.setUserNick(profile.getId());
	  vo.setUserName(profile.getDisplayName());
	  vo.setProfile(profile.getImageUrl());
	  
	  // DB에 없을 시에
      if(checkMail ==0)
      {
    	  String pw = new TempKey().getKey(20, false);
    	  String pwBycrypt = passwordEncoder.encode(pw);
    	  	    
    	  vo.setUserPw(pwBycrypt);
    	  vo.setUserJob("0");
    	  vo.setUserJob_detail("구글계정 로그인 입니다. 정보를 변경해주세요.");
    	  vo.setUserAuthStatus(1);
    	  vo.setUserPhone("010########");
    	  
    	  userService.insertUserApi(vo);	  
      }

      // 세션 등록
      UserVO vo2 = new UserVO();
      vo2.setUserEmail(vo.getUserEmail());
      vo2.setUserNick(vo.getUserNick());
      vo2.setUserName(vo.getUserName());
      vo2.setUserIs_seek(vo.getUserIs_seek());
      
      HttpSession session = request.getSession();
      session.setAttribute("login", vo2 );
      
      
      // Access Token 취소
      try 
      {
          System.out.println("Closing Token....");
          String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
          URL url = new URL(revokeUrl);
          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
          conn.setRequestMethod("GET");
          conn.setDoOutput(true);

          BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
          String inputLine;
          StringBuffer response = new StringBuffer();
          while ((inputLine = in.readLine()) != null) 
          {
              response.append(inputLine);
          }
          in.close();
      } 
      catch (Exception e) {

          e.printStackTrace();
      }
      return "redirect:/main";

  }
  
  // 장기미접속유저 메일 보내기
  @Scheduled(cron="0 0 0 * * ?")
  public void mailSend() throws Exception
  {
	// 6개월 / 9개월 / 1년 7일전  미접속 인원 가져온다.
	List<UserVO> longUnAccess = userService.longUnAccess();	
	userService.unAccessSendMail(longUnAccess);
  }
}
