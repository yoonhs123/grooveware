<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css"> 

<style type="text/css">
.table1.right-align{
	text-align:right;
}

.box bg-1{
  width:100%;
  color: #37474f;
  border-color: #37474f;
  font-size: 16px;
  font-weight: 600;
  border: 2px solid;
  text-align: center;
}

.button {
  float: left;
  min-width: 100px;
  max-width: 200px;
  display: block;
  margin: 10px;
  padding: 10px;
  background: none;
  vertical-align: middle;
  position: relative;
  z-index: 1;
  -webkit-backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
}
.button:focus {
  outline: none;
}
.button > span {
  vertical-align: middle;
}

.button--wayra {
  overflow: hidden;
  width: 100%;
  -webkit-transition: border-color 0.3s, color 0.3s;
  transition: border-color 0.3s, color 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--wayra::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 150%;
  height: 100%;
  background: #37474f;
  z-index: -1;
  -webkit-transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
  transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
  -webkit-transform-origin: 0% 100%;
  transform-origin: 0% 100%;
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s, background-color 0.3s;
  transition: transform 0.3s, opacity 0.3s, background-color 0.3s;
}
.button--wayra:hover {
  color: #fff;
  border-color: #3f51b5;
}
.button--wayra.button--inverted:hover {
  color: #3f51b5;
  border-color: #fff;
}
.button--wayra:hover::before {
  opacity: 1;
  background-color: #3f51b5;
  -webkit-transform: rotate3d(0, 0, 1, 0deg);
  transform: rotate3d(0, 0, 1, 0deg);
  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--wayra.button--inverted:hover::before {
  background-color: #fff;
}

.table1, .table2{
 width:100%;
}

.btnActive {
  color: #fff;
  opacity: 1;
  background-color: #3f51b5;
  -webkit-transform: rotate3d(0, 0, 1, 0deg);
  transform: rotate3d(0, 0, 1, 0deg);
  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}

</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate.js"></script>

<c:url var="listUrl" value="/club/${club_id}/board/list?board_category=${board_category}">
	<c:param name="club_board_no" value="${dto.club_board_no}"/>
	<c:param name="page" value="${page}"/>
	<c:if test="${not empty keyword}">
		<c:param name="condition" value="${condition}"/>
		<c:param name="keyword" value="${keyword}"/>
	</c:if>	
</c:url>

<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}"; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	// document.querySelector(".dataCount").innerHTML = dataCount+"개 ("+page+"/"+total_page+"페이지)";

	document.querySelector(".page-navigation").innerHTML = 
		dataCount === 0 ? "등록된 게시물이 없습니다." : paging;
});
</script>


<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list2">&nbsp;가입 커뮤니티</a>
         <li>
         
         <hr>
         
         <li>
             <a href="#">설문조사</a>
             <a href="#">&nbsp;설문리스트</a>
             <a href="#">&nbsp;진행중인 설문</a>
             <a href="#">&nbsp;마감된 설문</a>
         <li>
     </ul>
</div>
<div class="right-contentbody">
	
	
	<div class="board">
		<div class="title_container">
			<table class="table1" style="margin-bottom: 5px;">
				<tr>
					<td class="title"> 
						<h3>
							<span>|</span>${club_name} 클럽명
						</h3> 
					</td>
				</tr>
			</table>

			    <div class="box bg-1">
				  <button class="button button--wayra btnActive" 
			      		onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/notice/list';">공지사항</button>
			      <button class="button button--wayra" 
			      		onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=0';">가입인사</button>
			      <button class="button button--wayra" 
			      		onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=1';">자유게시판</button>
			      <button class="button button--wayra"
			      		onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/member/list';">커뮤니티 맴버</button>
			    </div>

			<table class="table2" style="margin-bottom: 5px;">
				<tr>
					<td>
						<form name="searchForm" action="${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}" method="post">
							<select name="condition" class="form-select">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="keywordform-control">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</form>
					</td>
					<td class="right-align">
						<div>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/write?board_category=${board_category}';" 
							style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"> 게시글 작성 </button>
						</div>
					</td>
				</tr>
			</table>
		 </div>
		 
	<table class="table table-border table-list">
		<thead>
				<tr>
					<th> 번호 </th> 
					<th> 제목 </th>
					<th> 작성자 </th>
					<th> 작성일 </th>
					<th> 조회수 </th>
					<th> 파일 </th>
				</tr>
		</thead>
			
		<tbody> 
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td> ${dataCount - (page-1) * size - status.index} </td>
					<td align="left">
						<c:url var="url" value="/club/${club_id}/board/article">
							<c:param name="board_category" value="${dto.board_category}"/>
							<c:param name="club_board_no" value="${dto.club_board_no}"/>
							<c:param name="page" value="${page}"/>
							<c:if test="${not empty keyword}">
								<c:param name="condition" value="${condition}"/>
								<c:param name="keyword" value="${keyword}"/>
							</c:if>									
						</c:url>					
						<a href="${url}">${dto.clubboard_title}</a>
					</td>								
					<td> ${dto.emp_name}</td>
					<td> ${dto.clubboard_regdate} </td>
					<td> ${dto.clubboard_hitcount} </td>
				</tr>
			</c:forEach>
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;"></div>
	
	</div>
</div>

		