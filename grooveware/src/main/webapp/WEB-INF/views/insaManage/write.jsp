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
    
    str = f.address.value.trim();
    if(!str) {
        alert("주소을 입력하세요. ");
        f.address.focus();
        return;
    }
    
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

    f.action = "${pageContext.request.contextPath}/insaManage/${mode}";
    f.submit();
</script>
		<div style="padding: 20px;">
		<h2>사원 정보 입력</h2>
   		<form name="empForm" method="get">
   		<br><br>
   		
   		<label for="name">이름:</label>
        <input type="text" id="name" required name="name">
        <br><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" required name="email">
        <br><br>
        
        <label for="ssn">주민번호:</label>
        <input type="text" id="ssn" required name="rrn">
        <br><br>

        <label for="phone">핸드폰번호:</label>
        <input type="text" id="phone" required name="tel">
        <br><br>

        <label for="address">주소:</label>
        <input type="text" id="address" required name="address">
        <br><br>
        
        
        <label for="startDate">입사일:</label>
        <input type="date" id="startDate" required name="startDate">
        <br><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" accept="image/*">
        <br><br>

        <label for="positionCode">직위코드:</label>
        <select id="positionCode" required name="positionCode">
        	<option value="">1 : 대표이사 </option>
        	<option value="">2 : 상무 </option>
        	<option value="">3 : 부장 </option>
        	<option value="">4 : 차장 </option>
        	<option value="">5 : 과장 </option>
        	<option value="">6 : 대리 </option>
        	<option value="">7 : 사원 </option>
        </select>
        <br><br>

        <label for="positionStartDate">직위시작날짜:</label>
        <input type="date" id="positionStartDate" required name="positionStartDate">
        <br><br>

        <label for="departmentCode">부서코드:</label>
       	<select id="departmentCode" required name="departmentCode">
        	<option value="">11 : 에너지사업1팀 </option>
        	<option value="">12 : 에너지사업2팀 </option>
        	<option value="">21 : 미디어사업1팀 </option>
        	<option value="">22 : 미디어사업2팀 </option>
        	<option value="">31 : AI1팀  </option>
        	<option value="">32 : AI2팀  </option>
        	<option value="">7 : 사원 </option>
        </select>
        <br><br>

        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate" required name="departmentStartDate">
        <br><br>

        <button type="button" onclick="sendOk();">등록하기</button>
        <button type="reset">다시입력</button>
   		</form>
   		</div>