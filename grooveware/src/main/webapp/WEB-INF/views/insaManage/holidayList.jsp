<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<div class="board-holidayManage">
		<div class="title_container">
			<div class="title-holidaylist">
				<h2>
					<i class="bi bi-person-fill"></i> | 연차휴가 현황
				</h2>
			</div>
			<select class="select-year">
					<option value="">2020년</option>
					<option value="">2021년</option>
					<option value="">2022년</option>
					<option value="">2023년</option>
			</select>
			<div class="search" align="right">
				<form name="searchForm" action="${pageContext.request.contextPath}/insaManage/list" method="post">
					<select name="condition" class="form-select">
						<option value="all"  ${condition == "all" ? "selected='selected'" : ""} > 전체 </option>
						<option value="emp_no"  ${condition == "emp_no" ? "selected='selected'" : ""} > 사원번호 </option>
						<option value="emp_name"  ${condition == "emp_name" ? "selected='selected'" : ""} > 사원이름 </option>
						<option value="dept_name"  ${condition == "dept_name" ? "selected='selected'" : 	""} > 부서 </option>
						<option value="pos_name"  ${condition == "pos_name" ? "selected='selected'" : 	""} > 직위 </option>
					</select>
					<input type="text" name="keyword" value="${keyword}" class="insaManageHome">
					<button type="button" class="btn-insaManage-home" onclick="searchList()">검색</button>
				</form>
			</div>

			<table class="table table-list holidayManage">
				<thead>
					<tr class="insa-home-tr">
						<th class="holidayManage-emp-no">사원번호</th>
						<th class="holidayManage-name">성명</th>
						<th class="holidayManage-pos">부서</th>
						<th class="holidayManage-pos">직위</th>
						<th class="holidayManage-startday">입사일 / 근속연수</th>
						<th class="holidayManage-use">부여된 연차</th>
						<th class="holidayManage-use">사용한 연차</th>
						<th class="holidayManage-no-use">남은 연차</th>
						<th class="holidayManage-add">대체 연차</th>
					</tr>
				</thead>

				<tbody>
					<!-- 누른 행의 사원번호와 일치하는 사원의 개인 근태 내역 -->
					<c:forEach var="dto" items="${list}" varStatus="status">
					<tr onclick="location-href='#'" class="insa-home-td">
						<td>${dto.emp_no}</td>
						<td>${dto.emp_name}</td>
						<td>${dto.dept_name}</td>
						<td> ${dto.pos_name} </td>
						<td>${dto.emp_join_date} / <span>${dto.annual_leave}년차</span>
						</td>
						<td>${dto.annual_count}개</td>
						<td>${dto.annual_use}개</td>
						<td>${dto.annual_count - dto.annual_use}개</td>
						<td>0일</td>
					</tr>
					</c:forEach>
				</tbody>

			</table>
			<div class="page-navigation">${dataCount == 0 ? "등록된 사원이 없습니다." : paging }</div>

		</div>
	</div>
</div>