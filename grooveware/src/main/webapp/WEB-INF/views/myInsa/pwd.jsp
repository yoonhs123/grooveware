<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;
	
	let str = f.emp_pwd.value.trim();
	if(!str) {
		alert("패스워드를 입력하세요.");
		f.emp_pwd.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/myInsa/pwd";
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
	<div class="pwd-check">
		<form name="pwdForm" method="post">
		<h3 class="pwd-check-h3">패스워드 재확인</h3>
		<div><p class="pwd-check-p">정보보호를 위해 패스워드를 다시 한 번 입력해주세요.</p></div>
		
		<div>
			<input type="text" name="emp_name" 
				placeholder="이름" value="${sessionScope.member.emp_name}" 
				readonly="readonly" class="pwd-check-name">
		</div>
		<div>
			<input type="password" name="emp_pwd" 
				placeholder="패스워드" class="pwd-check-pwd">
		</div>
		<div>
			<button type="button" onclick="sendOk();" class="check-pwd-btn">확인</button>
		</div>
		</form>
	</div>
	
	<div>
		<p>${message}</p>
	</div>
</div>