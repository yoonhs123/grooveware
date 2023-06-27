<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.profile-name {
	width : 10%;
	height : 50px;
	padding-top: 10px;
	text-align: center;
}
</style>
   
   	<div class="modal-content-profile">
   		<span class="close-profile">&times;</span>
   		
   		<div style="display : flex;">
			<table style="width: 99%;">
				<tr>
					<td align="center">${dto.emp_no}</td>
				</tr>
				<tr>
					<td>
					<div class="profile-ficture border-radius" >
						<div style="width: 100px; height: 130px; border: 1px solid red;">
						
						</div> 
					</div>
					</td>
				</tr>
			</table>
			
			<div class="profile-content1 border-radius">
				<table class="profile-content1-table">
					<tr>
						<td>이름</td>
						<td>${dto.emp_name}</td>
						<td>부서</td>
						<td>${dto.dept_name}</td>
						
					</tr>
					
					<tr>
						<td>이메일</td>
						<td>${dto.emp_email}</td>
						<td>직급</td>
						<td>${dto.pos_name}</td>
					</tr>
					<tr>
						<td>입사일</td>
						<td>${dto.emp_join_date}</td>
						<td>사원상태</td>
						<td>
							${dto.emp_status==0?"재직":(dto.emp_status==1?"휴직":"퇴사")}
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>${dto.emp_address}</td>
						<td>전화번호</td>
						<td>${dto.emp_tel}</td>
					</tr>
					
				</table>
				
				<form id="detailEmpStatusForm" name="detailEmpStatusForm">
				<table class="profile-content1-table">
					<tr>
						<td>사원 상태</td>
						<td>
							<select class="form-select" name="emp_status" id="emp_status" onchange="selectEmpStatusChange()">
								<option value="">사원 상태</option>
								<c:if test="${dto.emp_status!=0}">
									<option value="${dto.emp_status==0}">휴면해제</option>
								</c:if>
								<c:if test="${dto.emp_status==0}"></c:if>
								<option value="${dto.emp_status==1}">휴직</option>
								<option value="${dto.emp_status==2}">퇴사</option>
							</select>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
		
		<!-- 
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
   	 -->
   	</div>
   