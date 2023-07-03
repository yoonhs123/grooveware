<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css"> 

<style type="text/css">

</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType: dataType,
		success: function(data){
			fn(data);
		},
		beforeSend : function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR){
			if(jqXHR.status === 403){
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400){
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="#">&nbsp;가입 커뮤니티</a>
         <li>
         
         <hr>
         
         <li>
             <a href="${pageContext.request.contextPath}/research/list">설문조사</a>
             <a href="${pageContext.request.contextPath}/research/list">&nbsp;설문리스트</a>
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
					<td class="title" > <h3><span>|</span> 사내 설문조사</h3> 
					</td>
					
					<td align="right">
						<div>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/club/write';" 
							style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;">설문 작성</button>
						</div>

						<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
							<select name="condition" class="form-select">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >설문조사명</option>
								<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >부서명</option>
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
					<th>번호</th>
					<th style="width: 25%;">
						설문조사명
					</th> 
					<th> 설문시작날짜 </th>
					<th> 설문종료날짜 </th>
					<th> 작성자 </th>
					<th> 등록일 </th>
					<th> 상태 </th>
				</tr>
		</thead>
			
		<tbody> 
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td> ${dto.research_title} </td>					
					<td> ${dto.research_startdate}</td>
					<td> ${dto.research_enddate}</td>
					<td> ${dto.emp_name} </td>
					<td> ${dto.research_regdate} </td>
					<td><button type="button" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
								onclick="read('${dto.research_id}')">참여</button></td>
				</tr>
			</c:forEach>
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
	
	</div>
</div>

		