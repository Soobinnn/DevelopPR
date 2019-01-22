package com.DevelopPR.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.DevelopPR.user.dao.UserDAO;
import com.DevelopPR.user.dto.UserVO;

@Service
public class UserServiceImpl implements UserService
{
	 // MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
	   @Inject
	   UserDAO userDao;
	   
	  /* @Inject
		private JavaMailSender mailSender;	*/
	   // 01. 회원 목록
	   @Override
	   public List<UserVO> listUser() 
	   {
	       return userDao.listUser();
	   }
	   
	   // 02. 회원 등록 ++ 이메일 인증
	   @Override
	   /* @Transactional*/
	   public void insertUser(UserVO vo) throws Exception
	   {
	       userDao.insertUser(vo);
	       
	       /* // 임의의 authkey 생성
			String authkey = new TempKey().getKey(50, false);

			memberDao.createAuthKey(vo.getUserEmail(), authkey);
				vo.setAuthkey(authkey);
			memberDao.updateAuthkey(vo);
			// mail 작성 관련 
			MailHandler sendMail = new MailHandler(mailSender);
		
			sendMail.setSubject("[DevelopPR] 회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8080/spring2/member/emailConfirm?userEmail=")
					.append(vo.getUserEmail())
					.append("&authkey=")
					.append(authkey)					
					.append("' target='_blenk'>이메일 인증 확인</a>")
					.toString());
					sendMail.setFrom("DevelopPRmail@gmail.com", "DevelopPR");
					sendMail.setTo(vo.getUserEmail());
					sendMail.send();*/
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
	   
}
