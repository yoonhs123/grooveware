<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="left-side-bar">
         <ul>
            <li>
                <a href="#" class="current_pj_name">현재 진행중인 프로젝트</a>
                <a href="#">&nbsp;프로젝트1</a>
                <a href="#">&nbsp;프로젝트2</a>
                <a href="#">&nbsp;프로젝트3</a>
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
								<input type="text" name="content"
									style="display: block; width: 100%; padding: 7px 5px; height: 400px;" />
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
					<div class="board1">
						<div class="file_container">
							<div>
								<div class="title3">
									<span> 참조문서</span>
								</div>
							</div>
							<div class="file_container2">
								<div class="table table-border table-form">
									<div>
										<input type="file" name="selectFile" accept="image/*"
											multiple="multiple" class="form-control1">
									</div>
									<div>
										<div></div>
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
이건 프로젝트 생성 양식이다


</div>