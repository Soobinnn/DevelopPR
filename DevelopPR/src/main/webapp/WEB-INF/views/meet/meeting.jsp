<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../views/include/tag_header.jsp" %>
 <link rel="stylesheet" type="text/css" href="<c:url value='/resources/meet/meeting.css'/>"/>
<!DOCTYPE html>
<html class="m">
<head>
<title>메신저</title>
<link rel="stylesheet" type="text/css" href="meeting.css"/>
<script>

	var socket = null;
	var id = '${sessionScope.userNick}'
	
	function connect()
	{
		socket = new WebSocket("ws://localhost:8080/DevelopPR/chat-ws");
		socket.onopen = onOpen;
		socket.onmessage = onMessage;
		socket.onclose = onClose;
	}
	
	function onOpen(evt)
	{
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt)
	{
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") 
		{
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt)
	{
		appendMessage("연결을 끊었습니다.");
	}
	function send()
	{
		/* var nickname = id; */
		var msg = $("#chat_text").val();
		socket.send("msg:" + msg);
		$("#chat_text").val("");
	}
	function appendMessage(msg) 
	{
		$("#chatArea").append("<div id='sendchat'>"+ msg+"</div><br>");
		
		var chatAreaHeight = $("#chat").height();
		var maxScroll = $("#chatArea").height() - chatAreaHeight;
		console.log(maxScroll);
		$("#chat").scrollTop(maxScroll);
		
	}

	
	$(document).ready(function() 
	{
		$("#chat_text").focus();
		$('#chat_text').keypress(function(event)
		{
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13')
			{
				send();	
			}
			event.stopPropagation();
		});
		
		$('.tab1_content').click(function(){ connect();});
		$('#chat_send').click(function(){ connect();});
		$('.tab2_content').click(function() { disconnect(); });
		
	});
	
</script>
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
            <div id="chat" style="overflow-y: scroll;">
                <div id="chatArea"></div>
            </div>
            <div id="chat_in">
                <input type="text" id="chat_text" placeholder="메시지를 입력하세요."/>
                <input type="button" id="chat_send" value="전송">
            </div>
        </div>

        <div id="nav">
            <div id="myinfo">
                <div id="my_img">
                    사진
                </div>
                <div id="my_name">
                  ${sessionScope.userName}
                  ${sessionScope.userNick}
                </div>
            </div>

	        <div id="css_tabs">
			    <input id="tab1" type="radio" name="tab" checked="checked" />
			    <input id="tab2" type="radio" name="tab" />
			    <label for="tab1">Tab 1</label>
			    <label for="tab2">Tab 2</label>
			    <div class="tab1_content"><span>follower</span></div>
			    <div class="tab2_content">following</div>
			   
			</div>
        </div>

    </div>
</body>
</html>
