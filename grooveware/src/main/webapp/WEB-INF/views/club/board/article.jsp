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
.club-board-article th {
    padding: 10px;
}
.club-board-article td {
    padding: 10px;
    border-bottom: 1.5px solid #c1c1c1;
}
.club-board-article th {
    padding: 10px;
    border-top: 1px solid #c1c1c1;
    border-bottom: 1px solid #c1c1c1;
    font-size: 16.5px;
}
.club-board-write-btn,
.club-board-del-btn,
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
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;사내 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/mylist">&nbsp;가입 커뮤니티</a>
         <li>
         
         <li>
             <a href="${pageContext.request.contextPath}/research/open/list">설문조사</a>
         <c:choose>
	   		 <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70}">
	         	 <a href="${pageContext.request.contextPath}/research/researchBox">&nbsp;설문작성함</a>
	         </c:when>
    		<c:otherwise>
       		  <!-- dept_no가 60~ 70 사이가 아닐 때는 두 번째 <li> 태그를 출력하지 않게 -->
          	</c:otherwise>
   	 	 </c:choose>
             <a href="${pageContext.request.contextPath}/research/open/list">&nbsp;진행중인 설문</a>
             <a href="${pageContext.request.contextPath}/research/close/list">&nbsp;마감된 설문</a>
         <li>
     </ul>
</div>

<div class="right-contentbody" >
	<div class="board">
		<div class="title">
			<h3>
				<span>|</span>&nbsp;${club.club_name}&nbsp;${board_category==0?'가입인사':'자유게시판'}
			</h3>
		</div>
		
		<table class="club-board-title">
				<tr class="club-board-title-td">
					<td>
						<button type="button" class="club-board-write-btn" 
								onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}';">수정</button>
					</td>
					<td>
						<button type="button" class="club-board-del-btn" 
								onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}';">삭제</button>
					</td>
					<td>
						<button type="button" class="club-board-list-btn" 
								onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}';">리스트</button>
					</td>
				</tr>
		</table>
		
		<div class="comm">
		<table class="club-board-article">
			<thead>
				<tr>
					<td colspan="2" align="center" style="border-top: 1.5px solid #c1c1c1; background-color: #f6f6f6; font-weight:600; font-size: 17px;">
						${dto.clubboard_title}
					</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td width="50%">
							작성자 : ${dto.emp_name}
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
