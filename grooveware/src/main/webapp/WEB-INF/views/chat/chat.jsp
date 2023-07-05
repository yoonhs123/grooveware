<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="left-side-bar">
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/address/list">주소록</a>
            <a href="${pageContext.request.contextPath}/chat/chat">메신저</a>
        </li>
    </ul>
    <hr>
</div>

<div class="right-contentbody">

    <div class="title_container">
        <table class="table" style="margin-bottom: 20px;">
            <tr>
                <td class="title"><i class="fa-brands fa-facebook-messenger"></i>&nbsp;<span>그루비&nbsp;톡</span></td>
            </tr>
        </table>
    </div>
  <div class="chat-main">
    <div class="chat-left">
        <div class="chat-left-main">
             <div class="mt-2">
            <p class="form-control-plaintext fs-6">
                <i class="bi bi-chevron-double-right"></i> &nbsp; 그루비 &nbsp; 톡 </p>
            </div>
        </div>
        <div class="chat-msg-container"></div>
      
            <input type="text" id="chatMsg" class="form-control" placeholder="채팅 메시지를 입력하세요...">
     
    </div>
    
    <div class="chat-right">	
        <div class="mt-3">
        <p class="form-control-plaintext fs-6">
            <i class="bi bi-chevron-double-right"></i> 접속자 리스트</p>
        </div>
        <div class="chat-connection-list"></div>
      </div>

        </div>
         
</div>


