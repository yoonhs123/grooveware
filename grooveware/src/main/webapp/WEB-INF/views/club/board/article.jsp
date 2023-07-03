<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.club-board-title{
	padding-bottom : 13px;
	text-align : right;
}
.club-board-article{
    width: 100%;
    border-spacing: 0;
	margin: auto;
	color: #404040;
}
.club-board-article th, .club-board-article td {
    padding: 10px;
    border-top: 1px solid #c1c1c1;
    border-bottom: 1px solid #c1c1c1;
}
.club-board-article th {
    padding: 10px;
    border-top: 1px solid #c1c1c1;
    border-bottom: 1px solid #c1c1c1;
    font-size: 16.5px;
}
.club-board-write-btn,
.club-board-list-btn {
	height: 30px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #CEDDEF; 
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 600;
    margin: 0 5px; 
}

</style>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/mylist">&nbsp;가입 커뮤니티</a>
         <li>
      
         <li>
             <a href="#">설문조사</a>
             <a href="#">&nbsp;설문리스트</a>
             <a href="#">&nbsp;진행중인 설문</a>
             <a href="#">&nbsp;마감된 설문</a>
         <li>
     </ul>
</div>

<div class="right-contentbody" >
	<div class="board">
		<div class="title">
			<h3>
				<span>|</span> ${dto.club_name} 게시글
			</h3>
		</div>
		
		<table class="club-board-title">
				<tr>
					<td class="text-end">
						<button type="button" class="club-board-write-btn" 
								onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}';">수정</button>
					</td>
					<td class="text-end">
						<button type="button" class="club-board-list-btn" 
								onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}';">리스트</button>
					</td>
				</tr>
		</table>
		
		<div class="comm">
		<table class="club-board-article">
			<thead>
				<tr>
					<td colspan="2" align="center">
						${dto.clubboard_title}
					</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td width="50%">
							이름 : ${dto.emp_name}
						</td>
						<td align="right">
							작성일&nbsp;${dto.clubboard_regdate}&nbsp; | &nbsp;조회&nbsp;${dto.clubboard_hitcount}
					</td>
				</tr>

				<tr>
					<td colspan="2" valign="top" height="200">
						${dto.clubboard_content}
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						이전글 : 
						<c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/club/${club_id}/board/article?board_category=${board_category}&club_board_no=${preReadDto.club_board_no}&${query}">${preReadDto.clubboard_title}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						다음글 : 
						<c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/club/${club_id}/board/article?board_category=${board_category}&club_board_no=${nextReadDto.club_board_no}&${query}">${nextReadDto.clubboard_title}</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>

		
		</div>
	</div>
</div>
