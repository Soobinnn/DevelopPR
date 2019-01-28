<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../views/include/tag_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/meet/meeting.css'/>" />
<!DOCTYPE html>
<html class="m">
<head>
<title>메신저</title>
<link rel="stylesheet" type="text/css" href="meeting.css" />
<script>
	var socket = null;
	var nick = '${login.userNick}';
	var email = '${login.userEmail}';
	var name = '${login.userName}';
	var receiverNick = null;
	function connect() 
	{
		socket = new WebSocket("ws://localhost:8080/DevelopPR/chat-ws");
		//서버로 메시지 보낼때
		socket.onopen = onOpen;
		//서버로 
		socket.onmessage = onMessage;
		socket.onclose = onClose;
	}

	//서버로 메시지 보낼때
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}

	//서버로 부터 받은 메세지 보내주기
	function onMessage(evt) {
		var data = evt.data;

		console.log(data);
		// 서버 - > view 파싱
		var obj = JSON.parse(data);
	/* 	appendMessage(obj.message_content); */
		appendMessage(obj);
		if (data.substring(0, 4) == "msg:") 
		{
			appendMessage(data.substring(4));
		}
	}
	//닫힐때 
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}

	function send() {
		/* var nickname = id; */
		var msg = $("#chat_text").val();
		if (msg != "") {
			var message = {};
			message.chatroom_id = nick +","+receiverNick
			message.message_content = $("#chat_text").val()
			message.message_sender = nick
			message.send_user_id = email
			message.send_user_name = name
			message.message_receiver = receiverNick
			message.receiver_user_id = '${viewId.userEmail}'
			message.receiver_user_name = '${viewId.userName}'
		}
		console.log(message);
		/* socket.send("msg:" + msg); */
		socket.send(JSON.stringify(message));
		$("#chat_text").val("");
		getList(message);
	}
	function appendMessage(msg) 
	{
		/* console.log("닉상태가 : " +nick);
		console.log("샌더상태가 : " +msg.message_sender); */
		if(nick===msg.message_sender)
		{
			$("#chatArea").append("<div id='sendchat'>" + msg.message_content + "</div><br>");
		}
		else
		{
			$('#sendchat').css({"text-align" :"left"});
			$("#chatArea").append("<div id='sendchat'>" + msg.message_content + "</div><br>");	
		}
		var chatAreaHeight = $("#chat").height();
		var maxScroll = $("#chatArea").height() - chatAreaHeight;
		
		$("#chat").scrollTop(maxScroll);
	}
	function readyChat(follow)
	{
		receiverNick =follow;
		console.log("보낼 대상 선택 : "+receiverNick);	
	}
	function getRoom(chatroom_id, receiver_user_id)
	{
		var param = "chatroom_id="+chatroom_id
		$.ajax({                                                                                                                          
			 async : true,
	         type :'POST',
	         data : param,
	         url : "${path}/getRoom",
	         success : function(data)
	         {
	        	 $("#chatArea").empty();
	        	 var messagelist;
	        	 for(var i in data)
	        	 {
	        		 messagelist =data[i];
	        		 appendMessage(messagelist);
	        	 }
	        	//대상변경
        		 readyChat(receiver_user_id);
	         }
		})
	}
	function getList(message)
	{
		var msg = message;
		$.ajax({                                                                                                                          
			 async : true,
	         type :'POST',
	         data : msg,
	         url : "${path}/getList",
	         success : function(data)
	         {
	        	 $('.listAll').empty();
	        	 console.log("ajax처리했능가 : "+data);
	        	 var getlist;
	        	 for(var i in data)
	        	 {
	        		 getlist = data[i];
	        		 console.log(getlist);
	        	 }
	         }
		})
	}
	function viewList(getlist)
	{
		var out ;
		
	}
	$(document).ready(function() 
	{
		$("#chat_text").focus();
		$('#chat_text').keypress(function(event) 
		{
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});

	/* 	$('.tab1_content').click(function() 
		{
			connect();
		}); */
		$('#chat_send').click(function() 
		{
			connect();
		});
/* 		$('.tab2_content').click(function() {
			disconnect();
		}); */
	
		/*  $('#follower').click(function(){

			 var nick = $('#fllw').val();
			 var _nick = "userNick="+nick;
			 console.log(nick);
			$.ajax({
				type : "get",
				contentType: "application/json",
				url : "${path}/meeting/",
				data : _nick,
				success: function(result)
				{
					connect();
					console.log(result);
				}
			});
		});   */
/* 		$('#testss').on('click', function(e){
			
		}); */
	});
</script>
</head>
<body>
	<div class="container">
		<div id="list">
			<div class="subject">메신저 목록</div>
			<div id="search">
				<input type="text" id="s_text" placeholder="메신저 검색" /> <input
					type="button" id="s_button" value="검색" />
			</div>
			<div class="listAll">
				<c:forEach var="row" items="${list}">
					<div class="mlist">
						<div class="up">
							<a class="getChatRoom" href="javascript:getRoom('${row.chatroom_id}','${row.receiver_user_id}');"></a>
							<div class="m_name">${row.receiver_user_id}</div>
							<div class="m_lastday"><fmt:formatDate value="${row.lastTime}" pattern="yy-MM-dd HH : mm"/></div>
						</div>
						<div class="m_info">${row.lastMessage}</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div id="info">
			<div id="chat" style="overflow-y: scroll;">
				<div id="chatArea"></div>
			</div>
			<div id="chat_in">
				<input type="text" id="chat_text" placeholder="메시지를 입력하세요." /> <input
					type="button" id="chat_send" value="전송">
			</div>
		</div>

		<div id="nav">
			<div id="myinfo">
				<div id="my_img">사진</div>
				<div id="my_name">${sessionScope.userName}
					${sessionScope.userNick}</div>
			</div>

			<div id="css_tabs">
				<input id="tab1" type="radio" name="tab" checked="checked" /> <input
					id="tab2" type="radio" name="tab" /> <label for="tab1">팔로잉</label>
				<label for="tab2">팔로워</label>
				<div class="tab1_content">
					<c:forEach items="${followingList}" var="list">
						<div>
							<a href="javascript:readyChat('${list.following_nick}');">${list.following_nick}</a>
						</div>
					</c:forEach>
				</div>
				<div class="tab2_content">
					<c:forEach items="${followerList}" var="list">
						<div>
							<a href="javascript:readyChat('${list.follower_nick}');">${list.follower_nick}</a>
							
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
