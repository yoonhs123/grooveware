<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.modal {
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

.modal-content {
	background-color: #fefefe;
	margin: 15% 50%;
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

.winnerList-container {
	display: grid;
	grid-gap: 5px;
	grid-template-columns: repeat(4, auto);
}

.winnerList-container .item {
	border: 1px solid #333;
	border-radius: 3px;
	padding: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
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
</style>
<script type="text/javascript">
	function check() {
		const f = document.myForm;
		let str;

		f.action = "${pageContext.request.contextPath}/approval/${mode}";
		f.submit();
	}
</script>
<div class="left-side-bar">

	<ul>
		<li>
			<div class="box-wrapper">
				<div class="borderBox">
					<a>문서작성</a>
				</div>
				<div class="borderBox">
					<a>내문서</a>
				</div>
			</div>
		</li>

		<li><a href="#">문서함</a> <a href="#">&nbsp;내 문서</a> <a href="#">&nbsp;부서
				문서</a> <a href="#">&nbsp;임시보관 문서</a> <a href="#">&nbsp;중요 문서</a>
		<li>

			<hr>
		<li><a href="#">결재함</a> <a href="#">&nbsp;대기</a> <a href="#">&nbsp;진행중</a>
			<a href="#">&nbsp;보류</a> <a href="#">&nbsp;반려</a> <a href="#">&nbsp;완료</a>
		<li>
	</ul>
</div>

<div class="left-menu">

	<ul>
		<li><a href="#">즐겨찾기</a> <a
			href="${pageContext.request.contextPath}/pro/approval/write.jsp"><i
				class="fa-regular fa-file-lines icon"></i>기안서</a> <a
			href="${pageContext.request.contextPath}/pro/approval/write.jsp"><i
				class="fa-regular fa-file-lines icon"></i>연차휴가</a>
		<li>

			<hr>
		<li><a href="#">일반 결재 문서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>계약확인서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>공문서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>기안서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>사유서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>시말서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>업무보고서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>업무협조전</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>위임장</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>인장요청서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>증명보고서</a> <a href="#"><i
				class="fa-regular fa-file-lines icon"></i>인사발령</a>
		<li>
	</ul>
</div>


<div class="right-contentbody">
	<div class="right-contentbody2">
		<form name="myForm" method="post" class="myForm"
			enctype="multipart/form-data">
			<div class="board1">
				<div class="title_container">
					<table class="table" style="margin-bottom: 20px;">
						<tr>
							<td class="title2" width="12%">
								<h2>
									<span>|</span> 기안서
								</h2>
							</td>
							<td class="title">
								<button type="button" class="btn" onclick=" ">목록</button>
								<button type="button" class="btn" onclick=" ">결재</button>
								<button type="button" class="btn" onclick=" ">보류</button>
								<button type="button" class="btn" onclick=" ">반려</button>
								<button type="button" class="btn" onclick=" ">코멘트</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="line_container">
					<div class="table" style="margin-bottom: 15px;">
						<div>
							<div class="title" style="float: left; width: 100%;">
								<span>결재라인</span>
							</div>

						</div>
						<div style="width: 100%; float: left;">
							<div class="img_container ">
								<img class="" src="/test.jpg">
							</div>
							<div class="img_container3 ">
								<i class="fa-solid fa-chevron-right"></i>
							</div>
							<div class="img_container ">
								<img class="" src="test.jpg">
							</div>
							<div class="img_container3 ">
								<i class="fa-solid fa-chevron-right"></i>
							</div>
							<div class=" img_container">
								<img class="" src="test.jpg">
							</div>
						</div>


						<div style="width: 100%; float: left;">
							<div class="text_box3">김민교</div>
							<div class="text_box4">&nbsp;</div>
							<div class="text_box3">남기현</div>
							<div class="text_box4">&nbsp;</div>
							<div class="text_box3">최고관리자</div>

							<!-- 플러스 버튼 후 결제라인 설정 팝업 -->
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
									style="width: 100%;" value="${dto.doc_name } ">
							</p>
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
										readonly="readonly" value="${dto.urgent == 0 ? '긴급' : '일반'}" />
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
									readonly="readonly" value="${sessionScope.member.dept_name}" />
							</div>
							<div class="leftBox">
								<input type="text" name="" class="form-control1"
									readonly="readonly" value="${sessionScope.member.emp_name}" />
							</div>
						</div>

					</div>
					<div class="leftBox" style="width: 100%">
						<label>내용 </label>
					</div>
					<div
						style="padding: 7px 5px; height: 400px; width: 100%; border: 1px solid gray; margin-top: 50px; border-radius: 4px;">${dto.draft_content}</div>
				</div>
			</div>
			<div class="board1">
				<div class="file_container">
					<div>
							<div class="title3">
								<span> 첨부파일</span>
							</div>
					</div>
					<div class="file_container2">
						<div class="table table-border table-form">
							<c:forEach var="vo" items="${listFile}">

								<div>

									<input type="file" name="selectFile" multiple="multiple"
										class="form-control1"> <a
										href="${pageContext.request.contextPath}/approval/download?fileNum=${vo.fileNum}"><i
										class="icofont-file-alt"></i> ${vo.original_filename}</a>
								</div>
							</c:forEach>

							<div>
								<div></div>
								<!-- 
								<div>
									<div class="img-box">
										<c:forEach var="vo" items="${listFile}">
											<img src="${pageContext.request.contextPath} "
												onclick="deleteFile('${vo.fileNum}');">
										</c:forEach>
									</div>
								</div>
								 -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="board4 confirm">
				<button type="button" class="btn2"
					onclick="location.href='${pageContext.request.contextPath}/approval/list';">목록</button>
				<button type="button" class="btn2">결재</button>
				<button type="button" class="btn2">보류</button>
				<button type="button" class="btn2">반려</button>
				<button type="button" class="btn2">코멘트</button>

				<c:if test="${mode=='update'}">
					<input type="hidden" name="doc_no" value="${dto.doc_no}">
					<input type="hidden" name="page" value="${page}">
				</c:if>
			</div>
		</form>
	</div>

</div>
