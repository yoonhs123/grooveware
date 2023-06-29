<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css"> 


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
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<td class="title" > <h3><span>|</span> ${dto.club_name}</h3> 
					</td>
					<td>${dataCount - (page-1) * size - status.index}</td>
					<td align="right">
						<div>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/club/write';" 
							style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;">커뮤니티 만들기</button>
						</div>
						
						<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
							<select name="condition" class="form-select">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >커뮤니티</option>
								<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >운영자</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="keywordform-control">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</form>
					</td>
				</tr>
			</table>
		 </div>
	<table class="table table-border table-list" >
		<thead>
				<tr>
					<th style="width: 25%;">
						커뮤니티 공지사항
					</th> 
					<th> 제목 </th>
					<th> 작성자 </th>
					<th> 작성일 </th>
					<th> 조회수 </th>
					<th> 첨부파일 </th>
				</tr>
		</thead>
			
		<tbody> 
		
		<!-- <c:forEach var="dto" items="${list}" varStatus="status"> -->
				<tr>
					<td> 공지사항입니다. </td>					
					<td> 작성자 </td>
					<td> 2021-06-21</td>
					<td> 3 </td>
					<td> 첨부파일 </td>
				</tr>
		<!-- </c:forEach> -->
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
	
	</div>
</div>
		