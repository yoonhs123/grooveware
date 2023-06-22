<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
// 더보기 클릭 시
 $(document).ready(function() {
	    $(".dropdown-menu").on('click', function() {
	      var dropdownContent = $(this).siblings('.dropdown-content');
	      dropdownContent.fadeToggle(100);
	    });
	  });
</script>

<script type="text/javascript">
	//모달 열기
	function openModal() {
		document.getElementById("myModal").style.display = "block";
	}

	// 모달 닫기
	function closeModal() {
		document.getElementById("myModal").style.display = "none";
	}

	// 사용자가 모달 외부를 클릭할 때 모달 닫기
	window.onclick = function(event) {
		var modal = document.getElementById("myModal");
		if (event.target === modal) {
			modal.style.display = "none";
		}
	};
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
   		<div class="board-insaManage-home">
   			<div class="title_container">
   				<table class="table" style="margin-bottom: 20px">
   					<tr>
   						<td class="title"> <h2><i class="bi bi-person-fill"></i>인사관리</h2>
   						<td align="right">
   							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} > 이름 </option>
									<option value="m_id"  ${condition == "m_id" ? "selected='selected'" : ""} > 사원번호 </option>
									<option value="dept"  ${condition == "dept" ? "selected='selected'" : ""} > 부서 </option>
									<option value="position"  ${condition == "position" ? "selected='selected'" : 	""} > 직위 </option>
								</select>
								<input type="text" name="keyword" value="" class="insaManageHome">
								<button type="button" class="btn-insaManage-home" onclick="searchList();">검색</button>
							</form>
						</td>
						<td class="emp-add" align="right">
							<button class="btn-insaManage-add" id="openModalBtn" onclick="openModal()">사원등록</button>
						</td>
   					</tr>
   				</table>
   				<table class="table table-border table-list insa-home">
   					<thead>
   					<tr>
   						<th> 번호 </th>
   						<th width="10%"> 사원번호 </th>
   						<th width="5%"> 부서 </th>
   						<th width="5%"> 성명 </th>
   						<th width="5%"> 직위 </th>
   						<th width="5%"> 직책 </th>
   						<th width="15%"> 소속회사 </th>
   						<th width="10%"> 담당업무 </th>
   						<th width="14%"> 입사일 </th>
   						<th width="15%"> 퇴사일 </th>
   						<th width="12%"> 관리 </th>
   					</tr>
   					</thead>
   					
   					<tbody>
   						<tr>
   							<td> 1 </td>
   							<td> 00000001 </td>
   							<td> 인사 </td>
   							<td> 김부장 </td>
   							<td> 부장 </td>
   							<td> 팀장 </td>
   							<td> WHOIS WORKS </td>
   							<td> - </td>
   							<td> 2013.07.03 </td>
   							<td> - </td>
   							<td>
							  <div class="more">
							    <div class="more-menu">
							      <h3 class="dropdown-menu">
							        <i class="bi bi-three-dots-vertical"></i>
							        +
							      </h3>
							      <div class="dropdown-content">
							      	<a href="#"><i class="bi bi-person-fill"></i> 인사관리</a>
							        <a href="#"><i class="bi bi-person-vcard"></i> 인사기록카드</a>
							        <a href="#"><i class="bi bi-person-x-fill"></i> 퇴사</a>
							      </div>
							    </div>
							  </div>
							</td>
   						</tr>
   					</tbody>
   				
   				</table>
   				<div class="page-navigation">
   				1 2 3
   				</div>
   			</div>
   		</div>
   </div>
   
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
        <input type="text" id="address" required style="width: 300px;">
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
        <br><br>

        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate" required>
        <br><br>

        <input type="button" value="등록">
   		</form>
   	</div>
   </div>
   