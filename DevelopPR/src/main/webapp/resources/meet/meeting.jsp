<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html class="m">
<head>

<title>메신저</title>
<link rel="stylesheet" type="text/css" href="meeting.css"/>
</head>
<body> 
    <div class="container">
        <div id="list">
            <div class="subject">메신저 목록</div>
            <div id="search">
                <input type="text" id="s_text" placeholder="메신저 검색"/>
                <input type="button" id="s_button" value="검색"/>
            </div>
                <div class="listAll">
                <div class="mlist">
                    <div class="up">
                        <div class="m_name">
                            홍길동
                        </div> 
                        <div class="o"></div>
                        <div class="m_lastday">
                            2019-01-16
                        </div>
                    </div>
                    <div class="m_info">
                        안녕
                    </div>
                </div>

                <div class="mlist">
                    <div class="up">
                        <div class="m_name">
                            이름2
                        </div> 
                        <div class="m_lastday">
                            마지막 채팅 날짜2
                            </div>
                        </div>
                        <div class="m_info">
                            마지막 채팅 내용2
                        </div>
                </div>
            </div>
        </div>

        <div id="info">
            <div id="chat">
                대화창
            </div>
            <div id="chat_in">
                <input type="text" id="chat_text" placeholder="메시지를 입력하세요."/>
            </div>
        </div>

        <div id="nav">
            <div id="myinfo">
                <div id="my_img">
                    사진
                </div>
                <div id="my_name">
                    내이름
                </div>
            </div>

	        <div id="css_tabs">
			    <input id="tab1" type="radio" name="tab" checked="checked" />
			    <input id="tab2" type="radio" name="tab" />
			    <label for="tab1">Tab 1</label>
			    <label for="tab2">Tab 2</label>
			    <div class="tab1_content">follower</div>
			    <div class="tab2_content">following</div>
			   
			</div>
        </div>

    </div>
</body>
</html>
