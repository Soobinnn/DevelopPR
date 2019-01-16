<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/user/policy.css'/>"/>
<script type="text/JavaScript">

	function test()
	{
		location.href="${path}/user/joinForm"
	}
	function check() 
	{
		var obj = document.getElementsByName("join");
		for(var i = 0; i < obj.length; i++) 
		{
			if(obj[i].checked == false) 
			{
				alert("이용약관에 동의해주시기 바랍니다.");
				return false;
			}
		}
	}
	
	function chkBox(bool) {
		var obj = document.getElementsByName("join");
		for (var i = 0; i < obj.length; i++)
			obj[i].checked = bool;
	}
</script>
<title>이용약관</title>
</head>
<body>
	<h1 align="center">DPR</h1>
	<form name="joinAgree" action="#" method="post"
		onsubmit="return check()">
		<div class="container">
			<div class="area1">
				<label for="chkAll">이용약관, 개인정보 수집 및 이용에 모두 동의합니다. 
				<input type="checkbox" id="chkAll" onclick=chkBox(this.checked)>
					동의
				</label>
			</div>
			<div class="area1">
				<label for="chk1">이용약관(필수) <input type="checkbox" id="chk1"
					name="join"> 동의
				</label>
			</div>
			<div class="area2">
				<p>제3장 계약 당사자의 의무</p>

				<p>제13조 회사의 의무</p>

				<p>1. “회사”는 관련 법령을 준수하고, 이 약관이 정하는 권리의 행사와 의무의 이행을 신의에 따라 성실하게
					합니다.</p>

				<p>2. “회사”는 “이용자”가 안전하게 “서비스”를 이용할 수 있도록 개인정보 보호를 위해 보안 시스템을
					갖추어야 하며 개인정보처리방침을 공시하고 준수합니다. “회사”는 이 약관 및 개인정보처리방침에서 정한 경우를 제외하고는
					“이용자”의 개인정보가 제 3자에게 공개 또는 제공되지 않도록 합니다.</p>

				<p>3. “회사”는 계속적이고 안정적인 “서비스”의 제공을 위하여 “서비스”를 개선하던 중 설비에 장애가 생기거나
					데이터 등이 멸실 된 때에는 천재지변, 비상사태, 현재의 기술로는 해결이 곤란한 기술적 결함 등 부득이한 사유가 없는 한
					지체 없이 이를 수리 또는 복구하도록 최선의 노력을 다합니다.
				<p>4. “이용자”가 “서비스”의 이용에 필요한 최소한의 기술사양을 갖추지 못한 경우 회사는 “서비스”를 제공할
					의무가 없습니다. 제14조 이용자의 의무 1. “이용자는 다음 행위를 하여서는 안 됩니다. 1) 신청 또는 변경 시
					허위내용의 기재 2) 타인의 정보(개인정보와 결제정보를 포함함) 도용 3) “회사”의 임직원, 운영자, 기타 관계자를
					사칭하는 행위 4) “회사”가 게시한 정보의 변경 5) “회사”가 금지한 정보(컴퓨터 프로그램 등)의 송신 또는 게시
					6) “회사”가 제공 또는 승인하지 아니한 컴퓨터 프로그램이나 기기 또는 장치를 제작, 배포, 이용, 광고하는 행위 7)
					“회사”와 기타 제 3자의 저작권 등 지적재산권에 대한 침해 8) “회사” 및 기타 제 3자의 명예를 손상시키거나 업무를
					방해하는 행위 9) 외설 또는 폭력적인 말이나 글, 화상, 음향, 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위
					10) 게임 데이터(계정, “캐릭터”, 게임아이템 등)를 유상으로 처분(양도, 매매 등)하거나 권리의 객체(담보제공,
					대여 등)로 하는 행위 11) 다른 “이용자”를 기망하여 부당한 이득을 얻는 행위 12) “회사”가 제공하는 "서비스"를
					사행성이 있는 방법 또는 기타 불건전한 방법으로 이용하는 행위 13) 프로그램상의 버그를 악용하는 행위 14) 권한 없이
					회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로
					변경하거나, 회사의 "서비스"를 비정상적인 방법으로 사용하는 행위 15) “회사”의 동의 없이 영리, 영업, 광고,
					정치활동 등을 목적으로 “서비스”를 사용하는 행위 16) 1호 내지 15호의 행위를 유도하거나 광고하는 행위 17) 기타
					관련 법령에서 금지하거나 선량한 풍속 기타 사회통념상 허용되지 않는 행위 2. “이용자”는 이 약관의 규정, 이용안내 및
					“서비스”와 관련하여 공지한 주의사항, “회사”가 통지하는 사항 등을 확인하고 준수할 의무가 있습니다. 3. “회사”는
					제 1항, 제 2항 및 다음 각 호의 어느 하나에 해당하는 행위의 구체적인 유형을 “운영정책” 또는 “운영원칙”에서 정할
					수 있으며, “이용자”는 이를 준수할 의무가 있습니다. 1) “이용자”의 “계정(ID)”명, “캐릭터”명, “닉네임”명,
					길드명에 대한 제한 2) 채팅내용과 방법에 대한 제한 3) 게시판이용에 대한 제한 4) “서비스”이용방법에 대한 제한
					5) 기타 “이용자”의 “서비스” 이용에 대한 본질적 권리를 침해하지 않는 범위 내에서 “회사”가 “서비스” 운영상
					필요하다고 인정되는 사항 제4장 서비스 이용 제15조 서비스의 변경 및 내용수정 1. “이용자”는 “회사”가 제공하는
					“서비스”를 이 약관, 운영정책 및 “회사”가 설정한 서비스이용규칙에 따라 이용할 수 있습니다. 2. “회사”는
					“서비스” 내용의 제작, 변경, 유지, 보수에 관한 포괄적인 권한을 가집니다. 3. “회사”는 “서비스”내 질서와
					게임성, 기타 “서비스”의 원활한 유지를 위하여 필요한 조치를 취할 수 있습니다. 4. “회사”가 상당한 이유가 있는
					경우에 운영상, 기술상의 필요에 따라 “서비스”를 수정(패치) 할 수 있으며, “서비스”를 수정(패치) 하는 경우에는
					해당 “서비스” 웹사이트 등을 통하여 공지합니다. 제16조 서비스의 제공 및 중단 등 1. “서비스”는 “회사”의
					영업방침에 따라 정해진 시간 동안 제공됩니다. “회사”는 “서비스” 제공시간을 “서비스” 초기 화면이나 “홈페이지” 등에
					적절한 방법으로 안내합니다. 2. “회사”는 원활한 “서비스” 환경 제공을 위해 백그라운드 데이터 기능을 제공합니다.
					백그라운드 데이터 기능이란, 애플리케이션이 백그라운드(실행중) 상태에서 데이터를 통신하는 것을 의미하며, 이러한
					백그라운드 데이터 기능 이용 시 데이터 요금이 발생될 수 있습니다. 3. 제 1항에도 불구하고, 다음 각 호의 어느
					하나에 해당하는 경우에는 일정한 시간 동안 “서비스”가 제공되지 아니할 수 있으며, 해당 시간 동안 “회사”는
					“서비스”를 제공할 의무가 없습니다. 1) 컴퓨터 등 정보통신설비의 보수점검, 교체, 정기점검 또는 게임 내용이나
					“서비스”의 수정을 위하여 필요한 경우 2) 해킹 등의 전자적 침해사고, 통신사고, “이용자”들의 비정상적인 이용행태,
					미처 예상하지 못한 “서비스”의 불안정성에 대응하기 위하여 필요한 경우 3) 관련 법령에서 특정 시간 또는 방법으로
					“서비스” 제공을 금지하는 경우 4) 천재지변, 비상사태, 정전, “서비스” 설비의 장애 또는 “서비스” 이용의 폭주
					등으로 정상적인 “서비스” 제공이 불가능할 경우 5) “회사”의 분할, 합병, 영업양도, 영업의 폐지, 당해 “서비스”의
					수익 악화 등 “회사”의 경영상 중대한 필요에 의한 경우 4. “회사”는 제 3항 제 1호의 경우, 매주 또는 격주
					단위로 일정 시간을 정하여 “서비스”를 중지할 수 있습니다. 이 경우 “회사”는 최소한 24시간 전에 그 사실을
					“이용자”에게 “서비스” 초기 화면이나 “홈페이지” 등에 고지합니다. 5. 제 3항 제 2호의 경우, “회사”는 사전
					고지 없이 “서비스”를 일시 중지할 수 있습니다. “회사”는 이러한 경우 그 사실을 “서비스” 초기 화면이나 “홈페이지”
					등에 사후 고지할 수 있습니다. 6. “회사”는 “회사”가 제공하는 “무료서비스” (“이용자”가 별도 비용지급 없이
					이용할 수 있는 “서비스”를 의미하며, 이하 같음) 이용과 관련하여 이용자에게 발생한 어떠한 손해에 대해서도 책임을 지지
					않습니다. 다만, “회사”의 고의 또는 중대한 과실로 인하여 발생한 손해의 경우는 제외합니다. 7. “회사”는 “회사”가
					제공하는 "유료서비스"의 중지·장애와 관련하여 다음 각 호에 따라 보상하며, 이용자는 “회사”에 대하여 별도의 손해배상을
					청구할 수 없습니다. 1) “회사”의 귀책사유로 사전고지 없이 1일 4시간(누적시간) 이상 연속하여 “서비스”가
					중지되거나 장애가 발생한 경우 기간제 “유료서비스” 이용 계정에 한하여 “서비스” 중지ㆍ장애 시간의 3배에 해당하는
					이용시간을 무료로 연장합니다. 2) “회사”가 서버점검 등의 사유로 “서비스” 중지ㆍ장애를 사전에 고지하였으나,
			</div>
			<div class="area1">
				<label for="chk2">개인정보 수집 및 이용(필수) <input type="checkbox"
					id="chk2" name="join"> 동의
				</label>
			</div>
			<div class="area3">
				<input class="input" id="tab1" type="radio" name="tabs" checked>
				<label class="label" for="tab1">수집항목</label> <input class="input"
					id="tab2" type="radio" name="tabs"> <label class="label"
					for="tab2">이용목적</label> <input class="input" id="tab3" type="radio"
					name="tabs"> <label class="label" for="tab3">보유 및
					이용기간</label>

				<section id="content1">
					<div class="text">
						<p>1. 수집항목 </p>
						<p>1) 수집하는 개인정보의 항목 ① 서비스 가입 시 아래와 같은 정보가 수집됩니다. - 회원
							: 이메일 주소(ID), 비밀번호, 닉네임 - 대한민국 거주자 외 회원 : 이메일 주소(ID), 비밀번호, 닉네임,
							생년월일 - 간편 계정(ID) 이용 회원 : 이메일 주소(ID), 비밀번호, 성별 - Facebook 연동 시 :
							Facebook 계정의 이메일 주소(ID), 닉네임 - Google 연동 시 : Google 계정의 이메일
							주소(ID), 닉네임 - NAVER 연동 시 : NAVER 계정의 이메일 주소(ID), 닉네임 ② 서비스 이용과정에서
							아래와 같은 정보들이 수집될 수 있습니다. - PC게임 : 서비스 이용기록, 불량 이용기록, 접속로그, 접속
							IP정보, PC사양 정보 - 모바일 게임 : 이메일 주소(ID), 서비스 이용 기록, 불량 이용 기록, 결제 기록,
							접속로그, , 스마트OS 탑재 모바일 기기(Tablet PC, 스마트폰 등)의 모델명, OS정보, 기기
							고유번호(UUID), 광고 식별자(ADID) - 모바일 App : 스마트OS 탑재 모바일 기기(Tablet PC,
							스마트폰 등)의 모델명, OS정보, 기기 고유번호 (UUID), 광고 식별자(ADID) ③ 연령 확인 및 본인인증이
							필요한 서비스 제공 시 아래와 같은 정보가 수집될 수 있습니다. - 아이핀 본인 인증자 : 이름, 생년월일, 성별,
							연계정보(CI) - 휴대폰 본인 인증자 : 이름, 생년월일, 성별, 연계정보(CI) - 만 14세 미만 아동과 만
							18세 미만 청소년 이용자 l 법정대리인 본인인증 정보 Ø 휴대폰 본인 인증 시 : 이름, 생년월일, 성별,
							연계정보(CI) Ø 아이핀 본인 인증 시 : 이름, 생년월일, 성별, 아이핀번호, 연계정보(CI) l 법정대리인 동의
							정보 Ø 법정대리인 이름, 법정대리인 이메일, 법정대리인 연락처 ④ 1:1 문의 접수 시 아래와 같은 정보가 수집될
							수 있습니다. l 회원 Ø 필수 : 이메일 주소(ID) Ø 선택 : 캐릭터명, PC사양 정보 l 비회원 Ø 필수 :
							이메일 주소 ⑤ 신고센터를 통한 신고 접수 시 접수 내용에 대한 답변 처리 알림을 위해 선택하신 범위에 한해 아래
							정보가 수집됩니다. - SMS 알림 선택 시 : 휴대전화번호 - 이메일 알림 선택 시 : 이메일주소 ⑥ 회사는 아래의
							고객관련 서비스 이용 시 부가적인 정보를 수집할 수 있으며, 이 경우 별도의 개인정보 수집 및 이용 동의를 받습니다.
							- PC게임 : 이벤트 참가, 유료 결제 보호자 동의, 게임 시간 선택제, 채널링 서비스 가입, 마케팅 알림(SMS,
							TM 등) - 모바일 게임 : 이벤트 참가, 마케팅 알림(Push, SMS, TM 등) ⑦ 유료 결제 시 아래와 같은
							결제 정보들이 수집될 수 있습니다. - PC게임 l 휴대전화 결제 시 : 생년월일, 성별, 휴대전화번호, 이동통신사
							l 무통장 입금 및 인터넷 뱅킹 결제 시 : 은행명, 입금자명, 구매자명 l 쿠폰 등록 시 : 이메일 주소(ID),
							이름, 생일, 성별, 국가코드, IP정보 l 신용카드 결제 시 : 카드사명, 할부기간, 카드번호, 유효기간,
							구매자명, 승인번호 - 모바일 게임 l 마켓 결제 시 : 마켓주문번호 l 쿠폰 등록 시: 쿠폰정보 2) 개인정보
							수집방법 홈페이지 회원가입, 모바일 서비스가입(게스트 포함), 서비스 이용, 회원정보 수정, 전화, 팩스, 고객센터
							상담, 이벤트 응모, 협력회사로부터의 제공, 생성정보 수집 툴을 통한 수집</p>
					</div>
				</section>

				<section id="content2">
					<div class="text">
						<p>2. 이용목적 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. </p>
						<p>1) 서비스 제공에 관한 계약 이행
							및 서비스 제공에 따른 요금정산, 콘텐츠 제공, 구매 및 요금 결제, 물품배송, 본인 인증, 요금 추심 
							<p>2) 회원
							관리 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사
							확인, 연령확인, 만 14세 미만 아동의 개인정보 수집 시 법정 대리인 동의여부 확인, 만 18세 미만 이용자의 회원
							가입 시 동의 여부 확인, 법정대리인 본인 확인, 불만처리 및 고객상담 등 민원처리, 분쟁 조정을 위한 기록보존,
							고지사항 전달</p><p> 3) 게스트 관리 모바일 서비스 이용에 따른 불만처리 및 고객상담 등 민원 처리</p>
					</div>
				</section>

				<section id="content3">
					<div class="text"><p>3. 보유 및 이용기간</p> 
						<p>1) 이용자의 개인정보는 원칙적으로 개인정보의 수집목적
						또는 제공받은 목적이 달성되면 지체 없이 파기됩니다 단, 회사는 개인정보 도용 등으로 인한 원치 않는 회원탈퇴 등의
						소비자 불만 및 분쟁해결 등을 위한 목적으로 회원탈퇴 신청 후 30일간 개인정보를 보관한 후, 재생이 불가능한 방법으로
						파기합니다.</p>
						<p>2) 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계 법령의 규정에 의하여 보존할 필요가 있는
						경우 회사는 관계법령에서 정한 일정한 기간 동안 이용자정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의
						목적으로만 이용하며 보존기간은 아래와 같습니다. ① 계약 또는 청약철회 등에 관한 기록: 5년 (보존이유: 전자상거래
						등에서의 소비자보호에 관한 법률) ② 대금결제 및 재화 등의 공급에 관한 기록: 5년 (보존이유: 전자상거래 등에서의
						소비자보호에 관한 법률) ③ 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 (보존이유: 전자상거래 등에서의
						소비자보호에 관한 법률) ④ 표시 또는 광고에 관한 기록: 6개월 (근거법령: 전자상거래등에서의 소비자보호에 관한
						법률) ⑤ 웹사이트 방문 기록: 3개월 (보존이유: 통신비밀보호법) ⑥ 보유기간을 이용자에게 미리 고지하거나 개별적으로
						이용자의 동의를 받은 경우: 고지하거나 개별 동의한 기간</p></div>
				</section>

			</div>
			<div class="area1">
				<div id="btn">
					<button type="button" id="agree_btn" onclick=test() >
						<span>동의</span>
					</button>
					<button type="button" id="disagree_btn">
						<span>동의하지 않음</span>
					</button>
				</div>
			</div>
		</div>
	</form>
</body>