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
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}


function profile(emp_no) {
	let dlg = $("#profile-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 700,
		  width: 900,
		  title: "사원상세정보",
		  close: function(event, ui) {
		  }
	});
	
	let url = "${pageContext.request.contextPath}/insaManage/profile";
	let query = "emp_no="+emp_no;
	
	const fn = function(data){
		$('#profile-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}
	/*
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
	*/

$(function() {
	$(".btnUpdateStatus").click(function(){
		var emp_no = $(this).attr("data-emp_no");
		var emp_status = $(this).attr("data-emp_status");
		
		if(confirm("선택한 계정 상태를 변경하시겠습니까 ?")){
			
		}
		
		location.href = '${pageContext.request.contextPath}/insaManage/updateEmpStatus?emp_no=' +emp_no+ '&emp_status=' +emp_status;
		
	});
});
	
</script>

<div class="left-side-bar">
    <ul>
		<li>
			<a href="#">나의 인사정보</a> 
			<a href="#">&nbsp;인사정보</a> 
			<a href="#">&nbsp;인사기록카드</a> 
			<a href="#">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
		</li>
		<!-- <li class="insateam">  -->
		<li>
			<a href="#">인사관리</a> 
			<a href="#">&nbsp;사원관리</a>
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">&nbsp;조직도</a>
		</li>
	</ul>
    </div>
   <div class="right-contentbody">
   		<div class="board-insaManage-home">
   			<div class="title_container">
   				<table class="table" style="margin-bottom: 20px">
   					<tr>
   						<td class="title"> <h2><i class="bi bi-person-fill"></i>사원 관리</h2>
   					</tr>
   					<tr class="table">
   						<td align="left" width="50%">
   							${dataCount}개(${page}/${total_page} 페이지)
   						</td>
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
							<button class="btn-insaManage-add" id="openModalBtn" onclick="location.href='${pageContext.request.contextPath}/insaManage/write';">사원등록</button>
						</td>
   					</tr>
   				</table>
   				<table class="table table-border table-list insa-home">
   					<thead>
   					<tr>
   						<th width="5%"> 번호 </th>
   						<th width="10%"> 사원번호 </th>
   						<th width="10%"> 성명 </th>
   						<th width="15%"> 부서 </th>
   						<th width="10%"> 직위 </th>
   						<th width="15%"> 입사일 </th>
   						<th width="15%"> 퇴사(휴직)일 </th>
   						<th width="5%">상태</th>
   						<th width="15%"> 관리 </th>
   					</tr>
   					</thead>
   					
   					<tbody>
   						<c:forEach var="dto" items="${list}" varStatus="status">
   							<tr>
   							<td> ${dataCount - (page-1) * size - status.index} </td>
   							<td> ${dto.emp_no} </td>
   							<td> ${dto.emp_name} </td>
   							<td> ${dto.dept_name} </td>
   							<td> ${dto.pos_name} </td>
   							<td> ${dto.emp_join_date} </td>
   							<td> ${dto.emp_resign_date} </td>
   							<td>
   								${dto.emp_status==0 ? "재직" : (dto.emp_status==1 ? "휴직" : "퇴사")}
   							</td>
   							<td>
							  <div class="more">
							    <div class="more-menu">
							      <h3 class="dropdown-menu">
							        <i class="bi bi-three-dots-vertical"></i>
							        +
							      </h3>
							      <div class="dropdown-content">
							      	<a onclick="location.href='${pageContext.request.contextPath}/insaManage/write?emp_no=${dto.emp_no}&page=${page}&size=${size}';">수정</a>
							      	<a onclick="profile('${dto.emp_no}');"><i class="bi bi-person-fill"></i>인사관리</a>
							        <a onclick="location.href='${pageContext.request.contextPath}/insaManage/insaCard?emp_no=${dto.emp_no}&page=${page}&size=${size}';"><i class="bi bi-person-vcard"></i> 인사기록카드</a>
							        
							        <c:if test="${dto.emp_status==0}">
							        	<form class="statusForm" action="updateEmpStatus" method="post">
							        		<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="1" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 휴직 </button>
							        		<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="2" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 퇴사 </button>
							        	</form>
							        	
							        </c:if>
							        <c:if test="${dto.emp_status==1}">
							        	<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="0" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 재직 </button>
							        	<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="2" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 퇴사 </button>
							        </c:if>
							        
							      </div>
							    </div>
							  </div>
							</td>
   						</tr>
   						</c:forEach>
   					</tbody>
   				
   				</table>
   				<div class="page-navigation">
   					${dataCount == 0 ? "등록된 사원이 없습니다." : paging }
   				</div>
   			</div>
   		</div>
   </div>
   
	<!-- 인사카드나 인사관리는 모달로 띄우기 -->
	<div id="profile-dialog" class="modal-profile" style="display: none;"></div>
	