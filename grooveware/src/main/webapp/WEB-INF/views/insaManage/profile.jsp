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
   	<!-- 
   		<div style="display : flex;">
			<table style="width: 99%;">
				<tr>
					<td align="center">${dto.emp_no}</td>
				</tr>
				<tr>
					<td>
					<div class="profile-ficture border-radius" >
						<div style="width: 100px; height: 80px; border: 1px solid red;">
							<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_picture}"> 
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
						<td>${dto.emp_join_date} 입사</td>
						<td>사원상태</td>
						<td>
							${dto.emp_status==0?"재직":(dto.emp_status==1?"휴직":"퇴사")}
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<span> [${dto.emp_zip}] </span> 
							<span> ${dto.emp_addr1} </span> 
							<span> ${dto.emp_addr2} </span>
						</td>
						<td>전화번호</td>
						<td>${dto.emp_tel}</td>
					</tr>
					
				</table>
				

			</div>
		</div>
	-->
	<div class="div-container2">
	<div class="div-left2">
		<div class="div-top2">
		<table style="width: 100%; height: 100%;">
			<tr>
				<td>
					<div class="profile-picture border-radius">
						<div style="height: 100%">
							<div style="width: 100%; margin-bottom: 10px;" align="center">${dto.emp_no}</div>
							<div class="insa-image" style="width: 90%; height: 50%;">
							<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_picture}">
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		</div>

		
		<div class="div-bottom2">
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
		
		

	<div class="profile-content1 div-right2" style="flex-direction: row;">
		<table class="profile-content1-table">
			<tr>
				<td><h3> | 인적사항 </h3></td>
			</tr>
			<tr>
				<th class="th-left">이름</th>
				<td>${dto.emp_name}</td>
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
		</table>
	</div>
	</div>
		
   	</div>
   