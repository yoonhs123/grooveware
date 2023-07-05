<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.dialog {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.dialog-content {
	background-color: #fefefe;
	margin: 15% 45%;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	border-radius: 4px
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.right-contentbody2 {
	width: 85%;
	position: absolute;
	left: 17%;
	padding: 0% 8%;
}

.myForm .flexBox {
	display: flex;
	justify-content: space-between;
}
.imgSize{
width: 100%;
height: 100%;
}
</style>


<script type="text/javascript">
function submitContents(doc_no, approval_status) {
	let approval_status_id = parseInt($("input[name=approval_status_id]").val()) + 1; // 결재 단계  
	let approval_total_step = $("input[name=approval_total_step]").val(); // 총 결재 단계 수
	let last = approval_status_id == approval_total_step; // 두 값이 같을경우 true
	
    let url = "${pageContext.request.contextPath}/approval/updateAp?doc_no=" + doc_no + "&approval_status=" + approval_status + "&last="+last;

    if (approval_status === 2) {
        if (confirm("결재하시겠습니까?")) {
            location.href = url;
        }
    } 
}

</script>


<script type="text/javascript">
function login() {
	location.href = "${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type : method,
		url : url,
		data : query,
		dataType : dataType,
		success : function(data) {
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				login();
				return false;
			} else if (jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}

			console.log(jqXHR.responseText);
		}
	});
}


$(function() {
	$(".btnApprovalDialog").click(function() {
		$("#update-approvalDialog").show();
	});
		
	
	
	$(".btnSubmit").click(function() {
		const f = document.approvalForm;
		f.action = "${pageContext.request.contextPath}/approval/updateAp";
		f.submit();
	})
	
	
	$(".btnClose").click(function() {
		$("#update-approvalDialog").hide();

});	

});

</script>

<div class="left-side-bar">

	<ul>
		<li><a href="${pageContext.request.contextPath}/approval/write">문서작성</a>
		</li>

		<li><a href="">문서함</a> <a
			href="${pageContext.request.contextPath}/approval/list?doc_status=1">&nbsp;내
				문서</a> <a href="#">&nbsp;부서 문서</a> <a
			href="${pageContext.request.contextPath}/approval/list?doc_status=0">&nbsp;임시보관
				문서</a> <a href="#">&nbsp;중요 문서</a>
		<li>
		<li><a href="">결재함</a> <a
			href="${pageContext.request.contextPath}/approval/standByList">&nbsp;대기문서</a>
			<a href="${pageContext.request.contextPath}/approval/progressList">&nbsp;진행중
				문서</a> <a
			href="${pageContext.request.contextPath}/approval/sendBackList">&nbsp;반려문서</a>
			<a href="${pageContext.request.contextPath}/approval/completionList">&nbsp;완료문서</a>
		<li>
	</ul>
</div>



