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
	
</script>


<div class="left-side-bar">

	<ul>


		<li><a href="${pageContext.request.contextPath}/address/list">주소록</a>
			<hr> <a href="${pageContext.request.contextPath}/address/list">&nbsp;공용 주소록</a>
			 <a href="">&nbsp;친구 목록</a>
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
							<span>|</span> 공용 주소록
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
				<button type="button" class="btn" onclick="email();">내 주소록 이동</button>
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
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
					    <td><input type="checkbox" name="employeeCheckbox" value="${dto.emp_no}"></td>
						<td>${dto.emp_no}</td>
						<td>${dto.emp_name}</td>
						<td>${dto.emp_email}</td>
						<td>${dto.dept_name}</td>
						<td>${dto.pos_name}</td>
						<td>${dto.emp_tel}</td>
						<td>${dto.emp_join_date}</td>
						<td>${dto.emp_status==0 ? "재직" : (dto.emp_status==1 ? "휴직" : "퇴사")}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="page-navigation" style="width: 900px; margin: 0 auto;">
		${dataCount == 0 ? "등록된 주소가 없습니다." : paging }

		</div>
	</div>
</div>

