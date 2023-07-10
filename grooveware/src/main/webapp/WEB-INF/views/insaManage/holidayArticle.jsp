<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.profile-name {
	width: 10%;
	height: 50px;
	padding-top: 10px;
	text-align: center;
}
</style>

<script type="text/javascript">
function searchDate() {
	let y = $("#select-year").val();
	let m = $("#select-month").val();
	
	if(!y || !m) {
		alert('날짜를 선택하세요.');
		return;
	}
	
	let query = "year=" +y+ "&month=" +m;
	location.href = "${pageContext.request.contextPath}/myInsa/workRecord?" +query;
}
</script>


<div class="left-side-bar">
    <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70}">
            <!-- dept_no가 60~70 사이일 때만 아래 <li> 태그들이 보이도록 처리하기 -->
            <li>
                <a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/workList">&nbsp;근태관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidayList">&nbsp;휴가관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidaySetting">&nbsp;휴가설정</a>
            </li>
        </c:when>
        <c:otherwise>
            <!-- dept_no가 60~ 70 사이가 아닐 때는 두 번째 <li> 태그를 출력하지 않게 -->
        </c:otherwise>
   	 	</c:choose>
	</ul>
</div>


<div class="right-contentbody">
			<div class="board">
				<div class="main-container" style="width: 100%;">
					<h2><i class="fa-solid fa-briefcase"></i>&nbsp; ${dto.emp_name}님 출근 현황</h2>
					<div class="total-worktime" style="">
						<table class="table table-border table-list total-worktime" style="padding:30px 0px 0px 30px; border: 2px solid #ced4da">
							<tr style="border-bottom: 2px solid #ced4da">
								<th width="14%">연차휴가</th>
								<th width="14%">정상출근</th>
								<th width="14%">지각</th>
								<th width="14%">결근</th>
								<th width="14%">조퇴</th>
								<th width="14%">유급사용</th>
								<th width="14%">무급사용</th>
							</tr>

							<tr>
								<td>0일</td>
								<td>${dto.work_Count}일</td>
								<td>${dto.workLate_Count}일</td>
								<td>${dto.workAbsence_Count}일</td>
								<td>${dto.workLateEarly_Count}일</td>
								<td>0일</td>
								<td>0일</td>
							</tr>
						</table>
					</div>
				
				<div class="worktime-select">
						<select id="select-year" name="year" class="year">
							<option value="" disabled="disabled">년도</option>
							<c:forEach var="y" begin="${currentYear-5}" end="${currentYear}">
								<option value="${y}" ${year==y?"selected='selected'" : "" }>${y}년</option>
							</c:forEach>
						</select>
						<select id="select-month" name="month" class="month">
							<option value="" disabled="disabled">월</option>
							<option value="01" ${month=="01" ? "selected='selected'" : ""}>1월</option>
							<option value="02" ${month=="02" ? "selected='selected'" : ""}>2월</option>
							<option value="03" ${month=="03" ? "selected='selected'" : ""}>3월</option>
							<option value="04" ${month=="04" ? "selected='selected'" : ""}>4월</option>
							<option value="05" ${month=="05" ? "selected='selected'" : ""}>5월</option>
							<option value="06" ${month=="06" ? "selected='selected'" : ""}>6월</option>
						 	<option value="07" ${month=="07" ? "selected='selected'" : ""}>7월</option>
							<option value="08" ${month=="08" ? "selected='selected'" : ""}>8월</option>
							<option value="09" ${month=="09" ? "selected='selected'" : ""}>9월</option>
							<option value="10" ${month=="10" ? "selected='selected'" : ""}>10월</option>
							<option value="11" ${month=="11" ? "selected='selected'" : ""}>11월</option>
							<option value="12" ${month=="12" ? "selected='selected'" : ""}>12월</option>
						</select>
						<button type="button" class="work-search-btn" onclick="searchDate();">검색</button>
					</div>
					
					<div class="calendar-worktime">
						<table class="table table-form total-worktime" style="border: 2px solid #ced4da">
							<thead>
								<tr class="work-record-border">
									<th style="width: 25%">날짜</th>
									<th style="width: 25%">출근</th>
									<th style="width: 25%">퇴근</th>
									<th style="width: 25%">비고</th>
								</tr>
							</thead>
							<tbody style="text-align: center;">
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr>
									<td>${dto.work_day}</td>
									<td>${dto.work_starttime}</td>
									<td>${dto.work_endtime}</td>
									<td>
										${dto.work_status == 0 ? "정상출근" : (dto.work_status == 1 ? "지각" : (dto.work_status == 2 ? "결근" : (dto.work_status == 3 ? "조퇴" : "" )))}
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>
					
				</div>
			</div>
		</div>