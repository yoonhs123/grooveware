<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

﻿
<style>
.btnWorkTime{
	height: 40px;
	width: 80px;
    border: none;
	border-radius: 30px;
    padding: 5px 10px;
    font-weight: 600;
    color: #fff;
    background-color: #243A73;
    text-align: center;
    margin: 0 15px;
}
.btnWorkTime:disabled {
  background: #ccc;
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

.appro-status-btn{
	height: 22px;
	width: 60px;
	padding: 1.5px 7px;
    border: none;
	border-radius: 5px;
    font-weight: 500;
    color: #fff;
    background-color: #91CC75;
    text-align: center;
}
.appro-status-dis{
	display: inline-block;
	float : left;
}
.dash-list{
    border-bottom: 1px solid silver;
    padding: 13px;
    position: relative;
    font-weight: 600;
}
.dash-list-title{
    position: relative;
    font-weight: 600;
}
.task-dept-btn{
	height: 22px;
	width: 92px;
	padding: 1.5px 7px;
    border: none;
	border-radius: 5px;
    font-weight: 500;
    color: #fff;
    background-color: #FAC858;
    text-align: center;	
}
.noti-list-btn{
	height: 22px;
	width: 45px;
	padding: 1.5px 7px;
    border: none;
	border-radius: 5px;
    font-weight: 500;
    color: #fff;
    background-color: #EE6666;
    text-align: center;	
    font-size: 12px;
}

.profile-btn{
	height: 22px;
	width: 40px;
	padding: 1.5px 5px;
    border: none;
	border-radius: 5px;
    font-weight: 500;
    color: #fff;
    background-color: #73C0DE;
    text-align: center;	
    font-size: 12px;
}

.item>.desc-area{
	margin: 20px;
}

.dContainer > .profile-picture-dash {
	cursor: pointer;
	border: 1px solid #d3d3d3;
	flex-direction: column;
	justify-content: space-between;
	border-radius: 5px;
	background-color: white;
	word-wrap: break-word;
	box-shadow: 0 3px 3px rgba(0,0,0,0.2);
	padding: 20px;
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

	<div class="profile-item item">
		<div class="desc-area commuteBox">
			<span class="title fontColor"></span> 
			<div class="box-profile profile-picture-dash" style="text-align:center; overflow:hidden">	
				<img src="${pageContext.request.contextPath}/uploads/insaManage/${myInsa.emp_save_filename}" style="width: 80%; object-fit:cover; height: 100%">
			</div>
			<div class="box-profile" style="padding: 15px 12px;">
				<div style="text-align:center; margin: 5px 0; font-size: 20px; font-weight: 600; padding: 10px 0;"> ${myInsa.emp_name}  </div>
				<div style="text-align:left; margin: 5px 0; font-size: 16px; padding-bottom: 10px;"> ${sessionScope.member.dept_name} | ${sessionScope.member.pos_name} </div>
				<div style="text-align:left; margin: 5px 0; font-size: 16px; padding-bottom: 10px;"> 사&nbsp;원&nbsp;번&nbsp;호 | ${sessionScope.member.emp_no} </div>
			</div>
		</div>
		<div class="desc-area commuteBox" >
			<div class = "box-workTime" style="width:100%; height:80px; padding: 15px 12px; border-top: 1px solid silver;">
				<span style="font-weight: bold; font-size: 20px;">출퇴근기록</span>
				<br>
				<div>
				<div class="today-layout" style="text-align: center; font-size: 22px; padding: 7px 0; font-weight: 500;"></div>
				</div>
				<div style="clear:both;"></div>
				<div style="text-align: center; font-size: 19px; padding: 7px 0; font-weight: bold;">
					<span>출근</span>&nbsp;&nbsp;<span>${workTime.work_starttime}</span>
					&nbsp;&nbsp;
					<span>퇴근</span>&nbsp;&nbsp;<span>${workTime.work_endtime}</span>
				</div>
				<div class="WorkTime-btn"style="padding: 7px 0;">
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
			<span><i class="fa-solid fa-plane"></i>&nbsp;&nbsp;내 휴가통계 &nbsp;&nbsp;</span>
			</div>
			<div>
				<div class="list-item">
					<div class="dash-list-title">연차휴가</div>
				</div>
				<div class="list-item" style="padding : 15px 20px;">
					<div style="padding: 1.5px 0;">
					<span style="float: left; letter-spacing: 0.5px;">총 휴가일수</span>
					<span style="float: right; letter-spacing: 0.5px;">15일</span>
					</div>
					
					<div style="padding: 1.5px 0;">
					<span style="float: left; letter-spacing: 0.5px;">사용일수</span>
					<span style="float: right; letter-spacing: 0.5px;">5일</span>
					</div>
					
					<div style="padding: 1.5px 0;">
					<span style="float: left; letter-spacing: 0.5px;">잔여일수</span>
					<span style="float: right; letter-spacing: 0.5px;">10일</span>
					</div>
				</div>
				<div class="list-item">
					<div class="dash-list-title">보상휴가</div>
				</div>
				<div class="list-item" style="padding : 15px 20px;">
					<div style="padding: 1.5px 0; ">
					<span style="float: left; letter-spacing: 0.5px;">총 휴가일수</span>
					<span style="float: right; letter-spacing: 0.5px;">11일</span>
					</div>
					
					<div style="padding: 1.5px 0; ">
					<span style="float: left; letter-spacing: 0.5px;">사용일수</span>
					<span style="float: right; letter-spacing: 0.5px;">3일</span>
					</div>
					
					<div style="padding: 1.5px 0; ">
					<span style="float: left; letter-spacing: 0.5px;">잔여일수</span>
					<span style="float: right; letter-spacing: 0.5px;">8일</span>
					</div>
				</div>					
			</div>
		</div>
	</div>
		<div class="item">
		<div class="desc-area commuteBox1">
			<div class="title-di">
			<span class="dashFont" style="font-size: 18px; text-align: left; float: left;"><i class="fa-solid fa-inbox"></i>&nbsp;&nbsp;전자결재</span> 
			<span style="text-align: right; float: right;"><i class="fa-solid fa-bars-staggered"></i></span>
			</div>
			<div class="dash-list-item" style="border-top: 1px solid silver;">
				<c:forEach var="appro" items="${approvalList}" varStatus="status">
					<div class="dash-list">
						<span>${appro.doc_name}</span>&nbsp;
						<button class="appro-status-btn">${appro.doc_status==1?'진행중':''}</button>
						<div class="minibox"> 기안자 정유진 | 처리기한 ${appro.draft_deadline} </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="item">
		<div class="desc-area commuteBox1">
			<div class="title-di">
			<span class="dashFont" style="font-size: 18px; text-align: left; float: left;"><i class="fa-solid fa-paper-plane"></i>&nbsp;&nbsp;업무요청 수신함</span>
			<span style="text-align: right; float: right;"><i class="fa-solid fa-bars-staggered"></i></span>
			</div>
			<div class="dash-list-item" style="border-top: 1px solid silver;">
				<c:forEach var="listTask" items="${listTask}" varStatus="status">
					<div class="dash-list">
						<c:choose>
							<c:when test="${listTask.task_name.length() > 18}">
								${fn:substring(listTask.task_name, 0, 18)}....
								&nbsp;
								<button class="task-dept-btn">${listTask.dept_name}</button>
							</c:when>
							<c:otherwise>
								${listTask.task_name}
								&nbsp;
								<button class="task-dept-btn">${listTask.dept_name}</button>
							</c:otherwise>
						</c:choose>
						<div class="minibox"> 요청자 ${listTask.emp_name} | 마감기한 ${listTask.task_end_date}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="item">
		<div class="desc-area commuteBox1">
			<div class="title-di">
			<span class="dashFont" style="font-size: 18px; text-align: left; float: left;"><i class="fa-solid fa-bullhorn"></i>&nbsp;&nbsp;사내 공지사항</span>
			<span style="text-align: right; float: right;"><i class="fa-solid fa-bars-staggered"></i></span>
			</div>
			<div class="dash-list-item" style="border-top: 1px solid silver;">
				<c:forEach var="noti" items="${notiList}" varStatus="status">
					<div class="dash-list">
						<c:choose>
							<c:when test="${noti.noti_title.length() > 22}">
								${fn:substring(noti.noti_title, 0, 22)}....
								&nbsp;
								<button class="noti-list-btn">NEW</button>
							</c:when>
							<c:otherwise>
								${noti.noti_title}
								&nbsp;
								<button class="noti-list-btn">NEW</button>
							</c:otherwise>
						</c:choose>
						<div class="minibox">작성자 관리자 | 작성일 ${noti.noti_regdate} </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="item">
		<div class="desc-area commuteBox1">
			<div class="title-di">
			<span class="dashFont" style="font-size: 18px; text-align: left; float: left;"><i class="fa-solid fa-clipboard-list"></i>&nbsp;&nbsp;${sessionScope.member.dept_name} 공지사항</span>
			<span style="dtext-align: right; float: right;"><i class="fa-solid fa-bars-staggered"></i></span>
			</div>
			<div class="dash-list-item" style="border-top: 1px solid silver;">
				<c:forEach var="deptnoti" items="${deptnotiList}" varStatus="status">
					<div class="dash-list">
						<span>${deptnoti.noti_title}</span>&nbsp;
						<button class="noti-list-btn">NEW</button>
						<div class="minibox">작성자 관리자 | 작성일 ${deptnoti.noti_regdate} </div>
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

