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
			<a href="#">&nbsp;내 휴가 기록</a></li>
		<li class="insateam">
			<a href="#">인사관리</a> 
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">;&nbsp;조직도</a></li>
	</ul>
</div>

<div class="right-contentbody">

	<div class="board-emp-list">
		<div class="title_container-emp-list">
			<h2>
				<i class="bi bi-person-fill"></i>근태관리
			</h2>
			<table class="table emp-list-1">
				<tr>
					<td class="title-emp-list"><span> 시작일&nbsp;:&nbsp; <select
							onChange="changeConditionPeriod(this);">
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
						</select> &nbsp;년&nbsp;&nbsp; <select
							onChange="changeConditionPeriod(this);">
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select> &nbsp;월&nbsp;&nbsp;
					</span> &nbsp;&nbsp;~&nbsp;&nbsp; <span> 종료일&nbsp;:&nbsp; <select
							onChange="changeConditionPeriod(this);">
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
						</select> &nbsp;년&nbsp;&nbsp; <select
							onChange="changeConditionPeriod(this);">
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select> &nbsp;월&nbsp;&nbsp;
					</span>
					<td align="right">
						<form name="searchForm"
							action="${pageContext.request.contextPath}/ " method="post">
							<select name="condition" class="emp-list-select">
								<option value="all" ${condition == "all" ? "selected='selected'" : ""}>이름+부서</option>
								<option value="m_id" ${condition == "m_id" ? "selected='selected'" : ""}>사원번호</option>
								<option value="dept_name" ${condition == "dept_name" ? "selected='selected'" : ""}>부서명</option>
								<option value="m_name" ${condition == "m_name" ? "selected='selected'" : ""}>이름</option>
								<option value="job_name" ${condition == "job_name" ? "selected='selected'" : 	""}>직위</option>
							</select> <input type="text" name="keyword" value="${keyword}" class="emp-list-search">
							<button type="button" class="btn-emp-list" onclick="searchList();">검색</button>
						</form>
					</td>
				</tr>
			</table>
			<table class="table table-border table-list emp-list">
				<thead>
					<tr>
						<th class="emp-list-empNo">사원번호</th>
						<th class="emp-list-name">성명</th>
						<th class="emp-list-team">부서</th>
						<th class="emp-list-posi">직위</th>
						<th class="emp-list-work">정상출근</th>
						<th class="emp-list-diswork">결근</th>
						<th class="emp-list-late">지각</th>
						<th class="emp-list-leave">조퇴</th>
						<th class="emp-list-holiday">휴가</th>
					</tr>
				</thead>

				<tbody>
					<!-- 누른 행의 사원번호와 일치하는 사원의 개인 근태 내역 -->
					<tr onclick="location-href='#'">
						<td>00000001</td>
						<td>김부장</td>
						<td>개발팀</td>
						<td>부장</td>
						<td>156</td>
						<td>2</td>
						<td>-</td>
						<td>3</td>
						<td>3</td>
					</tr>
				</tbody>

			</table>
			<div class="page-navigation">1 2 3</div>

		</div>
	</div>
</div>