<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../views/include/tag_header.jsp"%>
<!DOCTYPE html>
<html class="m">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/meet/meeting.css'/>" />
<head>
<title>메신저</title>
<script>
	var socket = null;
	var nick = '${login.userNick}';
	var email = '${login.userEmail}';
	var name = '${login.userName}';
	var receiverNick = null;
	var lookRoom = null;
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
	function onOpen(evt) 
	{
		console.log("open");
	}

	//서버로 부터 받은 메세지 보내주기
	function onMessage(evt) 
	{
		var data = evt.data;

		console.log("서버로부터 받은 메시지 : "+data);
		// 서버 - > view 파싱
		var obj = JSON.parse(data);
	/* 	appendMessage(obj.message_content); */
		
		// 내가 보고있는 채팅방일 경우에만, 메시지 띄워주기
		if(lookRoom == obj.chatroom_id)
		{
			appendMessage(obj);
		}
		
		//채팅 리스트
		getList(obj);
		
		/* if (data.substring(0, 4) == "msg:") 
		{
			appendMessage(data.substring(4));
		} */
	}
	//닫힐때 
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}

	function send() {
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
		
		/* 보낼대상 선택안할시 예외처리 */
		if(message.message_receiver==null||message.message_receiver=="")
		{
			alert("보낼 대상을 선택하세요.");
		}
		else
		{
			socket.send(JSON.stringify(message));
			$("#chat_text").val("");
		}
		// 메시지 보낼때 읽음표시 사라지기
		if(lookRoom == message.chatroom_id)
		{
			var _chatroomId = "chatroom_id="+message.chatroom_id;
		
			//보낼때 내껀 읽음 표시하기
			readUpdate(_chatroomId);
		}
		else
		{
			var _chatroomId = "chatroom_id=" + lookRoom;
			/* console.log("보고있는 방하고 다름"+_chatroomId); */
			//보낼때 내껀 읽음 표시하기
			readUpdate(_chatroomId);
		}
		
	}
	// 받은 메시지를 나타냄
	function appendMessage(msg) 
	{
		/* 	console.log("닉상태가 : " +nick);
		console.log("샌더상태가 : " +msg.message_sender); */
		
		if(nick===msg.message_sender)
		{
			$("#chatArea").append("<div id='sendchat' style='text-align : right'><span class ='sendchat_msg'id='sendchat_msg_right'>" + msg.message_content + "</span></div><br>");
		}
		else
		{
			$("#chatArea").append("<div id='sendchat' style='text-align : left'><span class='sendchat_nick'>"+msg.message_sender+"</span><span class ='sendchat_msg' id='sendchat_msg_left'>" + msg.message_content + "</span></div><br>");	
		}
		var chatAreaHeight = $("#chat").height();
		var maxScroll = $("#chatArea").height() - chatAreaHeight;
		
		$("#chat").scrollTop(maxScroll);
	}
	
	//보낼대상을 선택함
	function readyChat(follow)
	{
		receiverNick =follow;
		// 채팅방 위에 닉네임
		$("#chat_info_nick").empty();
		$("#chat_info_nick").append("<span id='chat_info_receiver'>"+follow+"</span>");
	}
	
	// 팔로워/팔로잉 유저에게 처음 채팅할때
	function readyRoom(follow)
	{
		receiverNick = follow;
		//방이있는지 확인하기
		var param = "send_user_id="+nick+"&receiver_user_id="+receiverNick;
		$.ajax({                                                                                                                          
			 async : true,
	         type :'POST',
	         data : param,
	         url : "${path}/checkRoom",
	         success : function(data)
	         {
	        	 $("#chatArea").empty();
	        	var messagelist;
	        	var _chatRoomId; 
	        	 for(var i in data)
	        	 {
	        		 messagelist = data[i];	 
	        		 _chatRoomId = data[i].chatroom_id;
	        		/*  console.log("왓더~"+_chatRoomId); */
	        		 appendMessage(messagelist);
	        	 }
	        	 lookRoom = _chatRoomId;
	        	// 채팅방 위에 닉네임
	     		$("#chat_info_nick").empty();
	     		$("#chat_info_nick").append("<span id='chat_info_receiver'>"+follow+"</span>");
	         }
		})
	}
	// 채팅방의 채팅내용 가져오기
	function getRoom(chatroom_id, receiver_user_id, bool)
	{
		var param = "chatroom_id="+chatroom_id;
		//내가 보고있는 룸 넣기
		lookRoom = chatroom_id;
		if(bool == true)
		{
			readUpdate(param);
		}
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
	        	//카운트 사라지게
	         }
		})
	
	}
	// 본인의 채팅방리스트 불러옴
	function getList(message)
	{
		// 메시지를 파라미터로 받을 필요가 없는것 같다 .
		var session = '${sessionScope.login.userNick}';
		var msg = "userNick=" +session; 
		
		$.ajax({                                                                                                                          
			 async : true,
	         type :'POST',
	         data : msg,
	         url : "${path}/getList",
	         success : function(data)
	         {
	        	 $('.listAll').empty();
	        	/*  console.log("ajax처리했능가 : "+data); */
	        	 var getlist;
	        	 for(var i in data)
	        	 {
	        		 getlist = data[i];
	        		/* 	 console.log(getlist); */
	        		 viewList(getlist);
	        	 }
	         }
		})
		console.log("호이잇"+lookRoom);
		
	}
	//채팅방 리스트를 불러옴
	function viewList(getlist)
	{
		var date = new Date(getlist.lastTime);
		/* console.log("날짜테스트!" + date.getFullYear() + date.getMonth() + date.getDate()+date.getHours() +date.getMinutes()); */
		/* console.log("날짜테스트 : "+ date.format("yy-MM-dd hh:mm")); */
		var checkUserNick = '${sessionScope.login.userNick}';
		var getlistNick = getlist.receiver_user_id;
		console.log(getlist);
		if(checkUserNick === getlistNick)
		{
			console.log("세션 = Receiver");
			if(getlist.unReadCount == 0)
			{
				$(".listAll").append("<div class='mlist' id='"+getlist.chatroom_id+"'><div class='up'><span id ='listChatRoom' style='display : none;''>"+getlist.chatroom_id +"</span><span id ='listChatThat' style='display : none;'>"+getlist.send_user_id+"</span><div class='m_name'>"+getlist.send_user_id+"</div><div class='m_lastday'>"+ date.format("yy-MM-dd HH : mm") +"</div></div><div class='down'><div class='m_info'>"+getlist.lastMessage+"</div><div id='chatroomsetting2'><div id='chatroom_icon'></div><div id='chatroom_exit'>나가기</div></div></div>");	
			}
			else
			{
				$(".listAll").append("<div class='mlist' id='"+getlist.chatroom_id+"'><div class='up'><span id ='listChatRoom' style='display : none;''>"+getlist.chatroom_id +"</span><span id ='listChatThat' style='display : none;'>"+getlist.send_user_id+"</span><div class='m_name'>"+getlist.send_user_id+"</div><div class='m_lastday'>"+ date.format("yy-MM-dd HH : mm") +"</div></div><div class='down'><div class='m_info'>"+getlist.lastMessage+"</div><div class='m_readcount'><span id='_readcount'>"+getlist.unReadCount+"</span></div><div id='chatroomsetting1'><div id='chatroom_icon'></div><div id='chatroom_exit'>나가기</div></div></div>");	
			}
		}
		else
		{
			console.log("세션 = sender");
			if(getlist.unReadCount == 0)
			{
				$(".listAll").append("<div class='mlist' id='"+getlist.chatroom_id+"'><div class='up'><span id ='listChatRoom' style='display : none;''>"+getlist.chatroom_id +"</span><span id ='listChatThat' style='display : none;'>"+getlist.receiver_user_id+"</span><div class='m_name'>"+getlist.receiver_user_id+"</div><div class='m_lastday'>"+ date.format("yy-MM-dd HH : mm") +"</div></div><div class='down'><div class='m_info'>"+getlist.lastMessage+"</div><div id='chatroomsetting2'><div id='chatroom_icon'></div><div id='chatroom_exit'>나가기</div></div></div>");
			}
			else
			{
				$(".listAll").append("<div class='mlist' id='"+getlist.chatroom_id+"'><div class='up'><span id ='listChatRoom' style='display : none;''>"+getlist.chatroom_id +"</span><span id ='listChatThat' style='display : none;'>"+getlist.receiver_user_id+"</span><div class='m_name'>"+getlist.receiver_user_id+"</div><div class='m_lastday'>"+ date.format("yy-MM-dd HH : mm") +"</div></div><div class='down'><div class='m_info'>"+getlist.lastMessage+"</div><div class='m_readcount'><span id='_readcount'>"+getlist.unReadCount+"</span></div><div id='chatroomsetting1'><div id='chatroom_icon'></div><div id='chatroom_exit'>나가기</div></div></div>");	
			}
		}
    	var RoomAreaHeight = $(".listAll").height();
		
		var totalWidth = 0;
		var set = $('.mlist');
		set.each(function(){
			totalWidth = totalWidth + $(this).height();
		});
		var RoomMaxScroll = totalWidth - RoomAreaHeight;	
		$(".mlist").scrollTop(RoomMaxScroll);
		
	}
	
	// 읽은 채팅을 읽음표시로 만듬
	function readUpdate(param)
	{
		var msg = param+'&userNick='+'${sessionScope.login.userNick}';
		console.log('업뎃메세징'+msg);
		$.ajax({                                                                                                                          
			 async : true,
	         type :'POST',
	         data : msg,
	         url : "${path}/readUpdate",
	         success : function(data)
	         {
	        	getList(data);
	         }
		})
	}
	$(document).ready(function() 
	{
		
		$("#chat_text").focus();
		$('#chat_text').keypress(function(event) 
		{	
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') 
			{
				console.log("check: c");
				send();
			}
			event.stopPropagation();
		});


		$('#chat_send').click(function() 
		{
			send();
		});

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
		
		$('#s_text').keyup(function(event) 
		{	
			var keycode = (event.keyCode ? event.keyCode : event.which);
			var s_textContext = $('#s_text').val();
			var param = ""
			$.ajax({                                                                                                                          
				 async : true,
		         type :'POST',
		         data : msg,
		         url : "${path}/readUpdate",
		         success : function(data)
		         {
		        	getList(data);
		         }
			})

		});
		// ajax으로 생성된 채팅리스트도 커버하기 위해 document객체를 불러와서 클릭이벤트 발생
		$(document).on("click", ".mlist",function(event)
		{
			var listChatRoom = $(this).find('#listChatRoom');
			var listChatThat = $(this).find('#listChatThat');
			getRoom(listChatRoom.text(),listChatThat.text(), 1);
			$(this).css({"background-color":"#E6E6E6"});
			var lookRoom_css = $(this);
		});
		
		$(document).on("click","#chatroom_icon",function(event)
		{
			event.stopPropagation();
			var $_next = $(this).next();
			$_next.toggle();
			/* var listChatRoom = $(this).find('#listChatRoom');
			var listChatThat = $(this).find('#listChatThat'); */
			/* getRoom(listChatRoom.text(),listChatThat.text(), 1);
			$(this).css({"background-color":"#E6E6E6"}); */
			/* var lookRoom_css = $(this); */
		});
		
		$(document).on("click","#chatroom_exit",function(event)
		{
			event.stopPropagation();
			var $_target = $(this).closest(".mlist");
			console.log("타게뜨"+$_target.attr('id'));
			var targetRoom = $_target.attr('id');
			//방 삭제
			var param = "userNick="+nick+"&chatroom_id="+targetRoom;
			$.ajax({                                                                                                                          
				 async : true,
		         type :'POST',
		         data : param,
		         url : "${path}/exitRoom",
		         success : function(data)
		         {
		        	var messagelist;
		        	var _chatRoomId; 
		        	 for(var i in data)
		        	 {
		        		 $('.listAll').empty();
		 	        	/*  console.log("ajax처리했능가 : "+data); */
		 	        	 var getlist;
		 	        	 for(var i in data)
		 	        	 {
		 	        		 getlist = data[i];
		 	        		/* 	 console.log(getlist); */
		 	        		 viewList(getlist);
		 	        	 }
		        	 }
		        	 lookRoom = _chatRoomId;
		        	// 채팅방 위에 닉네임초기화
		     		$("#chat_info_nick").empty();
		        	// 채팅, 내용 대상 초기화
		     		receiverNick = null;
		     		$("#chatArea").empty();

		         }
			})
		});
		
	});	
	 // date format 함수  : Date 내장 객체에 format함수 추가
    Date.prototype.format = function(f) 
    {    
        if (!this.valueOf()) return " ";     
        
        var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];    
        var d = this;         
        
        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {        
            switch ($1) {            
               case "yyyy": return d.getFullYear();            
               case "yy": return (d.getFullYear() % 1000).zf(2);            
               case "MM": return (d.getMonth() + 1).zf(2);            
               case "dd": return d.getDate().zf(2);            
               case "E": return weekName[d.getDay()];            
               case "HH": return d.getHours().zf(2);            
               case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);            
               case "mm": return d.getMinutes().zf(2);            
               case "ss": return d.getSeconds().zf(2);            
               case "a/p": return d.getHours() < 12 ? "오전" : "오후";            
               default: return $1;        
             }    
        });}; 

    //한자리일경우 앞에 0을 붙여준다.
    String.prototype.string = function(len)
    {
        var s = '', i = 0; 
        while (i++ < len) { s += this; } 
        return s;
    }; 
    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
    Number.prototype.zf = function(len){return this.toString().zf(len);};

    // 로딩이 다된 후 채팅방리스트 스크롤생성
    $(window).on('load', function()
    {
    	var RoomAreaHeight = $(".listAll").height();
		
		var totalWidth = 0;
		var set = $('.mlist');
		set.each(function(){
			totalWidth = totalWidth + $(this).height();
			
		});
		var RoomMaxScroll = totalWidth - RoomAreaHeight;	
		$(".mlist").scrollTop(RoomMaxScroll);
		
    });
  
