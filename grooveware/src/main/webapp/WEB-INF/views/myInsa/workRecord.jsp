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
			<a href="#">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
		</li>
		<!-- <li class="insateam">  -->
		<li>
			<a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a> 
			<a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">&nbsp;조직도</a>
		</li>
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
					<div class="employee-info">
						<div class="picture">사진</div>
						<div class="person-info">
							<div class="person-name" style="float: left;">김대리</div>
							<div class="team">개발</div>
							<div class="position">대리</div>
						</div>
					</div>
					<div class="total-worktime">
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
								<td>21회</td>
								<td>0회</td>
								<td>0일</td>
								<td>0일</td>
								<td>0일</td>
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
							<tbody>
								<tr>
									<td>01</td>
									<td>데이터</td>
									<td>데이터</td>
									<td>데이터</td>
								</tr>
								<tr>
									<td>02</td>
									<td>데이터</td>
									<td>데이터</td>
									<td>데이터</td>
								</tr>
								<tr>
									<td>03</td>
									<td>데이터</td>
									<td>데이터</td>
									<td>데이터</td>
								</tr>
								<tr>
									<td>04</td>
									<td>데이터</td>
									<td>데이터</td>
									<td>데이터</td>
								</tr>
								<tr>
									<td>05</td>
									<td>데이터</td>
									<td>데이터</td>
									<td>데이터</td>
								</tr>
							</tbody>
						</table>


					</div>
					<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
					
				</div>
			</div>
		</div>

