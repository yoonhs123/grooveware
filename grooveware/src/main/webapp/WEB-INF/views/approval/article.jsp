<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<div class="left-side-bar">

	<ul>
		<li><a href="#">문서함</a> <a href="#">&nbsp;내 문서</a> <a href="#">&nbsp;부서
				문서</a> <a href="#">&nbsp;임시보관 문서</a>
		<li>

			<hr>
		<li><a href="#">결재함</a> <a href="#">&nbsp;대기</a> <a href="#">&nbsp;진행중</a>
			<a href="#">&nbsp;보류</a> <a href="#">&nbsp;반려</a> <a href="#">&nbsp;완료</a>
		<li>
	</ul>
</div>


<div class="right-contentbody">
	<form name="myForm" method="post" class="myForm">
		<div class="board1">
			<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title2" width="10%">
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
						<div class="title" style="float: left; width: 50%;">
							<span> 결재라인</span>
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
					</div>

					<div style="width: 50%; float: left;">
						<div class="text_box3">김민교</div>
						<div class="text_box4">&nbsp;</div>
						<div class="text_box3">남기현</div>
						<div class="text_box4">&nbsp;</div>
						<div class="text_box3">최고관리자</div>
					</div>

					<div>
						<div class="text_box3" style="margin-bottom: 10px;">최민정</div>
					</div>
				</div>
			</div>
		</div>

		<div class="board3">
			<div class="line_container2">
				<div>
					<div>
						<div class="leftBox" style="margin-right: 20px">
							<label>문서번호 </label>
						</div>
						<div class="leftBox">
							<label>문서상태 </label>
						</div>
						<p class="ap_pBox">
							<input type="text" name="" class="form-control1"
								style="width: 49%; margin-right: 15px;" placeholder=""
								readonly="readonly" /> <input type="text" name=""
								class="form-control1" style="width: 49%;" placeholder=""
								readonly="readonly" />
						</p>
					</div>

					<div class="leftBox">
						<label>제목 </label>
					</div>
					<p class="ap_pBox">
						<input type="text" name="userId" class="form-control1"
							style="width: 100%;" readonly="readonly">
					</p>
					<div>
							<label>기안구분</label>
							<p class="ap_pBox">
								<input type="text" name="userId" class="form-control1"
									readonly="readonly" style="width: 100%;">
							</p>
							<div>
								<div class="leftBox" style="margin-right: 20px">
									<label>기안일자 </label>
								</div>
								<div class="leftBox">
									<label>중요도 </label>
								</div>
								<p class="ap_pBox">
									<input type="text" name="" class="form-control1"
										style="width: 49%; margin-right: 15px;" placeholder=""
										readonly="readonly" /> <input type="text" name=""
										class="form-control1" style="width: 49%;" placeholder=""
										readonly="readonly" />
								</p>
							</div>
							<div>
								<div class="leftBox" style="margin-right: 20px">
									<label>기안부서 </label>
								</div>
								<div class="leftBox">
									<label>기안담당 </label>
								</div>
								<p class="ap_pBox">
									<input type="text" name="" class="form-control1"
										style="width: 49%; margin-right: 15px;" placeholder=""
										readonly="readonly" /> <input type="text" name=""
										class="form-control1" style="width: 49%;" placeholder=""
										readonly="readonly" />
								</p>
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
				<div style="margin-bottom: 15px;">
					<div class="title">
						<span> 첨부파일</span>
					</div>
				</div>
				<div class="file_container2">
					<div class="" style="display: block;"></div>
				</div>
			</div>
		</div>
		<div class="board3">
			<div class="file_container">
				<div style="margin-bottom: 15px;">
					<div class="title">
						<span> 참조문서</span>
					</div>
				</div>
				<div class="file_container3">
					<div class="" style="display: block;">
						<div class="text_box2" style="text-align: center;"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="board4 confirm">
			<button type="button" class="btn2">목록</button>
			<button type="button" class="btn2">결재</button>
			<button type="button" class="btn2">보류</button>
			<button type="button" class="btn2">반려</button>
			<button type="button" class="btn2">코멘트</button>
		</div>
	</form>
</div>

