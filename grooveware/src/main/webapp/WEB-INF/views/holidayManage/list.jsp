<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="left-side-bar">      
    <ul>
		<li>
			<a href="#">나의 인사정보</a> 
			<a href="#">&nbsp;인사정보</a> 
			<a href="#">&nbsp;인사기록카드</a> 
			<a href="#">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
		</li>
		<li class="insateam">
			<a href="#">인사관리</a> 
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">&nbsp;조직도</a>
		</li>
	</ul>
</div>

<div class="right-contentbody">

	<div class="board-holidayManage">
		<div class="title_container">
			<div class="title-holidaylist">
				<h2>
					<i class="bi bi-person-fill"></i>연차휴가 현황
				</h2>
			</div>
			<span> <select class="select-year">
					<option value="">2023년 1월</option>
					<option value="">2023년 2월</option>
					<option value="">2023년 3월</option>
					<option value="">2023년 4월</option>
					<option value="">2023년 5월</option>
					<option value="">2023년 6월</option>
					<option value="">2023년 7월</option>
					<option value="">2023년 8월</option>
					<option value="">2023년 10월</option>
					<option value="">2023년 11월</option>
					<option value="">2023년 12월</option>
			</select>
			</span>
			<div class="search" align="right">
				<form name="searchForm"
					action="${pageContext.request.contextPath}/ " method="post">
					<select name="condition" class="form-select">
						<option value="all"
							${condition == "all" ? "selected='selected'" : ""}>
							이름+부서</option>
						<option value="m_id"
							${condition == "m_id" ? "selected='selected'" : ""}>사원번호</option>
						<option value="dept_name"
							${condition == "dept_name" ? "selected='selected'" : ""}>부서명</option>
						<option value="m_name"
							${condition == "m_name" ? "selected='selected'" : ""}>이름</option>
						<option value="job_name"
							${condition == "job_name" ? "selected='selected'" :    ""}>직위</option>
					</select> <input type="text" name="keyword" value="${keyword}"
						class="insaManageHoliday">
					<button type="button" class="btn-holidayManage"
						onclick="searchList();">검색</button>
				</form>
			</div>

			<table class="table table-border table-list holidayManage">
				<thead>
					<tr>
						<th class="holidayManage-emp-no">사원번호</th>
						<th class="holidayManage-name">성명</th>
						<th class="holidayManage-pos">부서</th>
						<th class="holidayManage-startday">입사일 / 근속연수</th>
						<th class="holidayManage-standard">기준일</th>
						<th class="holidayManage-range">기간</th>
						<th class="holidayManage-use">연차 사용</th>
						<th class="holidayManage-no-use">연차 미사용</th>
						<th class="holidayManage-add">대체 연차</th>
					</tr>
				</thead>

				<tbody>
					<!-- 누른 행의 사원번호와 일치하는 사원의 개인 근태 내역 -->
					<tr onclick="location-href='#'">
						<td>00000001</td>
						<td>김부장</td>
						<td>인사팀</td>
						<td>2011-06-08 <span class="work-year">5년</span>
						</td>
						<td>2023-06-16</td>
						<td>2023-01-01 ~ 2023-12-12</td>
						<td>13일</td>
						<td>3일</td>
						<td>0일</td>
					</tr>
				</tbody>

			</table>
			<div class="page-navigation">1 2 3</div>

		</div>
	</div>
</div>