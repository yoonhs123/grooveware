<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

.myForm .flexBox{display: flex; justify-content: space-between;}

.board5 {
	display: flex;
	justify-content: flex-end;
	padding-top : 20px;
}

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
	
	
	
function sendOk() {
	const f = document.projectForm;
	let str;
	
    str = f.pj_name.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return false;
    }

	str = f.pj_content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/project/${mode}";
    f.submit();
}	
	
	
	
	
</script>

<div class="left-side-bar">
         <ul>
            <li>
                <a href="#" class="current_pj_name">현재 진행중인 프로젝트</a>
                <a href="#">&nbsp;메인으로</a>
                <a href="#">&nbsp;새 프로젝트 생성</a>
            <li>
            <hr>
            <li>
                <a href="#">&nbsp;멤버</a>
                <a href="#">&nbsp;목표</a>
                <a href="#">&nbsp;업무</a>
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>

		<div class="right-contentbody">
				<form name="projectForm" method="post" class="myForm" enctype="multipart/form-data">
					<div class="board1">
						<div class="title_container">
							<table class="table" style="margin-bottom: 20px;">
								<tr>
									<td class="title2" width="85%">
										<h2>
											<span>|</span> 프로젝트 생성
										</h2>
									</td>
									<td class="title">
										<span>생성자 : </span> <span> ${sessionScope.member.emp_name} </span>
									</td>
								</tr>
							</table>
						</div>
						
					</div>
					<div class="pj_write">
						<div class="line_container2">
							<div>
								<div>
									<div>
										<label>제목 </label>
									</div>
									<p class="ap_pBox">
										<input type="text" name="pj_name" class="form-control1" value="${dto.pj_name}"
											style="width: 100%;">
									</p>
									<br><br><br><br>
								</div>

								<div>
								
								<table class="table" style="margin-bottom: 20px;">
								<tr>
									<td class="title2" width="90%">
										<label>구성멤버</label> 
									</td>
									<td class="title">
										<!-- 모달을 띄울 추가 버튼 -->
										<button type="button" class="btn" onclick="openModal()" style="margin-top: 5px;">추가</button>
									</td>
								</tr>
								</table>
								
								
								
								
													
									
									
									
									<div class="flexBox" >
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
									 <br><br><br><br>
									<div class="flexBox">
										<div class="leftBox"  >
											<label>프로젝트 시작일 </label>
										</div>
										<div class="leftBox">
											<label>프로젝트 종료일 </label>
										</div>
									</div>
									
									<div class="flexBox ap_pBox">
										<div class="leftBox"  >
											<input type="date" name="pj_start_date" class="form-control1" value="${dto.pj_start_date}"/> 
										</div>
										<div class="leftBox">
											<input type="date" name="pj_end_date" class="form-control1" value="${dto.pj_end_date}"/>
										</div>									
									</div>

									<br><br><br><br>
										<div class="leftBox">
											<label>내용 </label>
										</div>
										<input type="text" name="pj_content" style="display: block; width: 100%; padding: 7px 5px; height: 400px;" />${dto.content}
							
									<br><br><br><br>
										<div class="leftBox">
											<label>클라이언트 정보 </label>
										</div>
										<input type="text" name="" style="display: block; width: 100%; padding: 7px 5px; height: 400px;" />
							
								</div>
								
								
									
								<br><br>
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
					</div>



					<div class="board5">
						<button type="button" class="btn2" onclick="sendOk();">생성</button>
						<button type="button" class="btn2" style= "justify-content : flex-end">취소</button>
					</div>
				</form>


</div>



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
						 <div style="height: 150px; border: 1px solid black;"></div>
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
		
		
<script type="text/javascript">
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
</script>