<script type="text/javascript">
$(function(){
	var socket = null;
	
	// - 채팅창을 실행할 때 다음과 같이 ip로 실행
	//   http://아이피주소:포트번호/cp/chat/main

	// - 채팅서버
	//   ws://ip주소:포트번호/cp/chat.msg
	var host="${wsURL}";
	// var host='wss://' + window.location.host + '/wchat.msg';  // https
	
	if ('WebSocket' in window) {
		socket = new WebSocket(host);
    } else if ('MozWebSocket' in window) {
    	socket = new MozWebSocket(host);
    } else {
    	writeToScreen("<div class='chat-info'>브라우저의 버전이 낮아 채팅이 불가능 합니다.</div>");
        return false;
    }

	socket.onopen = function(evt) { onOpen(evt) };
	socket.onclose = function(evt) { onClose(evt) };
	socket.onmessage = function(evt) { onMessage(evt) };
	socket.onerror = function(evt) { onError(evt) };
	
	 // 서버 접속이 성공한 경우 호출되는 콜백함수
	function onOpen(evt) {
		 // Login 처리에서 세션에 memberIdx 저장 유무 확인
	    let uid = "${sessionScope.member.emp_no}";
	    let nickName = "${sessionScope.member.emp_name}";
	    if( ! uid ) {
	    	location.href="${pageContext.request.contextPath}/member/login";
	    	return;
	    }
	    
		writeToScreen("<div class='msg-right'>채팅방에 입장했습니다.</div>");
	    
	    // 서버 접속이 성공 하면 아이디와 이름을 JSON으로 서버에 전송
	    let obj = {};
	    obj.type = "connect";
	    obj.uid = uid;
	    obj.nickName = nickName;
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
	    
	    // 채팅입력창에 메시지를 입력하기 위해 #chatMsg에 keydown 이벤트 등록
	    $("#chatMsg").on("keydown",function(evt) {
	    	// 엔터키가 눌린 경우, 서버로 메시지를 전송한다. 맥은 13 으로만 비교해야 함
	    	let key = evt.key || evt.keyCode;
	        if (key === "Enter" || key === 13) {
	            sendMessage();
	        }
	    });
	}

	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {
		// 채팅 입력창 이벤트를 제거 한다.
       	$("#chatMsg").off("keydown");
       	writeToScreen("<div class='chat-info'>Info: WebSocket closed.</div>");
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
    	// console.log(evt.data);
    	
    	// 전송 받은 JSON 문자열을 자바 객체로 변환
    	let data = JSON.parse(evt.data); // JSON 파싱
    	let cmd = data.type;
    	
    	if(cmd === "userList") { // 처음 접속할때 접속자 리스트를 받는다.
    		let users = data.users;
    		for(let i = 0; i < users.length; i++) {
    			let uid = users[i][0];
    			let nickName = users[i][1];
    			
    			let out = "<span id='user-"+uid+"' data-uid='"+uid+"'><i class='bi bi-person-square'></i> "+nickName+"</span>";
        		$(".chat-connection-list").append(out);
    		}
    		
    	} else if(cmd === "userConnect") { // 다른 접속자가 접속했을 때
    		let uid = data.uid;
    		let nickName = data.nickName;
    		
    		let out = "<div class='chat-info'>"+nickName+"님이 입장하였습니다.</div>";
    		writeToScreen(out);
    		
    		out = "<span id='user-"+uid+"' data-uid='"+uid+"'><i class='bi bi-person-square'></i> "+nickName+"<span>";
    		$(".chat-connection-list").append(out);
    		
    	} else if(cmd === "userDisconnect") { // 접속자가 나갔을 때
    		let uid = data.uid;
    		let nickName = data.nickName;
    		
    		let out = "<div class='chat-info'>"+nickName+"님이 나갔습니다.</div>";
    		writeToScreen(out);
    		
    		$("#user-"+uid).remove();

    	} else if(cmd === "message") { // 메시지를 받은 경우
    		let uid = data.uid;
    		let nickName = data.nickName;
    		let msg = data.chatMsg;
    		
    		let out = "<div class='user-left'>" + nickName + "</div>";
    		out += "<div class='msg-left'>" + msg + "</div>";
    		writeToScreen(out);
    		
    	} else if(cmd === "whisper") { // 위스퍼
    		let uid = data.uid;
    		let nickName = data.nickName;
    		let msg = data.chatMsg;
    		
    		let out = "<div class='user-left'>" + nickName + "(귓속)</div>";
    		out += "<div class='msg-left'>" + msg + "</div>";
    		
    		writeToScreen(out);
    	}  else if(cmd === "time") {
    		// console.log(evt.data);
    	}
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {
		writeToScreen("<div class='chat-info'>Info: WebSocket error.</div>");
	}
	
	// 채팅 메시지 전송
	function sendMessage() {
		let msg = $("#chatMsg").val().trim();
	    if(! msg ) {
	    	$("#chatMsg").focus();
	    	return;
	    }
	    
	    let obj = {};
        obj.type = "message";
        obj.chatMsg = msg;
        
        let jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);

        $("#chatMsg").val("");
        writeToScreen("<div class='msg-right'>" + msg +"<div>");
	}
	
	// -----------------------------------------
	// 채팅 참여자 리스트를 클릭한 경우 위스퍼(귓속말, dm) 대화상자 열기
	$("body").on("click", ".chat-connection-list span", function(){
		let uid = $(this).attr("data-uid");
		let nickName = $(this).text();
		
		$('#chatOneMsg').attr("data-uid", uid);
		$('#chatOneMsg').attr("data-nickName", nickName);
		
		$("#myDialogModalLabel").html("귓속말-"+nickName);
		$("#myDialogModal").modal("show");
	});
	
	const modalEl = document.getElementById("myDialogModal");
	modalEl.addEventListener("show.bs.modal", function(){
		// 모달 대화상자가 보일때
		$("#chatOneMsg").on("keydown", function(evt){
			let key = evt.key || evt.keyCode;
			if(key === 'Enter' || key === 13) {
				sendOneMessage();
			}
		});
	});
	modalEl.addEventListener("hidden.bs.modal", function(){
		// 모달 대화상자가 사라질때
		$("#chatOneMsg").off("keydown");
		$("#chatOneMsg").val("");
	});
	
	// -----------------------------------------
	// 귓속말 전송
	function sendOneMessage() {
		let msg = $("#chatOneMsg").val().trim();
		if(! msg) {
			$("#chatOneMsg").focus();
			return;
		}
		
		let uid = $('#chatOneMsg').attr("data-uid");
		let nickName = $('#chatOneMsg').attr("data-nickName").trim();
		
		let obj = {};
        obj.type = "whisper";
        obj.chatMsg = msg;
        obj.receiver = uid;
        
        let jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);
        
        writeToScreen("<div class='msg-right'>"+msg+"("+nickName+")</div>");
        
        $("#chatOneMsg").val("");
        $("#myDialogModal").modal("hide");
	}
	
});

//---------------------------------------------
// 채팅 메시지를 출력하기 위한 함수
function writeToScreen(message) {
    const $msgContainer = $(".chat-msg-container");
    $msgContainer.append(message);

    // 스크롤을 최상단에 있도록 설정함
    $msgContainer.scrollTop($msgContainer.prop("scrollHeight"));
}
</script>