</script>
</head>
<body>
	<div class="_meet">
	<div class="container">
		<div id="list">
			<div class="subject">메신저 목록</div>
			<div id="search">
				<input type="text" id="s_text" placeholder="메신저 검색" /> <input
					type="button" id="s_button" value="검색" />
			</div>
			<div class="listAll" style="overflow-y: scroll;">
			<div class="Roomlist">
				<c:forEach var="row" items="${list}">
					<div class="mlist">
						<div class="up">
						<c:choose>
							<c:when test="${sessionScope.login.userNick == row.receiver_user_id}">
							<span id ="listChatRoom" style="display : none;">${row.chatroom_id}</span>
							<span id ="listChatThat" style="display : none;">${row.send_user_id}</span>
							<div class="m_name">${row.send_user_id}</div>
							</c:when>
							<c:otherwise>
							<span id ="listChatRoom" style="display : none;">${row.chatroom_id}</span>
							<span id ="listChatThat" style="display : none;">${row.receiver_user_id}</span>
							<div class="m_name">${row.receiver_user_id}</div>
							</c:otherwise>
						</c:choose>				
							<div class="m_lastday"><fmt:formatDate value="${row.lastTime}" pattern="yy-MM-dd HH : mm"/></div>
						</div>
						<div class="down">
							<div class="m_info">${row.lastMessage}</div>
							<c:if test="${row.unReadCount >0}">
							<div class="m_readcount"><span id='_readcount'>${row.unReadCount}</span></div>
							<div id='chatroomsetting1'>
								<div id='chatroom_icon'></div>
								<div id='chatroom_exit'>나가기</div>
							</div>
							</c:if>
							<c:if test="${row.unReadCount ==0}">
								<div id='chatroomsetting2'>
									<div id='chatroom_icon'></div>
									<div id='chatroom_exit'>나가기</div>
								</div>
							</c:if>
							
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>

		<div id="info">
			<div id="chat_info">
				<div id="chat_info_img"></div>
				<div id="chat_info_nick"></div>
			</div>
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
				<div id="my_name">${sessionScope.userNick} 
					( ${sessionScope.userName} )</div>
			</div>

			<div id="css_tabs">
				<input id="tab1" type="radio" name="tab" checked="checked" /> <input
					id="tab2" type="radio" name="tab" /> <label for="tab1">팔로잉</label>
				<label for="tab2">팔로워</label>
				<div class="tab1_content">
					<c:forEach items="${followingList}" var="list">
						<div>
							<a class="_following" href="javascript:readyRoom('${list.following_nick}');">
							<span class="profile_image"></span><span class="follow_name">${list.following_nick}</span></a>
						</div>
					</c:forEach>
				</div>
				<div class="tab2_content">
					<c:forEach items="${followerList}" var="list">
						<div>						
							<a class="_follower" href="javascript:readyRoom('${list.follower_nick}');"><span class="profile_image"></span><span class="follow_name">${list.follower_nick}</span></a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
