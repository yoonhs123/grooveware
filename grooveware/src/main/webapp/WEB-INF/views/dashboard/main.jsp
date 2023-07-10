<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
﻿
<style>
.btnWorkTime{
	height: 40px;
	width: 80px;
    border: none;
	border-radius: 5px;
    padding: 5px 10px;
    font-weight: 600;
    color: #fff;
    background-color: #243A73;
    text-align: center;
    margin: 0 30px;
}
.WorkTime-btn{
    text-align: center;
}
.dContainer,
.dashFont,
.list-item {
    color: #243A73;
}

main {
   background : #dbe7f724;
}

</style>

<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType: dataType,
		success: function(data){
			fn(data);
		},
		beforeSend : function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR){
			if(jqXHR.status === 403){
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400){
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function showClock(){
	var now = new Date();

	var y = now.getFullYear();
	var m = now.getMonth() + 1;
	if(m<10) m = "0" + m;
	var d = now.getDate();
	if(d<10) d = "0" + d;

	var hr = now.getHours();
	if(hr<10) hr = "0" + hr;
	var mn = now.getMinutes();
	if(mn<10) mn = "0" + mn;
	var sc = now.getSeconds();
	if(sc<10) sc = "0" + sc;

	var s = y + '-' + m + '-' + d + ' ' + hr + ':' + mn + ':' + sc;
	
	document.querySelector(".today-layout").innerHTML = s;
	setTimeout("showClock()", 1000);
}

window.addEventListener("load", function(){
	showClock();
});

$(function(){
	$(".btnWorkTime").click(function(){
		let record_no = $(this).attr("data-record_no");
		
		let msg = "출근 하시겠습니까 ?";
		if(record_no != "0") {
			msg = "퇴근 하시겠습니까 ?";
		}
		
		if(! confirm(msg)) {
			return false;
		}
		
		const f = document.workTimeForm;
		f.record_no.value = record_no;
		
		f.action="${pageContext.request.contextPath}/dashboard/workTime";
		f.submit();
		
	});
});
</script>

<div>
<div class="dContainer">

	<div class="item">
		<div class="desc-area commuteBox">
			<span class="title fontColor"></span> 
			<div class="box-profile profile-picture">
				<img alt="" src="">
			</div>
			<div class="box-profile">
				<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_picture}">
				<span> ${myInsa.emp_name} </span>
				<br>
				<span>${sessionScope.member.dept_name} </span> | <span> ${sessionScope.member.pos_name} </span>
			</div>
		</div>
		<div class="desc-area commuteBox1">
			<div class = "box-workTime">
				<span class="title">${myInsa.emp_name}님 출퇴근기록</span>
				<br>
				<span>날짜</span> <div class="today-layout"></div>
				<div>
					<span>출근</span> <span class="bold">${workTime.work_starttime}</span>
					<br>
					<span>퇴근</span> <span class="bold">${workTime.work_endtime}</span>
					<br>
				</div>
				<div class="WorkTime-btn">
					<button class="btnWorkTime" data-record_no="0" 
							${empty workTime ? "" : "disabled='disabled'" }>출근하기</button>

					<button class="btnWorkTime" data-record_no="${workTime.record_no}"
							${not empty workTime && empty workTime.work_endtime ? "" : "disabled='disabled'" }>퇴근하기</button>
				</div>
			</div>
			
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<div class="title-di">
			<span><i class="fa-solid fa-plane"></i>&nbsp;&nbsp;내 휴가통계 &nbsp;&nbsp;<i class="fa-regular fa-square-arrow-right"></i></span>
			</div>
			<div>
				<div class="list-item">
					<div class="dashFont">연차휴가</div>
					<br>
					<div>
					<span>총 휴가일수</span>
					<div style="display: inline-block;" align="right">15일</div>
					</div>
					<div>
					<span>사용일수</span>
					<span style="display: inline-block; text-align:right;">5일</span>
					</div>
					<div>
					<span>잔여일수</span>
					<span style="display: inline-block; text-align:right;">10일</span>
					</div>
				</div>
				<div class="list-item">
					<div class="dashFont">보상휴가</div>
					<br>
					<div>
					<span>총 휴가일수</span>
					<div style="display: inline-block;" align="right">15일</div>
					</div>
					<div>
					<span>사용일수</span>
					<span style="display: inline-block; text-align:right;">5일</span>
					</div>
					<div>
					<span>잔여일수</span>
					<span style="display: inline-block; text-align:right;">10일</span>
					</div>
				</div>					
			</div>
		</div>
	</div>
		<div class="item">
		<div class="desc-area commuteBox1">
			<span class="dashFont title" style="font-size: 18px;"><i class="fa-solid fa-inbox"></i>&nbsp;&nbsp;전자결재</span>

			<div style="margin-top: 30px;">
				<c:forEach var="appro" items="${approvalList}" varStatus="status">
					<div class="list-item">
						<div class="dashFont">${appro.doc_name}</div>
						<div class="minibox">결재단계 ${appro.approval_status==1?'진행중':''} 처리기한 ${appro.draft_deadline} 기안자 ${appro.emp_name}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="dashFont title" style="font-size: 18px;"><i class="fa-solid fa-paper-plane"></i>&nbsp;&nbsp;업무요청 수신함</span>

			<div style="margin-top: 30px;">
				<c:forEach var="listTask" items="${listTask}" varStatus="status">
					<div class="list-item">
						<div class="dashFont">${listTask.task_name}</div>
						<div class="minibox"> 업무요청자 ${listTask.emp_name} 업무마감날짜 ${listTask.task_end_date}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="dashFont title" style="font-size: 18px;"><i class="fa-solid fa-bullhorn"></i>&nbsp;&nbsp;사내 공지사항</span>

			<div style="margin-top: 30px;">
				<c:forEach var="noti" items="${notiList}" varStatus="status">
					<div class="list-item">
						<div class="dashFont"><a></a> ${noti.noti_title}</div>
						<div class="minibox">작성일 ${noti.noti_regdate} 조회수 ${noti.noti_hitcount} </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="dashFont title" style="font-size: 18px;"><i class="fa-solid fa-clipboard-list"></i>&nbsp;&nbsp;${sessionScope.member.dept_name} 공지사항</span>

			<div style="margin-top: 30px;">
				<c:forEach var="deptnoti" items="${deptnotiList}" varStatus="status">
					<div class="list-item">
						<div class="dashFont"><a></a> ${deptnoti.noti_title}</div>
						<div class="minibox">작성일 ${deptnoti.noti_regdate} 조회수 ${deptnoti.noti_hitcount} </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<form name="workTimeForm" method="post">
	<input type="hidden" name="record_no">
</form>

</div>

