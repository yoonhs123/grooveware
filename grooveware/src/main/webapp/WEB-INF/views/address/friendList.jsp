<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
	//검색
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
	
	
	function selectAll() {
		
		 var checkboxes = document.getElementsByName("employeeCheckbox");
		  var allChecked = true;

		  for (var i = 0; i < checkboxes.length; i++) {
		    if (!checkboxes[i].checked) {
		      allChecked = false;
		      break;
		    }
		  }

		  for (var i = 0; i < checkboxes.length; i++) {
		    checkboxes[i].checked = !allChecked;
		  }
	}
	

	function displayFriendList(friendList) {
		var tableBody = document.getElementById("friendListTableBody");
		tableBody.innerHTML = ""; // 기존 테이블 내용 초기화

		for (var i = 0; i < friendList.length; i++) {
			var dto = friendList[i];
			var empNo = dto.emp_no;
			var empName = dto.emp_name;
			var empEmail = dto.emp_email;
			var deptName = dto.dept_name;
			var posName = dto.pos_name;
			var empTel = dto.emp_tel;
			var empJoinDate = dto.emp_join_date;
			var empStatus = dto.emp_status;

			var empStatusText = empStatus == '0' ? '재직' : (empStatus == '1' ? '휴직' : '퇴사');

			var row = document.createElement("tr");

			var checkboxCell = document.createElement("td");
			var checkbox = document.createElement("input");
			checkbox.type = "checkbox";
			checkbox.name = "employeeCheckbox";
			checkbox.value = empNo;
			checkboxCell.appendChild(checkbox);
			row.appendChild(checkboxCell);

			var empNoCell = document.createElement("td");
			empNoCell.textContent = empNo;
			row.appendChild(empNoCell);

			var empNameCell = document.createElement("td");
			empNameCell.textContent = empName;
			row.appendChild(empNameCell);

			var empEmailCell = document.createElement("td");
			empEmailCell.textContent = empEmail;
			row.appendChild(empEmailCell);

			var deptNameCell = document.createElement("td");
			deptNameCell.textContent = deptName;
			row.appendChild(deptNameCell);

			var posNameCell = document.createElement("td");
			posNameCell.textContent = posName;
			row.appendChild(posNameCell);

			var empTelCell = document.createElement("td");
			empTelCell.textContent = empTel;
			row.appendChild(empTelCell);

			var empJoinDateCell = document.createElement("td");
			empJoinDateCell.textContent = empJoinDate;
			row.appendChild(empJoinDateCell);

			var empStatusCell = document.createElement("td");
			empStatusCell.textContent = empStatusText;
			row.appendChild(empStatusCell);

			tableBody.appendChild(row);
		}
	}

	function moveToAddressBook() {
		var selectedEmployees = getSelectedEmployees();

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "${pageContext.request.contextPath}/address/friendList", true);
		xhr.setRequestHeader("Content-Type", "application/json");

		xhr.onreadystatechange = function() {
			if (xhr.readyState === XMLHttpRequest.DONE) {
				if (xhr.status === 200) {
					var response = JSON.parse(xhr.responseText);
					displayFriendList(response); // friendList를 표시할 함수 호출
				} else {
					console.error("Error:", xhr.statusText);
				}
			}
		};

		xhr.send(JSON.stringify({ selectedEmployees: selectedEmployees }));
	}
	
	
	
	
	
</script>


<div class="left-side-bar">

	<ul>


		<li><a href="${pageContext.request.contextPath}/address/list">주소록</a>
			<hr> <a href="${pageContext.request.contextPath}/address/list">&nbsp;공용 주소록</a>
			 <a href="${pageContext.request.contextPath}/address/friendList">&nbsp;개인 주소록</a>
			  <a href="${pageContext.request.contextPath}/chat/chat">&nbsp;메신저</a>
		<li>
	</ul>
</div>
<div class="right-contentbody">
	<div class="board">
		<div class="title_container">
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<td class="title">
						<h3>
							<span>|</span> 개인 주소록
						</h3>
					</td>
					<td align="right">
						<form name="searchForm"
							action="${pageContext.request.contextPath}/" method="post">
							<div class="address-select">
								<select name="condition" class="form-select">
									<option value="subject"
										${condition == "subject" ? "selected='selected'" : ""}>제목</option>
									<option value="content"
										${condition == "content" ? "selected='selected'" : ""}>내용</option>
									<option value="all"
										${condition == "all" ? "selected='selected'" : ""}>제목+내용</option>
									<option value="name"
										${condition == "name" ? "selected='selected'" : ""}>이름</option>
								</select> <input type="text" name="keyword" value="${keyword}"
									class="addInput" placeholder="검색어를 입력하세요">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</div>
						</form>
					</td>
				</tr>
			</table>
			<div class="address-button">
				
				<button type="button" class="btn" onclick="selectAll();">전체</button>
				
				<button type="button" class="btn" onclick="remove();">삭제</button>

			</div>
		</div>

		<table class="table table-border table-list">

			<thead>
				<tr>
			
			        <th width="10%">선택</th>
					<th width="10%">사원번호</th>
					<th width="10%">성명</th>
					<th width="10%">이메일</th>
					<th width="15%">부서</th>
					<th width="10%">직위</th>
					<th width="15%">전화번호</th>
					<th width="15%">입사일</th>
					<th width="10%">상태</th>
				</tr>
			</thead>
		   <tbody id="friendListTableBody">
				
			</tbody>
		</table>

		<div class="page-navigation" style="width: 900px; margin: 0 auto;">
		${dataCount == 0 ? "등록된 주소가 없습니다." : paging }

		</div>
	</div>
</div>

