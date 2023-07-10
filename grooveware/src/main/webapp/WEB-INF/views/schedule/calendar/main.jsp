<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* Generic styles */
.modal-content {
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.modal-header {
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal-header .btn-close {
    background-color: #fff;
    color: #333;
    border-radius: 50%;
    height: 25px;
    width: 25px;
}

.modal-body {
    padding: 20px;
}

.modal-body .table {
    width: 100%;
}

.table tr td:first-child {
    font-weight: bold;
    color: #333;
}

.category-list {
	text-align: right;
	margin-bottom : 10px;
}

.category-list label {
	font-size : 20px;
}

.category-list hr {
	vertical-align: middle; 
	display:inline-block; 
	width:1.5%; 
	margin-bottom: 7px;
}

#all { accent-color: #5882FA; }
#department { accent-color: #EE6666; }
#individual { accent-color: #91CC75; }

.text-end {
    text-align: center;
}

</style>
<div class="left-side-bar">
      
        <ul> 
            <li>
                <a href="${pageContext.request.contextPath}/schedule/calendar/main">캘린더</a>
            </li>
             
            <li>
              <a href="${pageContext.request.contextPath}/reservation/main">자원 예약</a>
              <a href="${pageContext.request.contextPath}/reservation/main">&nbsp;회의실 예약</a>
              <a href="${pageContext.request.contextPath}/reservation/myres">&nbsp;내 예약현황</a>
          	<li>
        </ul>
</div>
    
		<div class="right-contentbody">
			<div class="container">	
					<div class="body-title">
						
						<div class="category-list">
							  <input class="category-item" type="checkbox" id="all" name="option" value="0" checked='checked'>
							 
							  <label for="all">전사</label>
							  <input class="category-item" type="checkbox" id="department" name="option" value="${sessionScope.member.dept_no}" checked='checked'>
							 
							  <label for="department">부서</label>
							  <input class="category-item" type="checkbox" id="individual" name="option" value="1" checked='checked'>
							
							  <label for="individual">개인</label>
						 </div>
					</div>	
					
					
					<div id="calendar"></div>
							
				</div>
			</div>

<!-- 일정 상세 보기 Modal -->
<div class="modal" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div style="width: 100%; height: 100%;">
				    	<button type="button" class="arch-close" onclick="closeModal();">&times;</button>
			</div>
			<div class="modal-header">
				<h2 class="modal-title" id="myDialogModalLabel">일정 상세 보기</h2>
			</div>
			<div class="modal-body ">
				<table class="table">
					<tr>
						<td class="">제목</td>
						<td>
							<p class="view-subject"></p>
						</td>
					</tr>
					<tr>
						<td class="">일정분류</td>
						<td>
							<p class="view-category"></p>
						</td>
					</tr>

					<tr>
						<td class="align-middle">날 짜</td>
						<td>
							<p class="view-period"></p>
						</td>
					</tr>

					<tr>
						<td class="align-middle">일정반복</td>
						<td>
							<p class="view-repeat"></p>
						</td>
					</tr>

 					<tr>
						<td class="">등록일</td>
						<td>
							<p class="view-reg_date"></p>
						</td>
					</tr>

 					<tr>
						<td class="">메모</td>
						<td>
							<p class="view-memo"></p>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-end">
								<button type="button" class="btn btn-outline-primary btnScheduleUpdate">일정 수정</button>
				    			<button type="button" class="btn btn-outline-danger btnScheduleDelete">일정 삭제</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

var calendar = null;
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		},
		initialView: 'dayGridMonth', // 처음 화면에 출력할 뷰
		locale: 'ko',
		editable: true,
		navLinks: true,
		dayMaxEvents: true,
		events: function(info, successCallback, failureCallback) {
			var url="${pageContext.request.contextPath}/schedule/calendar/month";
			var startDay=info.startStr.substr(0, 10);
			var endDay=info.endStr.substr(0, 10);
            var query="start="+startDay+"&end="+endDay;
            
            var b = $(".category-list input:checkbox.category-item:checked").length;
            if(b != 0) {
            	$('.category-list input:checkbox.category-item:checked').each(function() {
            		query += "&categorys=" + $(this).val();
            	});
            }
            
        	var fn = function(data){
        		// var events = eval(data.list);
        		// console.log(data.list);
        		successCallback(data.list);
        	};
        	
        	ajaxFun(url, "get", query, "json", fn);

		},
		selectable: true,
		selectMirror: true,
		select: function(info) {
			// 날짜의 셀을 선택하거나 드래그하면 일정 추가 화면으로 이동
			// console.log(info);
			insertSchedule(info.startStr, info.endStr, info.allDay);
			
			calendar.unselect(); // 현재 선택된 영역을 지움
		},
		eventClick: function(info) {
			// 일정 제목을 선택할 경우
			
			//  상세 일정 보기
			viewSchedule(info.event);
		},
		eventDrop: function(info) {
			// 일정을 드래그 한 경우
			
			// 수정하기
			updateDrag(info.event);
		},
		eventResize: function(info) {
			// 일정의 크기를 변경 한 경우
			
			// 수정하기
			updateDrag(info.event);
		},
		loading: function(bool) {
			//document.getElementById('scheduleLoading').style.display = bool ? 'block' : 'none';
		}
	});

	calendar.render();
});

