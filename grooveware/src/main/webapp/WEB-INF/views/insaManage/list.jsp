<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
// 검색
function searchList() {
	const f = document.searchForm;
	f.submit();
}


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
	
function searchList() {
	const f = document.searchForm;
	f.submit();
}
	
</script>

<div class="left-side-bar">
    <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="${pageContext.request.contextPath}/myInsa/holidayArticle">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70 || sessionScope.member.dept_no == 1}">
            <!-- dept_no가 60~70 사이일 때만 아래 <li> 태그들이 보이도록 처리하기 -->
            <li>
                <a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/workList">&nbsp;근태관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidayList">&nbsp;휴가관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidaySetting">&nbsp;휴가설정</a>
            </li>
        </c:when>
        <c:otherwise>
            <!-- dept_no가 60~ 70 사이가 아닐 때는 두 번째 <li> 태그를 출력하지 않게 -->
        </c:otherwise>
   	 	</c:choose>
	</ul>
</div>
   <div class="right-contentbody">
   		<div class="board-insaManage-home">
   			<div class="title_container">
   				<table class="insa-list-tab">
   					<tr>
   						<td class="title"><h2><i class="fa-solid fa-users-gear"></i>&nbsp; 사원 관리</h2></td>
   					</tr>
   					<tr>
   						<td>
   							<div class="box-insa insa">
								<button class="insa-button insa-button-zz ${emp_status==3?'btnInsaActive':''}"
									onclick="location.href='${pageContext.request.contextPath}/insaManage/list?emp_status=3';">전 사원</button>
									
								<button class="insa-button insa-button-zz ${emp_status==0?'btnInsaActive':''}"
									onclick="location.href='${pageContext.request.contextPath}/insaManage/list?emp_status=0';">재직 사원</button> 
									
								<button class="insa-button insa-button-zz ${emp_status==1?'btnInsaActive':''}"
									onclick="location.href='${pageContext.request.contextPath}/insaManage/list?emp_status=1';">휴직 사원</button>
									
								<button class="insa-button insa-button-zz ${emp_status==2?'btnInsaActive':''}"
									onclick="location.href='${pageContext.request.contextPath}/insaManage/list?emp_status=2';">퇴직 사원</button>  							
   							</div>
   						</td>
   					</tr>
   				</table>
   				
   				<table class="table" style="margin-bottom: 20px">
   					<tr class="table">
   						<td align="left" width="50%" class="page-dataCount">
   							${dataCount}개(${page}/${total_page} 페이지)
   						</td>
   						<td align="right">
   							<form name="searchForm" action="${pageContext.request.contextPath}/insaManage/list" method="post">
								<select name="condition" class="emp-list-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} > 사원번호+이름 </option>
									<option value="emp_no"  ${condition == "emp_no" ? "selected='selected'" : ""} > 사원번호 </option>
									<option value="emp_name"  ${condition == "emp_name" ? "selected='selected'" : ""} > 이름 </option>
									<option value="dept_name"  ${condition == "dept_name" ? "selected='selected'" : ""} > 부서명 </option>
									<option value="pos_name"  ${condition == "pos_name" ? "selected='selected'" : ""} > 직위명 </option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="emp-list-search">
								<input type="hidden" name="emp_status" value="${emp_status}"> 
								<button type="button" class="work-search-btn" onclick="searchList()">검색</button>
							</form>
						</td>
						<td class="emp-add" align="right">
							<button class="btn-insaManage-add" id="openModalBtn" onclick="location.href='${pageContext.request.contextPath}/insaManage/write';"><i class="fa-solid fa-user-plus"></i>&nbsp;사원등록</button>
						</td>
   					</tr>
   				</table>
   				<table class="table table-list insa-home">
   					<thead>
   					<tr class="insa-home-tr">
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
   							<tr class="insa-home2-td">
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
							        <i class="fa-solid fa-plus"></i>
							      </h3>
							      <div class="dropdown-content">
							      	<a onclick="location.href='${pageContext.request.contextPath}/insaManage/updateEmpHistory?emp_no=${dto.emp_no}&page=${page}';">직위/부서 이동</a>
							      	<a onclick="profile('${dto.emp_no}');"><i class="bi bi-person-fill"></i>인사관리</a>
							        <a onclick="location.href='${pageContext.request.contextPath}/insaManage/insaCard?emp_no=${dto.emp_no}&page=${page}';"><i class="bi bi-person-vcard"></i> 인사기록카드</a>
							        
							        <c:if test="${dto.emp_status==0}">
							        	<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="1" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 휴직 </button>
							        	<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="2" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 퇴사 </button>
							        </c:if>
							        <c:if test="${dto.emp_status==1}">
							        	<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="0" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 재직 </button>
							        	<button style="margin: 5px" type="button" class="btn btnUpdateStatus" data-emp_status="2" data-emp_no="${dto.emp_no}"><i class="bi bi-person-x-fill"></i> 퇴사 </button>
							        </c:if>
							        <input type="hidden" name="emp_no" value="${dto.emp_no}">
							        <input type="hidden" name="emp_status" value="${dto.emp_status}">
							        <input type="hidden" name="page" value="${page}">
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
	