<div class="right-contentbody">
	<div class="myForm">
		<div class="board1">
			<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title2" width="15%">
							<h2>
								<span>|</span> 기안서
							</h2>
						</td>
						<td class="title" style="padding-left: 30px;">
							<c:if
								test="${pre_state==2 && state.doc_status!=3 && state.doc_status!=4}">
								<button type="button" class="btn2"
									onclick="submitContents(${dto.doc_no}, 2);">결재</button>
								<button type="button" class="btn2 btnApprovalDialog">반려</button>
							</c:if></td>
					</tr>
				</table>
				<input type="hidden" name="approval_status"
					value="${dto.approval_status }">

			</div>
			<div class="line_container" style="height: 200px;">
				<div class="table" style="margin-bottom: 15px;">
					<div>
						<div class="title" style="float: left; width: 100%;">
							<span>결재라인</span>
						</div>

					</div>
					<div style="width: 100%; float: left; padding-left: 20px;">
						<c:forEach var="vo" items="${listApproval}" varStatus="status">
							<div class="img_container" style="${vo.approval_status==2 ? 'border: 3px solid #0232f2;' : ''}">
								<img class="imgSize"
									src="${pageContext.request.contextPath}/resources/images/bg.png"><i class="fa-solid fa-circle-check"></i>
							</div>

							<c:if test="${!status.last}">
								<div class="img_container3">
								<i class="fa-solid fa-chevron-right fa-xl" style="${vo.approval_status==2 ? 'color: #0232f2;' : ''}"></i>
								</div>
							</c:if>
							<c:if test="${vo.emp_no == sessionScope.member.emp_no}">

								<input type="hidden" name="approval_status_id"
									value="${vo.approval_status_id}">
								<input type="hidden" name="approval_total_step"
									value="${listApproval.size()}">
							</c:if>
						</c:forEach>
					</div>

					<div
						style="width: 100%; float: left; margin-left: 5px; text-align: center;">
						<c:forEach var="vo" items="${listApproval}">
							<div class="text_box3">${vo.emp_name }
								<span style="font-weight: normal;">&nbsp;${vo.pos_name }</span>
								<div>${vo.dept_name }</div>
							</div>
						</c:forEach>
						<div class="text_box4">&nbsp;</div>

					</div>

				</div>
			</div>
		</div>
		<div class="board3">
			<div class="line_container2">
				<div>

					<div>
						<div>
							<label>제목</label>
						</div>
						<p class="ap_pBox">
							<input type="text" name="doc_name" class="form-control1"
								style="width: 100%;" readonly="readonly"
								value="${dto.doc_name } ">
						</p>
					</div>

					<div class="flexBox">
						<div class="leftBox">
							<label>문서번호 </label>
						</div>
						<div class="leftBox">
							<label>승인상태</label>
						</div>
					</div>
					<div class="flexBox ap_pBox">
						<div class="leftBox">
							<input type="text" name="" class="form-control1"
								readonly="readonly" value="${dto.doc_no}" />
						</div>
						<div class="leftBox">
							<input type="text" name="state.doc_status" class="form-control1"
								readonly="readonly"
								value="${state.doc_status == 1 ? '대기' : (state.doc_status == 2 ? '결재진행' : (state.doc_status == 3 ? '결재완료' : '반려'))}" />
						</div>
					</div>

					<div>
						<div class="flexBox">
							<div class="leftBox">
								<label>기안구분 </label>
							</div>
							<div class="leftBox">
								<label>긴급여부 </label>
							</div>
						</div>
						<div class="flexBox ap_pBox">
							<div class="leftBox">
								<input type="text" name="draft_category" class="form-control1"
									readonly="readonly"
									value="${dto.draft_category == 0 ? '품의서' : '기안서'}" />
							</div>
							<div class="leftBox">
								<input type="text" name="urgent" class="form-control1"
									readonly="readonly" value="${dto.urgent == 0 ? '일반' : '긴급'}" />
							</div>
						</div>
					</div>

					<div class="flexBox">
						<div class="leftBox">
							<label>기안일자 </label>
						</div>
						<div class="leftBox">
							<label>처리기한 </label>
						</div>
					</div>
					<div class="flexBox ap_pBox">

						<div class="leftBox">
							<p>
								<input type="text" name="draft_date" class="form-control1"
									readonly="readonly" value="${dto.draft_date}" />
							</p>
						</div>
						<div class="leftBox">
							<input type="text" name="draft_deadline" class="form-control1"
								readonly="readonly" value="${dto.draft_deadline}" />
						</div>

					</div>

					<div class="flexBox">
						<div class="leftBox">
							<label>기안부서 </label>
						</div>
						<div class="leftBox">
							<label>기안담당 </label>
						</div>
					</div>
					<div class="flexBox ap_pBox">
						<div class="leftBox">
							<input type="text" name="" class="form-control1"
								readonly="readonly" value="${dto.dept_name}" />
						</div>
						<div class="leftBox">
							<input type="text" name="" class="form-control1"
								readonly="readonly" value="${dto.emp_name}" />
						</div>
					</div>

				</div>
				<div class="leftBox" style="width: 100%">
					<label>내용 </label>
				</div>
				<div
					style="padding: 15px; height: 400px; width: 100%; border: 1px solid gray; margin-top: 50px; border-radius: 4px;">${dto.draft_content}</div>
			</div>
		</div>
		<div class="board1">
			<div class="file_container">
				<div class="title3">
					<span> 첨부파일</span>
				</div>
				<div class="">
					<div class="table table-border table-form">
						<div
							style="padding: 15px; height: 150px; width: 100%; border: 1px solid gray; border-radius: 4px;">
							<c:forEach var="vo" items="${listFile}">
								<div>
									<a
										href="${pageContext.request.contextPath}/approval/download?file_no=${vo.file_no}">
										${vo.original_filename}</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${ current_state == 3}">
			<div class="board1">
				<div class="file_container">
					<div class="title3">
						<span> 코멘트</span>
					</div>
					<div class="">
						<div class="table table-border table-form">
							<c:forEach var="vo" items="${listApproval}">
								<c:if test="${not empty vo.reject_reason}">
									<input type="text" name="reject_reason"
										style="padding: 15px; height: 150px; width: 100%; border: 1px solid gray; border-radius: 4px;"
										readonly="readonly" value="${vo.reject_reason}">
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<div class="board4 confirm">
			<c:if
				test="${pre_state==2 && state.doc_status!=3 && state.doc_status!=4}">
				<button type="button" class="btn2"
					onclick="submitContents(${dto.doc_no}, 2);">결재</button>
				<button type="button" class="btn2 btnApprovalDialog">반려</button>
			</c:if>
		</div>
	</div>
</div>


<!-- 모달 -->
<div id="update-approvalDialog" style="display: none;" class="dialog">
	<div class="dialog-content">
		<form name="approvalForm" method="post">
			<div style="border-bottom: 1px solid #ced4da; padding-bottom: 10px;">
				<button type="button" class="btn btnClose" style="float: right;">
					<span class="close">&times;</span>
				</button>
				<h3 style="margin-bottom: 20px;">반려 사유</h3>
			</div>
			<table class="table table-border table-form">
				<tbody>
					<tr>
						<td height="50%">
							<div style="height: 150px;">
								<textarea name="reject_reason"
									style="height: 100%; width: 100%; border-radius: 4px; padding: 10px;"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td align="right"><input type="hidden" name="doc_no"
							value="${dto.doc_no }"> <input type="hidden"
							name="approval_status" value="3">
							<button type="button" class="btn btnSubmit">반려</button>
							<button type="button" class="btn btnClose">닫기</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

