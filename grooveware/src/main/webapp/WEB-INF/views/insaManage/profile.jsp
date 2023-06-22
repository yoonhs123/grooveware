<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   <div id="myModal" class="modal-profile">
   	<div class="modal-content-profile">
   		<span class="close-profile">&times;</span>
      	<h2>사원 정보 입력</h2>
   		<form name="userForm" method="get">
   		<br><br>
   		
   		<label for="name">이름:</label>
        <input type="text" id="name" required>
        <br><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" required>
        <br><br>
        
        <label for="ssn">주민번호:</label>
        <input type="text" id="ssn" required>
        <br><br>

        <label for="phone">핸드폰번호:</label>
        <input type="text" id="phone" required>
        <br><br>

        <label for="address">주소:</label>
        <input type="text" id="address" required>
        <br><br>
        
        
        <label for="startDate">입사일:</label>
        <input type="date" id="startDate" required>
        <br><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" accept="image/*">
        <br><br>

        <label for="positionCode">직위코드:</label>
        <select id="positionCode" required>
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
        <input type="date" id="positionStartDate" required>
        <br><br>

        <label for="departmentCode">부서코드:</label>
       	<select id="departmentCode" required>
        	<option value="">11 : 에너지사업1팀 </option>
        	<option value="">12 : 에너지사업2팀 </option>
        	<option value="">21 : 미디어사업1팀 </option>
        	<option value="">22 : 미디어사업2팀 </option>
        	<option value="">31 : AI1팀  </option>
        	<option value="">32 : AI2팀  </option>
        	<option value="">7 : 사원 </option>
        </select>
        <input type="text" id="departmentCode" required>
        <br><br>

        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate" required>
        <br><br>

        <input type="button" value="등록">
   		</form>
   	</div>
   </div>
   