package com.DevelopPR.user.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.DevelopPR.user.dao.UserDAO;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.util.Coolsms;
import com.DevelopPR.util.GenerateCertNumber;
import com.DevelopPR.util.MailHandler;
import com.DevelopPR.util.TempKey;

@Service
public class UserServiceImpl implements UserService
{
	 // MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
	   @Inject
	   UserDAO userDao;
	   
	   @Inject
	   private JavaMailSender mailSender;
	   
	   // 01. 회원 목록
	   @Override
	   public List<UserVO> listUser() 
	   {
	       return userDao.listUser();
	   }
	   
	   // 02. 회원 등록 ++ 이메일 인증
	   @Override
	   @Transactional
	   public void insertUser(UserVO vo) throws Exception
	   {
	       userDao.insertUser(vo);
	       
	       // 임의의 authkey 생성
			String authkey = new TempKey().getKey(50, false);

			userDao.createAuthKey(vo.getUserEmail(), authkey);
			// mail 작성 관련 
			MailHandler sendMail = new MailHandler(mailSender);
		
			sendMail.setSubject("[DevelopPR] 회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8080/DevelopPR/user/joinConfirm?userEmail=")
					.append(vo.getUserEmail())
					.append("&authkey=")
					.append(authkey)					
					.append("' target='_blenk'>이메일 인증 확인</a>")
					.toString());
					sendMail.setFrom("DevelopPRmail@gmail.com", "DevelopPR");
					sendMail.setTo(vo.getUserEmail());
					sendMail.send();
	   }
	   
	   // 본인 인증 확인	   
	   @Override
	   public String authCheck(String phone) throws Exception 
	   {
		   // 6자리 난수 생성 객체 생성
		   GenerateCertNumber tempNum = new GenerateCertNumber();
		   // 6자리 난수를 받아온다.
			String authNum = tempNum.executeGenerate();
			// CoolSms 계정의 key값
			String api_key = "NCSDWXRYDLI0MN1B";
			// CoolSms 계정의 secret값
			String api_secret = "T4LZGIPEXI5IUFCO036UF1G5B61CHYI9";
			// Coolsms 객체 생성
			Coolsms coolsms = new Coolsms(api_key, api_secret);
			
			// 맵에 받아온 phone 번호, 발신번호, 내용, 형식을 담는다.
			HashMap<String, String> set = new HashMap<String, String>();
			set.put("to", phone); //수신인 번호
			set.put("from", "01071027146"); //발신인 번호
			set.put("text", "인증번호는" + authNum + "입니다."); //메시지내용
			set.put("type", "sms"); //보내는 형식
			
			// 맵에 담긴 정보로 메시지를 보낸후 result 변수로 받는다.
			JSONObject result = coolsms.send(set);
			// 메시지를 성공적으로 받으면 status를 받는다.
			if((Boolean) result.get("status") == true) 
			{			
				System.out.println("성공");
				// 성공했을경우 인증번호를 리턴
				return authNum;
			} 
			else 
			{
				System.out.println("실패");
				// 실패할 경우 fail 리턴 
				return "fail"; 
			}
	   }
	   
	   // 회원 로그인체크
	   @Override
	   public boolean loginCheck(UserVO vo, HttpSession session) 
	   {
	       boolean result = userDao.loginCheck(vo);
	       if (result) 
	       { // true일 경우 세션에 등록
	           UserVO vo2 = viewlogin(vo);
	           // 세션 변수 등록
	           session.setAttribute("userEmail", vo2.getUserEmail());
	           session.setAttribute("userNick", vo2.getUserNick());
	           session.setAttribute("userName", vo2.getUserName());
	           session.setAttribute("userIs_seek", vo2.getUserIs_seek());
	           session.setAttribute("login", vo2);
	       } 
	       return result;
	   }
	   
	   // 회원 로그인 정보
	   @Override
	   public UserVO viewlogin(UserVO vo) 
	   {
	       return userDao.viewlogin(vo);
	   }
	   // 아이디 찾기
	   @Override
	   public String findId(String phone) throws Exception
	   {
		   // phone 번호로 email 찾아줌
		   return userDao.findId(phone);
	   }
	   
	   // 회원 로그아웃
	   @Override
	   public void logout(HttpSession session)
	   {
		   // 세션 변수 개별 삭제
	       // session.removeAttribute("userId");
	       // 세션 정보를 초기화 시킴
	       session.invalidate();
	   }
	   
	   // 회원 이메일, 이름, 닉네임 (팔로우)
	   @Override
	   public UserVO viewId(String userNick)
	   {
		   return userDao.viewId(userNick);
	   }
	   
	   // 사용자확인
	   @Override
	   public void userAuth(String userEmail) throws Exception 
	   {
			userDao.userAuth(userEmail);
	   }

}
