<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevelopPR</title>
<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/intro/javascript/jquery.novacancy.js'/>"></script> 
<link href="<c:url value='/resources/intro/jquery.bxslider.css'/>" rel="stylesheet" /> 
<script src="<c:url value='/resources/intro/jquery.bxslider.min.js'/>"></script>
<link href="<c:url value='/resources/intro/intro.css'/>" rel="stylesheet" /> 
<script language="javascript">
 
  // 마우스 커서 위치 담을 변수
  var mouseX = 0;
    var mouseY = 0; 
 

  function getMousePosition(e){
        var eObj = window.event? window.event : e; // IE, FF 에 따라 이벤트 처리 하기
        mouseX = eObj.clientX;
        mouseY = eObj.clientY + document.documentElement.scrollTop; // 화면을 스크롤 했을때를 위한 처리 (스크롤 한 만큼 마우스 Y좌표에 + )
        // documentElement 가 안된다면 body 바꿔야 한다. 크롬의 경우.. (자동파악 로직 필요)
    }

    function moveImg(){
        // 이미지 위치 파악하기
        var m_x = parseInt(document.getElementById('a1').style.left.replace('px', ''));
        var m_y = parseInt(document.getElementById('a1').style.top.replace('px', ''));
 
        // 이미지 움직이기
        document.getElementById('a1').style.left = Math.round(m_x + ((mouseX - m_x) / 5)) + 'px';
        document.getElementById('a1').style.top = Math.round(m_y + ((mouseY - m_y) / 5)) + 'px';
 
        // 부드럽게 따라오는 공식 대략..
        // 현재 이미지위치 = 현재이미지 위치 + (이미지 위치기준 마우스 커서 위치 / 적절한 나누기 값)
        // 반복 처리 해주면 됩니다.
         
        // ※ 이미지 위치 기준 마우스 커서 위치란?
        // 이미지를 기준으로 그 이미지에서 커서가 얼마나 떨어져 있는지 여부
    }


 
$(document).ready(function() { 
  $(document).on("click","#a1",function(e){
        $('#company').mouseenter(function(){
          $('.click').text('Welcome to DevelopPR!');
          $('#a1').attr("style","display:none");
          window.location.href="http://localhost:8080/DevelopPR/main";
          console.log("안");
          
        });
        
        $('.click').text('회사에 보내주세요.');
        $('.click').attr("style","height:20px;");
        document.onmousemove = getMousePosition; 
        setInterval("moveImg()", 50); // moveImg 함수 반복 실행하여 이미지 움직이기
        
        console.log("click success!");
  });
 
    

  $('.no').novacancy({ 
    'reblinkProbability': 0.1, 
    'blinkMin': 0.2, 
    'blinkMax': 0.6, 
    'loopMin': 8,  
    'loopMax': 10, 
    'color': 'WHITE', 
    'blink': true 
  }); 

  $('.vacancy').novacancy({ 
    'color': 'orange' 
  }); 

  $('.bxslider').bxSlider({
            auto: true, // 자동으로 애니메이션 시작
            speed: 500,  // 애니메이션 속도
            pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
            mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
            // autoControls: true, // 시작 및 중지버튼 보여짐
            // pager: true, // 페이지 표시 보여짐
            // captions: true, // 이미지 위에 텍스트를 넣을 수 있음
          });

}); 

$('.element').novacancy({  
  'reblinkProbability': (1/3), 
  'blinkMin': 0.01, 
  'blinkMax': 0.5, 
  'loopMin': 0.5, 
  'loopMax': 2, 
  'color': ' white', 
  'glow': ['0 0 80px white', '0 0 30px white', '0 0 6px white'], 
  'off': 0, // amount of off chars 
  'blink': 0, // amount of blink chars 
  'classOn': 'on', 
  'classOff': 'off', 
  'element': 'data', // split content by elemen  
  'autoOn': true 
}); 

