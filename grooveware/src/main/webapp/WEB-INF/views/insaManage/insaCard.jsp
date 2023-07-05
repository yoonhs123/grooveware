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

$(function(){
    $(".licenseAddBtn").click(function(){
        $(".licenseRemoveBtn").show();
        const p = $(this).parent().parent().find("div:first-child  :first").clone().wrapAll("<div>").parent().html();
        $(p).find("input").each(function(){
        	$(this).val("");
        });

        $(this).parent().parent().find("div:first").append(p);
    });
    
    $("body").on("click", ".licenseRemoveBtn", function(){
        if($(this).closest("div").find("p").length<=1) {
            return;
        }
        
        $(this).parent().remove();
        
        if($(".licenseRemoveBtn").closest("div").find("p").length<=1) {
            $(".licenseRemoveBtn").hide();
        }
    });
});

</script>

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
				<td class="main-text"> 입사일 </td>
				<td>
					[ ${dto.emp_join_date} ] 
					<span class="work-year">${dto.annual_leave} 년차</span>
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
			<th style="width: 16.6%;">연차휴가</th>
		</tr>
		<tr>
			<td>${dto2.work_year}년</td>
			<td>${dto2.work_Count}일</td>
			<td>${dto2.workLate_Count}일</td>
			<td>${dto2.workAbsence_Count}일</td>
			<td>${dto2.workLateEarly_Count}일</td>
			<td>?</td>
		</tr>
	</table>
	
	<div class="workhistory-container">
	<div class="workhistory-left">
	<div class="title-name">| 내 부서 연혁</div>
	<table class="dpMove-info-table">
		<tr class="my-insa">
			<th>부서 이름</th>
			<th>부서 발령 기간</th>
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
			<th>직위 기간</th>
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
			<th>발령일자</th>
			<th>소속회사</th>
			<th>발령분류</th>
			<th>변경사항</th>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
		</tr>
	</table>
</div>