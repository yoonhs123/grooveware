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


<div class="left-side-bar">
    <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70}">
            <!-- dept_no가 60~70 사이일 때만 아래 <li> 태그들이 보이도록 처리하기 -->
            <li>
                <a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/workList">&nbsp;근태관리</a>
                <a href="#">&nbsp;휴가관리</a>
                <a href="#">&nbsp;휴가설정</a>
                <a href="#">&nbsp;조직도</a>
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
					<div class="title-worktime">
						<div class="worktime-header">
							<h1><i class="bi bi-person-fill"></i>근태현황</h1>
						</div>
						<div class="worktime-select">
							<select>
								<option value="">2021년</option>
								<option value="">2022년</option>
								<option value="">2023년</option>
							</select>
							<select>
								<option value="">1월</option>
								<option value="">2월</option>
								<option value="">3월</option>
								<option value="">4월</option>
								<option value="">5월</option>
								<option value="">6월</option>
								<option value="">7월</option>
								<option value="">8월</option>
								<option value="">9월</option>
								<option value="">10월</option>
								<option value="">11월</option>
								<option value="">12월</option>
							</select>
						</div>
					</div>
					<div class="total-worktime" style="">
						<table class="table table-border table-list total-worktime" style="padding:30px 0px 0px 30px;">
							<tr>
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
								<td>${dto.workLateEarly_Count}일</td>
								<td>0일</td>
							</tr>
						</table>

					</div>
					<div class="calendar-worktime">
						<table class="table table-border table-form">
							<thead>
								<tr>
									<th>날짜</th>
									<th>출근</th>
									<th>퇴근</th>
									<th>비고</th>
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
					<div class="page-navigation" style="width: 900px; margin: 0 auto;">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>
					
				</div>
			</div>
		</div>

