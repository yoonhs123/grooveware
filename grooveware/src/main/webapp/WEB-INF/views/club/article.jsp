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


	<div class="board">
		<div class="title">
			<h3>
				<span>|</span> 커뮤니티
			</h3>
		</div>
		<div class="comm">
		<table class="table table-border table-article"
			style="margin-top: 20px;">
			<thead>
				<tr>
					<td width="50%">제목 : 커뮤니티</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td width="50%">작성자 : 김상후</td>
					<td width="50%" align="right">등록일 : 2020-03-04</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="2" valign="top" height="400">${dto.content}</td>
				</tr>


				<tr>
					<td colspan="2">파&nbsp;&nbsp;일 : <c:if
							test="${not empty dto.saveFilename}">
							<a
								href="${pageContext.request.contextPath}/sbbs/download.do?num=${dto.num}">${dto.originalFilename}</a>
									(<fmt:formatNumber value="${dto.fileSize/1024}"
								pattern="#,##0.00" /> kb)
								</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">이전글 : <c:if test="${not empty preReadDto}">
							<a
								href="${pageContext.request.contextPath}/sbbs/article.do?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">다음글 : <c:if test="${not empty nextReadDto}">
							<a
								href="${pageContext.request.contextPath}/sbbs/article.do?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<table class="table">
			<tr>
				<td width="50%">
					<button type="button" class="btn"
						onclick="location.href='${pageContext.request.contextPath}/memo/update.do?num=${dto.num}&page=${page}';">수정</button>
					<button type="button" class="btn" onclick="deleteMemo();">삭제</button>
					<button type="button"
						class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"
						style="float: right;">
						<i class="fa-regular fa-heart"
							style="color: ${isUserLike?'blue':'black'}"></i> <span
							id="boardLikeCount">${dto.likeCount}</span>
					</button>
				</td>
				<td align="right">
					<button type="button" class="btn"
						onclick="location.href='${pageContext.request.contextPath}/memo/list.do?page=${page}';">리스트</button>
				</td>
		</table>

		<div class="reply">
			<form name="replyForm" method="post">
				<div class='form-header'>
					<span class="bold">댓글</span>
				</div>

				<table class="table table-borderless reply-form">
					<tr>
						<td><textarea class='form-control' name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right'>
							<button type='button' class='btn'>댓글 등록</button>
						</td>
					</tr>
				</table>
			</form>

			<div id="listReply"></div>
		</div>
	</div>
</div>