</script>

    <body>
        <div id="pr_eventintro">
            <div id="sec1"></div>
            <div class="top_intro">
                <div id="_text">  
                    <div id="_text_title"> </div>
                    <div id="_text_left"></div>
                    <div id="main_title">
                            <!-- <h1><span>Develop PR</span></h1> -->
                            <svg width ="1100" height ="900" viewbox="0 0 90 90">
                              <defs>
                                <mask id="mask" x="0" y="0" width="100" height="100">
                                  <rect x="0" y="0" width="100" height="100" fill="#fff"/>
                                  <text id="tes" text-anchor="middle" x="50" y="16" dy="10">Develop PR</text>
                                </mask>
                              </defs>
                              <rect x="0" y="0" width="100" height="53" mask="url(#mask)" fill-opacity="0.85"/>    
                            </svg>
                    </div>
                    <div id="_text_slogan">
                        <span id="_slogan">Spread Your Wings</span>
                    </div>
                     <div id="_text_content1">
                        <span id="_content1">지금까지 이런</span>
                        <span id="_content3">는 없었다.</span>
                    </div>
                    <div class="text">
                        <p id="text_contents">  </p>
                        <p>
                            <span class="word wisteria">포트폴리오</span>
                            <span class="word belize">개발자</span>
                            <span class="word pomegranate">취업준비</span>
                            <span class="word green">이력서</span>
                            <span class="word midnight">웹사이트</span>
                        </p>
                        
                    </div>
                        <div id="_text_content2">
                        <span id="_content4">아래의 면접보는 친구를 클릭해서 회사로 보내주세요!</span>
                        <span id="_content5"></span>
                    </div>  
                    <div id="_text_right"></div>  
                    <div id="move_main"><a href="http://localhost:8080/DevelopPR/main"></a></div>
                </div>
                <div class="main">
                    <ul class="bxslider">
                        <li><img class="slide_img" src="<c:url value='/resources/intro/images/event1.jpg'/>" alt="" title="이미지1"></li>
                        <li><img class="slide_img" src="<c:url value='/resources/intro/images/event2.jpg'/>" alt="" title="이미지2"></li>
                        <li><img class="slide_img" src="<c:url value='/resources/intro/images/event3.jpg'/>" alt="" title="이미지3"></li>
                        <li><img class="slide_img" src="<c:url value='/resources/intro/images/event4.jpg'/>" alt="" title="이미지4"></li>
                        <li><img class="slide_img" src="<c:url value='/resources/intro/images/event5.jpg'/>" alt="" title="이미지5"></li>
                        <li><img class="slide_img" src="<c:url value='/resources/intro/images/event6.jpg'/>" alt="" title="이미지5"></li>
                      </ul>
                </div>
                <div id="sojin">
                    <div id="back">
                        <img id="bb" src="<c:url value='/resources/intro/images/test2.png'/>">
                        <img id="bb2" src="<c:url value='/resources/intro/images/test2.png'/>">
                        <img id="b1" src="<c:url value='/resources/intro/images/back2.png'/>">
                        <img id="b2" src="<c:url value='/resources/intro/images/back2.png'/>">
                            
                    </div>
                      <div id="groundDiv">
                          <img src="<c:url value='/resources/intro/images/road.png'/>" style="width:1596px;height:100px;">
                          <img id="company" src="<c:url value='/resources/intro/images/company1.png'/>" style="width:350px;height:400px;">
                          <div id='a1'  style="position:absolute; width:171px; height:216px; bottom:11px;left:250px  " ></div>
                    
                        </div>
                      <div class="click">
                      <div class="cc"></div>
                      </div>

                
                      <div class="board">
                              <p class="no">Develop</p><p class="vacancy">PR</p> 
                      </div>  
                </div>
                <div id="_footer">
                 <span id="footer_content">© 2019 DevelopPR  All rights reserved. 1.0.0v</span>
                </div>  
            </div>
            <div id="sec2"></div>
        </div>
        
        <script src="<c:url value='/resources/intro/rotation.js'/>"></script>

    </body>

</html>
