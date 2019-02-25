<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../views/include/tag_header.jsp" %>

<title>Insert title here</title>
</head>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/project/pr_detailForm.css'/>"/>
<body>
<div class="pr_detail">
<div class="container">
<%-- <form name="form1" id="form1" method="post" action="${path}/project/regist" enctype="multipart/form-data"> --%>  
<form name="form1" id="form1" action="${path}/project/regist" method ="post" enctype="multipart/form-data">
  <div id="project_make"><span id="main_title">프로젝트 상세보기</span></div>
  <div id="title_line_top"> <!--라인 넣기용 div--><hr id="title_top"></div>
  
  
  <div class="title_input">
   
   <div id="title">*제목</div>
   <div id="titleWrite"><p id="textarea_title">${dto.project_name}</p></div>
   <div class="title_warn"><!--자바스크립트로 경고 메시지를 띄운다.--></div>
  </div> <!--end of title_input-->

  <div class="introduce">
   <div id="introMenu">요약</div>
   <div id="introWrite"><p id="textarea_introduce">${dto.project_content}</p></div>    
  </div> <!-- end of introduce-->
  
  <div class="regdate_term"><div id="regdate_hr_">  <hr id="regdate_top"></div>
    <div id="regdate_term_title">&nbsp;&nbsp;날짜 / 기간</div>
    <div id="regdate_calendar">
    <p id="project_term1">${dto.project_term1} &nbsp; ~ &nbsp;  ${dto.project_term2}</p>
    
    
    <!--시작일~종료일 달력 메뉴 --></div>
  </div> <!-- end of regdate_trem-->

  <div class="TechStack"> <div id="techstack_top_"><hr id="techstack_top"></div>
   <div id="techstack_q"><div id="techstack_font">&nbsp;&nbsp;사용한 Tech Stack</div></div>
      
   
   <div id="techstack_input">
   	${dto.techstack}
   	</div>
  </div> <!-- end of tachStack-->

  <div class="projectUpload"> <div id="projectUpload_top_"><hr id="projectUpload_top"></div>
    <div id="upload_title"><div id="upload_font">&nbsp;&nbsp;프로젝트를 소개할 파일</div></div>
         <div id="file_name">
         <c:if test="${dto.download_name==null}">
         	관련 파일 없음
         </c:if>
         
         <c:if test="${dto.download_name!=null}">
	         ${dto.download_name}
	         <div id="file_download"><a href="${path}/resources/project_upload/${dto.download_name}" download>프로젝트 파일 다운로드</a></div>
	        
         </c:if>
         </div>
 	 </div> <!-- end of projectUpload-->
 
     <div class="images"> <!-- 프로젝트 관련 이미지를 담는 div, display:flex 시작 -->
       <div id="img_title">관련 이미지</div>
         <div id="img_added"><!-- 밑에서 고른 이미지가 추가되는 곳. -->
        		 이미지 수정에서 따올 예정
         
         
             
         </div>
           
 
     </div> <!-- end of images -->
 
 
  <div class="projectLvl"> <div id="projectLvl_top_"><hr id="projectLvl_top"></div>
    <div id="projectLvl_title"><div id="lvl_font">&nbsp;&nbsp;프로젝트 등급</div></div>
    
    
       <div id="projectLvl_input">
      <div id="projectLvl_txt">${dto.project_grade} 수준</div>   
        </div>
        
  </div> <!-- end of projectLvl-->

   <div class="final_btns"> <div id="final_top_"><hr id="final_top"></div>
   <!--이곳에 등록 버튼을 만든다.-->
     <button type="button" class="final_btn" id="btnCancel" onclick="history.back();">뒤로가기</button>
   </div>


</form> <!-- end of form1 -->



</div>  <!--end of container-->
</div>  <!--css선택자 추가용 div-->

</body>
</html>