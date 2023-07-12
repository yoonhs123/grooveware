<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function sendOk() {
	const f = document.empForm;
	f.action = "${pageContext.request.contextPath}/insaManage/updateEmpHistory";
	f.submit();
}
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
	<div>
	<div class="title_container">
		<h2 style="padding-left: 50px;"> | 사원 직위/부서 변경</h2>
	</div>
	<form name="empForm" method="post">
   	<br><br>
   	
   	<div class="profile-content3 border-radius change-posdept">
			<table class="profile-content3-table" style="margin-right: 10px;">
				<tr>
					<th><label for="positionCode">기존 직위</label></th>
					<td style="width: 200px; height : 30px;">${dto.pos_name}</td>
				</tr>
				<tr>
					<th><label for="positionStartDate">기존 직위 시작 일</label></th>
					<td style="width: 200px; height : 30px;">${dto.pos_startdate}</td>
				</tr>
				<tr>
					<th><label for="positionEndDate">기존 직위 해제 일</label></th>
					<td>
						<input type="date" id="positionEndDate" name="pos_enddate" value="${dto.pos_enddate}" style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="departmentCode">기존 부서</label></th>
					<td style="width: 200px; height : 30px;">${dto.dept_name}</td>
				</tr>
				<tr>
					<th><label for="departmentStartDate">기존 부서 발령 일</label></th>
					<td style="width: 200px; height : 30px;">${dto.dept_startdate}</td>
				</tr>
				<tr>
					<th><label for="departmentEndDate">기존 부서 근무종료 일</label></th>
					<td>
						<input type="date" id="departmentEndDate" name="dept_enddate" value="${dto.dept_enddate}" style="width: 200px; height : 30px;">
					</td>
				</tr>
			</table>
			
			<table class="profile-content3-table">
				<tr>
					<th><label for="positionCode">직위</label></th>
					<td>
						<select name="pos_no" style="width: 200px; height : 30px;">
			        		<c:forEach var="vo" items="${listPosCategory}">
			        			<option value="${vo.pos_no}" ${dto.pos_no == vo.pos_no ? "selected = 'selected' " : ""}>
			        				${vo.pos_name}
			        			</option>
			        		</c:forEach>
			        	</select>
					</td>
				</tr>
				<tr>
					<th><label for="positionStartDate">직위시작일</label></th>
					<td>
						<input type="date" id="positionStartDate" name="pos_startdate" value="${dto.pos_startdate}" style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="positionEndDate">직위해제일</label></th>
					<td>
						-
					</td>
				</tr>
				<tr>
					<th><label for="departmentCode">부서</label></th>
					<td>
						<select name="dept_no" style="width: 200px; height : 30px;">
			        		<c:forEach var="vo" items="${listDeptCategory}">
			        			<option value="${vo.dept_no}" ${dto.dept_no == vo.dept_no ? "selected = 'selected' " : ""}>
			        				${vo.dept_name}
			        			</option>
			        		</c:forEach>
			        	</select>
					</td>
				</tr>
				<tr>
					<th><label for="departmentStartDate">부서발령일</label></th>
					<td>
						<input type="date" id="departmentStartDate" name="dept_startdate" value="${dto.dept_startdate}" style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="departmentEndDate">부서 근무 종료일</label></th>
					<td>
						-
					</td>
				</tr>
				<tr>
					<th></th>
					<td align="right">
						<button type="button" onclick="sendOk();" class="btn">변경하기</button>
	        			<input type="hidden" name="emp_no" value="${dto.emp_no}">
	        			<input type="hidden" name="page" value="${page}">
	        			<button type="reset" class="btn">다시입력</button>
        			</td>
				</tr>
			</table>
		</div>
		</form>
	</div>
</div>