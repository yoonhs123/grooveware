<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function sendOk() {
	     const f = document.empForm;
	 	let str;
	 	
	     str = f.name.value.trim();
	     if(!str) {
	         alert("이름을 입력하세요. ");
	         f.name.focus();
	         return;
	     }

	     str = f.email.value.trim();
	     if(!str) {
	         alert("이메일을 입력하세요. ");
	         f.email.focus();
	         return;
	     }
	     
	     str = f.rrn.value.trim();
	     if(!str) {
	         alert("주민번호을 입력하세요. ");
	         f.rrn.focus();
	         return;
	     }
	     
	     str = f.tel.value.trim();
	     if(!str) {
	         alert("전화번호을 입력하세요. ");
	         f.tel.focus();
	         return;
	     }
	     
	     /*
	     str = f.address.value.trim();
	     if(!str) {
	         alert("주소을 입력하세요. ");
	         f.address.focus();
	         return;
	     }
	     */
	     
	     str = f.startDate.value.trim();
	     if(!str) {
	         alert("입사일을 입력하세요. ");
	         f.startDate.focus();
	         return;
	     }
	     
	     str = f.positionCode.value.trim();
	     if(!str) {
	         alert("직위코드을 입력하세요. ");
	         f.positionCode.focus();
	         return;
	     }
	     
	     str = f.positionStartDate.value.trim();
	     if(!str) {
	         alert("직위 시작일을 입력하세요. ");
	         f.positionStartDate.focus();
	         return;
	     }
	     
	     str = f.departmentCode.value.trim();
	     if(!str) {
	         alert("부서코드을 입력하세요. ");
	         f.departmentCode.focus();
	         return;
	     }
	     
	     str = f.departmentStartDate.value.trim();
	     if(!str) {
	         alert("부서발령일을 입력하세요. ");
	         f.departmentStartDate.focus();
	         return;
	     }

	     f.action = "${pageContext.request.contextPath}/insaManage/write";
	     f.submit();
	}
</script>

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
			<a href="#">&nbsp;조직도</a></li>
	</ul>
</div>
   <div class="right-contentbody">
		<div>
		<h2>사원 정보 입력</h2>
		
   		<form name="empForm" method="post">
   		<br><br>
   		
   		<label for="name">이름:</label>
        <input type="text" id="name" required name="name" value="${dto.emp_name}">
        <br><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" required name="email" value="${dto.emp_email}">
        <br><br>
        
        <label for="ssn">주민번호:</label>
        <input type="text" id="ssn" required name="rrn" value="${dto.emp_rrn}">
        <br><br>

        <label for="phone">핸드폰번호:</label>
        <input type="text" id="phone" required name="tel" value="${dto.emp_tel}">
        <br><br>

        <label for="address">주소:</label>
        <input type="text" id="address" required name="address" value="${dto.emp_address}">
        <br><br>
        
        
        <label for="startDate">입사일:</label>
        <input type="date" id="startDate" required name="startDate" value="${dto.emp_join_date}">
        <br><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" accept="image/*" value="${dto.emp_picture}">
        <br><br>

        <label for="positionCode">직위코드:</label>
        <input type="text" id="address" required name="positionCode" value="${dto.pos_no}">
        <br><br>

        <label for="positionStartDate">직위시작날짜:</label>
        <input type="date" id="positionStartDate" required name="positionStartDate" value="${dto.pos_startdate}">
        <br><br>

        <label for="departmentCode">부서코드:</label>
        <input type= "text" id="departmentCode" required name="departmentCode" value="${dto.dept_no}">
        <br><br>

        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate" required name="departmentStartDate" value="${dto.dept_startdate}">
        <br><br>

        <button type="button" onclick="sendOk()">등록하기</button>
        <button type="reset">다시입력</button>
   		</form>
   		</div>
   	</div>