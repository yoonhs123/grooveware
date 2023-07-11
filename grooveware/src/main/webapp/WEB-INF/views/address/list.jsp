<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.n_button {
    height: 30px;
    border-radius: 5px;
    padding: 5px 10px;
    background-color: #CEDDEF;
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 600;
}

</style>

<script type="text/javascript">
	//검색
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
	
	$(function(){
		$(".btnSelectAll").click(function(){
			let select = $(this).attr("data-select");
			if(select === "0") {
				$("form input[name=emp_nos]").not(":disabled").prop("checked", true);
				$(this).attr("data-select", "1");
				$(this).text("선택해제");
			} else {
				$("form input[name=emp_nos]").not(":disabled").prop("checked", false);
				$(this).attr("data-select", "0");
				$(this).text("전체선택");
			}
		});
	});

	function moveToAddressBook() {
		let cnt = $("form input[name=emp_nos]:checked").not(":disabled").length;
		if(cnt === 0) {
			alert("이동할 사원을 먼저 선택하세요.");
			return;
		}
		
		const f = document.empListForm;
		f.action="${pageContext.request.contextPath}/address/friendAdd";
		f.submit();
	}
	
</script>


<div class="left-side-bar">

	<ul>
		<li>
		    <a href="${pageContext.request.contextPath}/address/list">주소록</a>
		    <a href="${pageContext.request.contextPath}/address/list">&nbsp;공용 주소록</a>
			<a href="${pageContext.request.contextPath}/address/friendList">&nbsp;개인 주소록</a>
		<li>
	</ul>
	
	<ul>
	    <li>
		  <a href="${pageContext.request.contextPath}/chat/chat">&nbsp;메신저</a>
	      <a href="${pageContext.request.contextPath}/chat/chat">&nbsp;사내 메신저</a>
	      <a href="${pageContext.request.contextPath}/chat/chat">&nbsp;개인 메신저</a>
	</ul>
	
</div>
<div class="right-contentbody">
	<div class="board">
		<div class="title_container">
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<td class="title">
						<h2>
						  <i class="fa-solid fa-address-book"></i>&nbsp;공용 주소록
						</h2>
					</td>
					<td align="right">
						<form name="searchForm"
							action="${pageContext.request.contextPath}/address/list" method="post">
							<div class="address-select">
								<select name="condition" class="form-select">
									<option value="all"
										${condition == "all" ? "selected='selected'" : ""}>전체검색</option>
					
									<option value="emp_no"
										${condition == "emp_no" ? "selected='selected'" : ""}>사원번호</option>
								     <option value="dept_name"
										${condition == "dept_name" ? "selected='selected'" : ""}>부서이름</option>
									<option value="emp_name"
										${condition == "emp_name" ? "selected='selected'" : ""}>이름</option>
								</select> <input type="text" name="keyword" value="${keyword}"
									class="addInput" placeholder="검색어를 입력하세요">
								<button type="button" class="n_button" onclick="searchList();">검색</button>
							</div>
						</form>
					</td>
				</tr>
			</table>
			<div class="address-button">
				
				<button type="button" class="n_button btnSelectAll" data-select="0">전체선택</button>
				<button type="button" class="n_button" onclick="moveToAddressBook();">내 주소록 이동</button>
			</div>
		</div>

		<form name="empListForm" method="post">
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
						    <td>
						    	<input type="checkbox" name="emp_nos" value="${dto.emp_no}" ${dto.friend_no != 0 ? "disabled='disabled' checked='checked' " :"" }>
						    </td>
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
		</form>

		<div class="page-navigation" style="width: 900px; margin: 0 auto;">
			${dataCount == 0 ? "등록된 주소가 없습니다." : paging }
		</div>
	</div>
</div>

