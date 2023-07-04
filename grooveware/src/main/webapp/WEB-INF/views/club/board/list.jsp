<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.club-board-table1, 
.club-board-table2,
.club-board-table3,
.club-board-table4{
 	width:100%;
}

.club-board-table3{
	margin-top: 20px;
	margin-bottom: 20px;
}

.box bg-1{
  display: flex;
  font-size: 16px;
  font-weight: 600;
  border: 1px solid;
  text-align: center;
  justify-content: space-between;
}

.op-button {
  flex-basis: 25%;
  width: 190px;
  margin: 15px 15px 0 15px;
  padding: 10px;
  background: none;
  vertical-align: middle;
  position: relative;
  z-index: 1;
}
.op-button:focus {
  outline: none;
}
.op-button > span {
  vertical-align: middle;
}
.op-button--wayra {
  overflow: hidden;
  letter-spacing: 1.5px;
  font-size: 15px;
}
.op-button--wayra::before {
  position: absolute;
  top: 0;
  left: 0;
  width: 150%;
  height: 100%;
  background-color: #243A73;
  z-index: -1;
}
.op-button--wayra:hover {
  color: #fff;
  border-color: #243A73;
  background-color: #243A73;
}
.op-button--wayra.button--inverted:hover {
  color: #404040;
  border-color: #243A73;
}
.op-button--wayra:hover::before {
  opacity: 1;
  background-color: #243A73;
}
.op-button--wayra.button--inverted:hover::before {
  background-color: #243A73;
}
.btnActive {
  color: #fff;
  opacity: 1;
  background-color: #243A73;
}

.search-form {
    display: flex;
    align-items: center;
    margin-top: 5px;
    margin-bottom: 10px;
}
.search-option,
.search-input {
	height: 30px;
	margin-right: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	outline: none;
}
.search-option {
    width: 100px;
    padding-left: 5px;
    color: #404040;
}
.search-input {
    width: 200px;
    padding: 5px 10px;
}
.search-button,
.board-createbtn {
	height: 30px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #CEDDEF; 
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 600;
}

td.write-btn{
	text-align:right;
}

.club-board-table4 {
    width: 100%;
    border-spacing: 0;
    text-align: center;
	margin: auto;
	color: #404040;
}
.club-board-table4 th, .club-board-table4 td {
    padding: 10px;
    border-bottom: 1px solid #c1c1c1;
}
.club-board-table4 th {
    padding: 10px;
    border-top: 2px solid #c1c1c1;
    border-bottom: 2px solid #c1c1c1;
    font-size: 16.5px;
    background-color: #f6f6f6;
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
<div class="right-contentbody">
	<div class="board">
		<div class="title_container">
			<table class="club-board-table1">
				<tr>
					<td class="title"> 
						<h3>
							<span>|</span>&nbsp;${club.club_name}
						</h3> 
					</td>
				</tr>
			</table>
			<table class="club-board-table2">
				<tr>
					<td>
			    		<div class="box bg-1">
						  <button class="op-button op-button--wayra" 
					      		  onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/notice/list';">공지사항</button>
					      <button class="op-button op-button--wayra ${board_category==0?'btnActive':'' }" 
					      		  onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=0';">가입인사</button>
					      <button class="op-button op-button--wayra ${board_category==1?'btnActive':'' }" 
					      		  onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=1';">자유게시판</button>
					      <button class="op-button op-button--wayra"
					      		  onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/member/list';">커뮤니티 맴버</button>
		   				</div>
		   			</td>
 			 	</tr>
			</table>

			<table class="club-board-table3">
				<tr>
					<td>
						<form name="searchForm" action="${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}" method="post">
							<select name="condition" class="search-option">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="search-input"  placeholder="검색어를 입력하세요">
							<button type="button" class="search-button" onclick="searchList();">검색</button>
						</form>
					</td>
					<td class="write-btn">
						<div>
							<button type="button"  class="write-btn board-createbtn" 
									onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/write?board_category=${board_category}';" > 작성 </button>
						</div>
					</td>
				</tr>
			</table>
		 </div>
		 
	<table class="club-board-table4">
		<thead>
			<tr>
				<th> 번호 </th> 
				<th> 제목 </th>
				<th> 작성자 </th>
				<th> 작성일 </th>
				<th> 조회수 </th>
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

		