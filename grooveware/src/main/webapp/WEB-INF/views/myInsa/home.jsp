<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.profile-name {
	width : 10%;
	height : 50px;
	padding-top: 10px;
	text-align: center;
}
</style>

<div class="left-side-bar">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/home">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/home">&nbsp;인사정보</a> 
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
	<div>
		<div class="profile-content1 border-radius"
			style="width: 100%; height: 100%; display: flex;">
			<div style="width: 15%; height: 100%; border: 1px solid red; margin: 5px;" class="picture">
				<!-- 이미지 내용 -->
			</div>
			<div style="display: flex; flex-direction: column;">
				<div>${dto.emp_no}</div>
				<div>이름</div>
				<div>${dto.emp_name}</div>
				<div>
					${dto.emp_name}
				</div>
				<div>
					주소
				</div>
				<div>
					${dto.emp_address}
				</div>
				<div>
					전화번호
				</div>
				<div>
					${dto.emp_tel}
				</div>
				<div>
					생년월일
				</div>
				<div>
					909090
				</div>
				<div>
					부서
				</div>
				<div>
					${dto.dept_name}
				</div>
				<div>
					이메일
				</div>
				<div>
					${dto.emp_email}
				</div>
				<div>
					직급
				</div>
				<div>
					${dto.pos_name}
				</div>
				<div>
					입사일
				</div>
				<div>
					${dto.emp_join_date} 입사 
				</div>
				<div>
					사원상태
				</div>
				<div>
					${dto.emp_status==0?"재직":(dto.emp_status==1?"휴직":"퇴사")} 
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		
	});
</script>