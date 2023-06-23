<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function sendOk() {
	     const f = document.empForm;
	 	 let str;
	 	str = f.emp_name.value.trim();
	     if(!str) {
	         alert("이름을 입력하세요. ");
	         f.name.focus();
	         return;
	     }

	     str = f.emp_email.value.trim();
	     if(!str) {
	         alert("이메일을 입력하세요. ");
	         f.email.focus();
	         return;
	     }
	     
	     str = f.emp_rrn.value.trim();
	     if(!str) {
	         alert("주민번호을 입력하세요. ");
	         f.rrn.focus();
	         return;
	     }
	     
	     str = f.emp_tel.value.trim();
	     if(!str) {
	         alert("전화번호을 입력하세요. ");
	         f.tel.focus();
	         return;
	     }
	     

	     str = f.emp_address.value.trim();
	     if(!str) {
	         alert("주소을 입력하세요. ");
	         f.address.focus();
	         return;
	     }

	     
	     str = f.emp_join_date.value.trim();
	     if(!str) {
	         alert("입사일을 입력하세요. ");
	         f.startDate.focus();
	         return;
	     }
	     
	     str = f.pos_no.value.trim();
	     if(!str) {
	         alert("직위코드을 입력하세요. ");
	         f.positionCode.focus();
	         return;
	     }
	     
	     str = f.pos_startdate.value.trim();
	     if(!str) {
	         alert("직위 시작일을 입력하세요. ");
	         f.positionStartDate.focus();
	         return;
	     }
	     
	     str = f.dept_no.value.trim();
	     if(!str) {
	         alert("부서코드을 입력하세요. ");
	         f.departmentCode.focus();
	         return;
	     }
	     
	     str = f.dept_startdate.value.trim();
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
        <input type="text" id="name"  name="emp_name" value="${dto.emp_name}">
        <br><br>

        <label for="email">이메일:</label>
        <input type="email" id="email"  name="emp_email" value="${dto.emp_email}">
        <br><br>
        
        <label for="rrn">주민번호:</label>
        <input type="text" id="rrn"  name="emp_rrn" value="${dto.emp_rrn}">
        <br><br>

        <label for="phone">핸드폰번호:</label>
        <input type="text" id="phone"  name="emp_tel" value="${dto.emp_tel}">
        <br><br>

        <label for="address">주소:</label>
        <input type="text" id="address"  name="emp_address" value="${dto.emp_address}" style="width: 300px;">
        <br><br>
        
        
        <label for="startDate">입사일:</label>
        <input type="date" id="startDate"  name="emp_join_date" value="${dto.emp_join_date}">
        <br><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" accept="image/*" value="${dto.emp_picture}">
        <br><br>

        <label for="positionCode">직위코드:</label>
        <select id="address"  name="pos_no">
        	<c:forEach var="vo" items="listPosCategory">
        		<option value="${dto.pos_no}">${vo.pos_name}</option>
        	</c:forEach>
        </select>
        <br><br>

        <label for="positionStartDate">직위시작날짜:</label>
        <input type="date" id="positionStartDate"  name="pos_startdate" value="${dto.pos_startdate}">
        <br><br>

        <label for="departmentCode">부서</label>
        <div>
        	<select name="top_dept_no">
        		<c:forEach var="vo" items="listDeptCategory">
        			<option value="dto.top_dept_no" ${top_dept_no==vo.top_dept_no?"selected='selected'":""}>
        				${vo.dept_name}
        			</option>
        		</c:forEach>
        	</select>
        	<select name="dept_no">
        		<c:forEach var="vo" items="${listDeptSubCategory}">
        			<option value="dto.dept_no" ${dto.dept_no==vo.dept_no?"selected='selected'":""}>
        				${vo.dept_name}
        			</option>
        		</c:forEach>
        	</select>
        </div>
        <input type= "text" id="departmentCode"  name="dept_no" value="${dto.dept_no}">
        <br><br>

        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate"  name="dept_startdate" value="${dto.dept_startdate}">
        <br><br>

        <button type="button" onclick="sendOk()">등록하기</button>
        <button type="reset">다시입력</button>
   		</form>   		
   		</div>
   	</div>