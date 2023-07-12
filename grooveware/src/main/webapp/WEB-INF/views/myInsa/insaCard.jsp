<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
/*
$(function() {
	$(".deptMoveBtn").click(function() {
		const p = $(this).parent().find("")
	});
});
*/

</script>

<div class="left-side-bar">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="${pageContext.request.contextPath}/myInsa/holidayArticle">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70 || sessionScope.member.dept_no == 1}">
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
	<h2 style="margin-bottom: 2%"><i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;'${dto.emp_name}'님 인사 기록 카드</h2>
	<table class="insa-info-table">
		<tbody>
			<tr>
				<td class="main-text" style="width: 10%">사원번호 </td>
				<td style="width: 40%">${dto.emp_no}</td>
				<td class="main-text" style="width: 10%">사원명 </td>
				<td style="width: 40%">${dto.emp_name}</td>
			</tr>
			<tr>
				<td class="main-text">부서 </td>
				<td>${dto.dept_name}</td>
				<td class="main-text">직위 </td>
				<td>${dto.pos_name}</td>
			</tr>
			<tr>
				<td class="main-text">입사일 </td>
				<td>
					 ${dto.emp_join_date}
					 [ <span>${dto.annual_leave} 년차</span> ]
				</td>
			</tr>
		</tbody>
	</table>

	<div class="title-name">| 근태관리</div>
	<table class="geuntae-info-table">
		<tr class="my-insa">
			<th style="width: 16.6%;">연도</th>
			<th style="width: 16.6%;">정상출근</th>
			<th style="width: 16.6%;">지각</th>
			<th style="width: 16.6%;">결근</th>
			<th style="width: 16.6%;">조퇴</th>
			<th style="width: 16.6%;">휴가</th>
		</tr>
		<tr>
			<td>${dto2.work_year}년</td>
			<td>${dto2.work_Count}일</td>
			<td>${dto2.workLate_Count}일</td>
			<td>${dto2.workAbsence_Count}일</td>
			<td>${dto2.workLateEarly_Count}일</td>
			<td>${dto2.workHoliday_Count}일</td>
		</tr>
	</table>

	<div class="workhistory-container">
	<div class="workhistory-left">
	<div class="title-name">| 내 부서 연혁</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<th style="width: 40%">부서 이름</th>
			<th>부서 재직 기간</th>
		</tr>
		<c:forEach var="dto" items="${deptHistoryList}" varStatus="status">
		<tr>
			<td>${dto.dept_name}</td>
			<td>${dto.dept_startdate} ~ ${dto.dept_enddate}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	
	<div class="workhistory-right">
	<div class="title-name">| 내 직위 연혁</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<th>직위 이름</th>
			<th>직위 재직 기간</th>
		</tr>
		<c:forEach var="dto" items="${posHistoryList}" varStatus="status">
		<tr>
			<td>${dto.pos_name}</td>
			<td>${dto.pos_startdate} ~ ${dto.pos_enddate}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	</div>

	<div class="title-name">| 상벌관리</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<td>상벌일자</td>
			<td>상벌구분</td>
			<td>상벌명</td>
			<td>상벌내용</td>
			<td>상벌권자</td>
		</tr>
		<tr>
			<td>2023/06/04</td>
			<td>벌점</td>
			<td>지각</td>
			<td>잦은 지각</td>
			<td>이재용(대표이사)</td>
		</tr>
	</table>

</div>