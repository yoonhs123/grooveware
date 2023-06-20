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
	<div class="right-contentbody" >


		<div>
			<div class="title">
				<h3>
					<span>|</span> 커뮤니티
				</h3>
			</div>
			
			<form name="commForm" method="post" enctype="multipart/form-data">
			<div class="comm">
				<table class="table table-border table-form">
					<tr>
						<td>커뮤니티명</td>
						<td><input type="text" class="inputForm-control"></td>
					</tr>
					<tr>
						<td valign="top">소개</td>
						<td><textarea name="content" class="form-control"
								style="height: 400px;">${dto.content}</textarea></td>
					</tr>

					<tr>
						<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td><input type="file" name="selectFile" class="form-control">
						</td>
					</tr>
					<c:if test="${mode=='update' }">
						<tr>
							<td>첨부된 파일</td>
							<td><label>${dto.originalFilename}</label></td>
						</tr>
					</c:if>
					</table>
				</div>

				<table class="table">
					<tr>
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=="write"?"등록하기":"수정완료"}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn"
								onclick="location.href='${pageContext.request.contextPath}/memo/list.do';">${mode=="write"?"등록취소":"수정취소"}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="saveFilename"
									value="${dto.saveFilename}">
								<input type="hidden" name="originalFilename"
									value="${dto.originalFilename}">
							</c:if>
						</td>
					</tr>
				</table>

			</form>

		</div>
	</div>