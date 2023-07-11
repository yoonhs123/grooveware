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
	<div class="div-container2">
	<div class="div-left2">
		<div class="div-top2">
		<table style="width: 100%; height: 100%;">
			<tr>
				<td>
					<div class="profile-picture border-radius">
						<div style="height: 100%">
							<div class="insa-image" style="width: 90%; height: 90%;">
							<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_save_filename}" style="width: 100%; height: 85%;">
							</div>
							<div style="width: 100%; margin-bottom: 10px;" align="center">${dto.emp_no}</div>
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
				<td style="width: 25%;"><h3> | 인적사항 </h3></td>
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
   