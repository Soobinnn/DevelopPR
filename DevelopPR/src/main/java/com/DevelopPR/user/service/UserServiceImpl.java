package com.DevelopPR.user.service;

import java.util.List;

import javax.inject.Inject;

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
	       
	       /*	   		// 임의의 authkey 생성
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
}
