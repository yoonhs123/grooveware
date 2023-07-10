<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
﻿

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
		if(record_no == "1") {
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

	<div class="item1">
		<div class="desc-area commuteBox">
			<span class="title fontColor"></span> 
			<div class="box-profile profile-picture">
				<img alt="" src="">
			</div>
			<div class="box-profile">
				<span> 정유진1 </span>
				<br>
				<span> 인사팀 </span> | <span> 사원 </span>
			</div>
		</div>
		<div class="desc-area commuteBox1">
			<div class = "box-workTime">
				<span class="title">출퇴근기록</span>
				<br>
				<span>날짜</span> <div class="today-layout"></div>
				<div>
					<span>출근</span> <span class="bold">${workTime.work_starttime}</span>
					<br>
					<span>퇴근</span> <span class="bold">${workTime.work_endtime}</span>
					<br>

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
			<span> 내 휴가통계 </span>
			</div>
			<div>
				<div class="list-item">
					<div class="subfontColor">연차휴가</div>
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
					<div class="fontColor">보상휴가</div>
					<div class="minibox">총 15일 사용 1일 잔여 14일</div>
				</div>
				<div class="list-item">
					<div class="fontColor">연차휴가</div>
					<div class="minibox">총 15일 사용 1일 잔여 14일</div>
				</div>
				
					
			</div>
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="fontColor title" style="font-size: 18px;">전자결재</span>

			<div style="margin-top: 30px;">
				<c:forEach var="n" begin="1" end="4">
					<div class="list-item">
						<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
						<div  class="minibox2">
						<span>문서 #2342345</span>
						<span style="text-align: right;">댓글 0 최고관리자 2023.06.05</span>
						</div>								</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="fontColor title" style="font-size: 18px;">프로젝트 현황</span>

			<div style="margin-top: 30px;">
				<c:forEach var="n" begin="1" end="4">
					<div class="list-item">
						<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
						<div  class="minibox2">
						<span>문서 #2342345</span>
						<span style="text-align: right;">댓글 0 최고관리자 2023.06.05</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="fontColor title" style="font-size: 18px;">전체 공지사항</span>

			<div style="margin-top: 30px;">
				<c:forEach var="n" begin="1" end="4">
					<div class="list-item">
						<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
						<div class="minibox">댓글 0 최고관리자 2023.06.05</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<span class="fontColor title" style="font-size: 18px;">${dto.noti_title}</span>

			<div style="margin-top: 30px;">
				<c:forEach var="n" begin="1" end="4">
					<div class="list-item">
						<div class="fontColor">전직원 전자결재 작성요령(결재라인 포함)</div>
						<div  class="minibox2">
						<span>문서 #2342345</span>
						<span style="text-align: right;">댓글 0 최고관리자 2023.06.05</span>
						</div>								
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

