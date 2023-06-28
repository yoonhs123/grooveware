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
			<a href="#">나의 인사정보</a> 
			<a href="#">&nbsp;인사정보</a> 
			<a href="#">&nbsp;인사기록카드</a> 
			<a href="#">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a></li>
		<!-- <li class="insateam">  -->
		<li>
			<a href="#">인사관리</a> 
			<a href="#">&nbsp;사원관리</a>
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">&nbsp;조직도</a></li>
	</ul>
</div>

<div class="right-contentbody">
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
				<td class="main-text">연차 </td>
				<td>
					<span class="work-year">${dto.annual_leave} 년차</span>
					[ ${dto.emp_join_date} 입사 ] 
				</td>
			</tr>
		</tbody>
	</table>

	<div class="title-name">| 근태관리</div>
	<table class="geuntae-info-table">
		<tr class="my-insa">
			<th style="width: 16.6%;">연도</th>
			<th style="width: 16.6%;">정상출근</th>
			<th style="width: 16.6%;">연차휴가</th>
			<th style="width: 16.6%;">지각</th>
			<th style="width: 16.6%;">결근</th>
			<th style="width: 16.6%;">조퇴</th>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
		</tr>
	</table>

	<div class="title-name">| 내 부서 연혁</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<th>부서 재직 기간</th>
			<th>부서 이름</th>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
		</tr>
	</table>
	
	<div class="title-name">| 내 직위 연혁</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<th>직위 재직 기간</th>
			<th>직위 이름</th>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
		</tr>
	</table>

	<div class="title-name">| 상벌관리</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<td>발령일자</td>
			<td>소속회사</td>
			<td>발령분류</td>
			<td>변경사항</td>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
		</tr>
	</table>

	<div class="insateam">
	<div class="title-name">
		| 상벌관리(관리자)
		<button>추가</button>
	</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<td>상벌일자</td>
			<td>상벌구분</td>
			<td>상벌명</td>
			<td>상벌내용</td>
			<td>상벌권자</td>
			<td>수정/삭제</td>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td><button>수정</button>&nbsp;
				<button>삭제</button></td>
		</tr>
	</table>
	</div>
</div>