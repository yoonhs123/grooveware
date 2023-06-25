<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   
   	<div class="modal-content-profile">
   		<span class="close-profile">&times;</span>
   		
   		<div style="display : flex; height: 200px; justify-content: space-between;">
		
			<div class="profile-ficture border-radius" >
				<div style="border: 1px solid black; width : 100px; height : 100px;"><img>
			</div> 
				<div style="width : 200px; height : 50px; padding-top: 10px; text-align : center; ">이메일</div> 
			</div>
			
			<div class="profile-content1 border-radius">
			
				<table class="profile-content1-table">
					<tr>
						<td>사번</td>
						<td><input></td>
						<td>부서</td>
						<td><input></td>
						
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input></td>
						<td>직급</td>
						<td><input></td>
					</tr>
					<tr>
						<td>입사일</td>
						<td><input></td>
					</tr>
					
				</table>
			</div>
		</div>
		<div class="profile-content2 border-radius">
			<div style="margin-bottom:15px;">자택주소</div>
			<div><input id="addressCode" disabled="disabled" style="width: 200px; height : 30px; margin-bottom:5px;"><button class="asdf" type="button" onclick="daumPostcode();">우편번호</button></div>
			
			<input id="address">
			<input id="addressDetail">
			<div style="margin-bottom:15px; margin-top : 15px;">전화번호</div>
			<select>
				<option>02</option>
				<option>010</option>
				<option>011</option>
			</select>
			<input><input style="margin-left:6px;">
			<div style="margin-bottom:15px; margin-top : 15px;"></div>
		</div>
		
		<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-tab-1"></div>
				<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2"></div>
				<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-2"></div>
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
   