$(function() {
	$('body').on('change', ".category-list input:checkbox.category-item", function () {
		
		// 카테고리 검색
		calendar.refetchEvents();
		
	});
});



// 일정 등록 폼
function insertSchedule(startStr, endStr, allDay) {
	var query;
	
	if(allDay) {
		query = "sday="+startStr;
		if(endStr) {
			endStr = daysLater(endStr, 0); // 종일 일정인 경우 끝나는 날짜가 +1 로 선택 되므로 -1 함 
			query += "&eday=" + endStr;
		}
		query += "&all_day=1";
	} else {
		query = "sday="+startStr.substr(0, 10);
		query += "&eday="+endStr.substr(0, 10);
		query += "&stime="+startStr.substr(11, 5);
		query += "&etime="+endStr.substr(11, 5);
		query += "&all_day=0";
	}

	location.href="${pageContext.request.contextPath}/schedule/calendar/write?"+query;
}

// 일정 상세 보기
function viewSchedule(calEvent) {
	document.getElementById("myDialogModal").style.display = "block";
	
	// console.log(calEvent);
	
	var num = calEvent.id;
	var title = calEvent.title;
	var color = calEvent.backgroundColor;
	// var start = calEvent.start;
	// var end = calEvent.end;
	var start = calEvent.startStr;
	var end = calEvent.endStr;
	var allDay = calEvent.allDay;

	var category_num = calEvent.extendedProps.category_num;
	var category = calEvent.extendedProps.category;
	if(! category) category = "설정하지 않음";
	
	var sday = calEvent.extendedProps.sday;
	var eday = calEvent.extendedProps.eday;
	var stime = calEvent.extendedProps.stime;
	var etime = calEvent.extendedProps.etime;
	
	var memo = calEvent.extendedProps.memo;
	if(! memo) memo = "";
	var reg_date = calEvent.extendedProps.reg_date;
	var repeat = calEvent.extendedProps.repeat;
	var repeat_cycle = calEvent.extendedProps.repeat_cycle;
	
	$(".btnScheduleUpdate").attr("data-num", num);
	$(".btnScheduleDelete").attr("data-num", num);
	
	var s;
	$(".view-subject").html(title);
	
	s = allDay ? "종일일정" : "시간일정";
	$(".view-category").html(category + ", " + s);
	
	s = sday;
	if( stime ) {
		s += " "+stime;
	}
	if( eday && allDay ) {
		eday = daysLater(eday, 0);
		if(sday < eday) {
			s += " ~ " + eday;
		}
	} else if( eday ) {
		s += " ~ " + eday;
	}
	if( etime ) s += " " + etime;
	$(".view-period").html(s);
	
	$(".view-reg_date").html(reg_date);
	
	s = repeat != 0 && repeat_cycle != 0 ? "반복일정, 반복주기 " + repeat_cycle + "년" : "반복안함";
	$(".view-repeat").html(s);
	
	$(".view-memo").html(memo);
}

$(function(){
	// 일정 수정 화면
	$(".btnScheduleUpdate").click(function(){
		var num = $(this).attr("data-num");
		location.href="${pageContext.request.contextPath}/schedule/calendar/update?num="+num;
	});

	// 일정 삭제
	$(".btnScheduleDelete").click(function(){
		if(! confirm("일정을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		var fn = function(data){
			var event = calendar.getEventById(num);
	        event.remove();
	        
	        document.getElementById("myDialogModal").style.display = "none";
		};
		
		var num = $(this).attr("data-num");
		var query = "num="+num;
		var url = "${pageContext.request.contextPath}/schedule/calendar/delete";

		ajaxFun(url, "post", query, "json", fn);
		
	});
});

// 일정을 드래그한 경우 일정 수정
function updateDrag(calEvent) {
	var num = calEvent.id;
	var title = calEvent.title;
	var color = calEvent.backgroundColor;
	var start = calEvent.startStr;
	var end = calEvent.endStr;
	var allDay = calEvent.allDay;
	
	var category_num = calEvent.extendedProps.category_num;
	
	var memo = calEvent.extendedProps.memo;
	if(! memo) memo = "";
	var repeat = calEvent.extendedProps.repeat;
	var repeat_cycle = calEvent.extendedProps.repeat_cycle;
	
	var startDate="", endDate="", startTime="", endTime="", all_day="";
	if(allDay) {
		startDate = start;
		endDate = end;
		all_day = "1";
	} else {
		startDate = start.substr(0, 10);
		endDate = end.substr(0, 10);
		startTime = start.substr(11, 5);
		endTime = end.substr(11, 5);
	}
	
	var query = "num="+num+"&subject="+title
			+ "&category_num="+category_num+"&color="+color
			+ "&all_day="+all_day
			+ "&sday="+startDate+"&eday="+endDate
			+ "&stime="+startTime+"&etime="+endTime
			+ "&repeat="+repeat+"&repeat_cycle="+repeat_cycle;
			+ "&memo="+memo
	
	var url = "${pageContext.request.contextPath}/schedule/calendar/updateDrag";

	var fn = function(data) {
		// 모든 소스의 이벤트를 다시 가져와 화면에 다시 렌더링
		calendar.refetchEvents();
	};
	ajaxFun(url, "post", query, "json", fn);
}

function closeModal() {
	document.getElementById("myDialogModal").style.display = "none";
}
</script>
		


	
		