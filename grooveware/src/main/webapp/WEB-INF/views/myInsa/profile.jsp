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
	<h2 style="margin-bottom: 3%"><i class="fa-solid fa-user-tie"></i>&nbsp;'${dto.emp_name}'님의 인사 정보</h2>
	<div class="div-container">
	<div class="div-left">
		<div class="div-top">
		<table style="width: 100%; height: 100%;">
			<tr>
				<td>
					<div class="profile-picture border-radius">
						<div style="height: 100%">
							<div class="insa-image" align="center">
							<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_save_filename}" style="width: 100%; height: 85%;">
							</div>
							<div style="width: 100%; margin-bottom: 10px;" align="center">${dto.emp_no}</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		</div>
		
		<div class="div-bottom">
		<table style="width: 100%;" class="profile-picture border-radius">
				<tr>
					<th class="th-left">부서</th>
					<td>${dto.dept_name}</td>
				</tr>
				<tr>
					<th class="th-left">직급</th>
					<td>${dto.pos_name}</td>
				</tr>
				<tr>
					<th class="th-left">입사일</th>
					<td>${dto.emp_join_date}</td>
				</tr>
				<tr>
					<th class="th-left">사원상태</th>
					<td>${dto.emp_status==0?"재직":(dto.emp_status==1?"휴직":"퇴사")}</td>
				</tr>
		</table>
		</div>
	</div>
		
		

	<div class="profile-content1 div-right" style="flex-direction: row;">
		<table class="profile-content1-table">
			<tr>
				<td><h3> | 인적사항 </h3></td>
			</tr>
			<tr>
				<th class="th-left">이름</th>
				<td>${dto.emp_name}</td>
			</tr>
			<tr>
				<th class="th-left">사번</th>
				<td>${dto.emp_no}</td>
			</tr>
			<tr>
				<th class="th-left">생년월일</th>
				<td>${dto.emp_rrn}</td>
			</tr>
			<tr>
				<th class="th-left">이메일</th>
				<td>${dto.emp_email}</td>
			</tr>
			<tr>
				<th class="th-left">주소</th>
				<td>
					<span> [${dto.emp_zip}] </span> 
					<span> ${dto.emp_addr1} </span> 
					<span> ${dto.emp_addr2} </span>
				</td>
			</tr>
			<tr>
				<th class="th-left">전화번호</th>
				<td>${dto.emp_tel}</td>
			</tr>
			<tr>
				<td colspan="2" style="width: 100%;" align="right">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myInsa/pwd';" class="btn">수정하기</button>
				</td>
			</tr>
		</table>
	</div>
	</div>
</div>

