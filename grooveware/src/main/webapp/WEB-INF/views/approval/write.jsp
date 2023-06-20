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
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
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
.myForm .flexBox{display: flex; justify-content: space-between;}
</style>
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
						<div class="box-wrapper">
							<div class="borderBox">
								<a>문서작성</a>
							</div>
							<div class="borderBox">
								<a>내문서</a>
							</div>
						</div>
					</li>

					<li><a href="#">문서함</a> <a href="#">&nbsp;내 문서</a> <a href="#">&nbsp;부서 문서</a>
						<a href="#">&nbsp;임시보관 문서</a> <a href="#">&nbsp;중요 문서</a>
					<li>

						<hr>
					<li><a href="#">결재함</a> <a href="#">&nbsp;대기</a> <a href="#">&nbsp;진행중</a>
						<a href="#">&nbsp;보류</a> <a href="#">&nbsp;반려</a> <a href="#">&nbsp;완료</a>
					<li>
				</ul>
			</div>
  
			<div class="left-menu" style="">

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
			<div  class="right-contentbody2">
				<form name="myForm" method="post" class="myForm">
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
										<button type="button" class="btn" onclick=" ">임시저장</button>
										<button type="button" class="btn" onclick=" ">예약</button>
										<button type="button" class="btn" onclick=" ">제출</button>
									</td>
								</tr>
							</table>
						</div>
						<div class="line_container">
							<div class="table" style="margin-bottom: 15px;">
								<div>
									<div class="title" style="float: left; width: 50%;">
										<span>결재라인</span>
									</div>
									<div class="title">
										<span> 공유자</span>
									</div>
								</div>
								<div style="width: 50%; float: left;">
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
									<!-- 모달을 띄울 추가 버튼 -->
									<button type="button" class="btn" onclick="openModal() "
										style="margin-top: 5px;">추가 버튼</button>
								</div>

								<div style="">
									<div class="img_container">
										<img class="" src="test.jpg">
									</div>
									<!-- 플러스 버튼 후 결제라인 설정 팝업 -->
								</div>


								<div style="width: 50%; float: left;">
									<div class="text_box3">김민교</div>
									<div class="text_box4">&nbsp;</div>
									<div class="text_box3">남기현</div>
									<div class="text_box4">&nbsp;</div>
									<div class="text_box3">최고관리자</div>

									<!-- 플러스 버튼 후 결제라인 설정 팝업 -->
								</div>

								<div>
									<div class="text_box3" style="margin-bottom: 10px;">최민정</div>
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
										<label>제목 </label>
									</div>
									<p class="ap_pBox">
										<input type="text" name="" class="form-control1"
											style="width: 100%;">
									</p>
								</div>

								<div>
									<div class="flexBox" >
										<div class="leftBox" style="margin-right: 55px">
											<label>기안일자 </label>
										</div>
										<div class="leftBox">
											<label>기안구분 </label>
										</div>
									</div>
									<div class="flexBox" >
										<div class="leftBox" >
											<p class="ap_pBox">
											<input type="text" name="urgent" class="form-control1"
												 
												readonly="readonly" /> 
											</p>
										</div>
										<div class="leftBox" >
											<p class="ap_pBox">
											<label for="draft1"> <input type="radio" name="sort"
												id="draft1" value="0" checked />품의서
											</label> <label for="draft2"> <input type="radio" name="sort"
												id="draft2" value="1" />기안서
											</label>
											</p>
										</div>
									</div>									
									 
									<div class="flexBox">
										<div class="leftBox"  >
											<label>처리기한 </label>
										</div>
										<div class="leftBox">
											<label>긴급여부 </label>
										</div>
									</div>
									<div class="flexBox ap_pBox">
										<div class="leftBox"  >
											<input type="date" name="urgent" class="form-control1"/> 
										</div>
										<div class="leftBox">
											<select name="condition" class="form-select form-control1" style=" height: 33px;">
												<option value=" "
													${condition == " " ? "selected='selected'" : ""}>일반</option>
												<option value=" "
													${condition == " " ? "selected='selected'" : ""}>
													긴급</option>
											</select>
										</div>									
									</div>
									
									<div class="flexBox">
										<div class="leftBox"  >
											<label>기안부서  </label>
										</div>
										<div class="leftBox">
											<label>기안담당 </label>
										</div>
									</div>
									<div class="flexBox ap_pBox">
										<div class="leftBox"  >
											<input type="text" name="" class="form-control1" readonly="readonly" /> 
										</div>
										<div class="leftBox">
											<input type="text" name="" class="form-control1" readonly="readonly" />
										</div>									
									</div>

								</div>
								<div class="leftBox">
									<label>내용 </label>
								</div>
									<textarea name="content" id="ir1" class="form-control" style="width: 93%; padding: 7px 5px; height: 400px;">${dto.content}</textarea>
							</div>
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
									<div>
										<input type="file" name="selectFile" accept="image/*"
											multiple="multiple" class="form-control1">
									</div>
									<div>
										<div>등록이미지</div>
										<div>
											<div class="img-box">
												<c:forEach var="vo" items="${listFile}">
													<img
														src="${pageContext.request.contextPath}/ / /${vo.imageFilename}"
														onclick="deleteFile('${vo.fileNum}');">
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
 
					<div class="board4 confirm">
						<button type="button" class="btn2">취소</button>
						<button type="button" class="btn2">임시저장</button>
						<button type="button" class="btn2">예약</button>
						<button type="button" class="btn2">제출</button>
					</div>
				</form>
				</div>
				
			</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
 

		<!-- 모달 -->
		<div id="myModal" class="modal">
		  <div class="modal-content">
			<form name="nameForm" method="post">
			<div style="border-bottom: 1px solid #ced4da; padding-bottom: 10px;">
			    <span class="close">&times;</span>
			    <h3 style="margin-bottom: 10px;">이름 검색</h3>
			   <input type="text" id="nameInput" placeholder="이름을 입력하세요" class="form-control" style="height: 26px;">
		      <button type="submit" class="btn">검색</button>
			</div>					
			<table class="table table-border table-form">
				<tbody>
					<tr>
						<td height="50%">
						 <input type="text" name="keyword" id="keyword" class="form-control1" style="height: 150px;">
						</td>
					</tr>
					<tr>
						<td align="right">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="winnerNumber" value="${dto.winnerNumber}">
							<input type="hidden" name="page" value="${page}">
							<button type="button" class="btn">추가</button>
							<button type="button" class="btn">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		  </div>
		</div>

