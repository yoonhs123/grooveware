<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.table1 {
    width: 100%;
}
.table1 td {
    padding: 5px;
}
.table2 {
	border-spacing: 0;
    width: 100%;
    text-align: center;
	margin: auto;
}
.table2 th, .table2 td {
    padding: 10px;
    border-bottom: 1px solid #c1c1c1;
}
.table2 th {
    padding: 10px;
    border-top: 2px solid #212529;
    border-bottom: 1.5px solid #c1c1c1;
    font-size: 16.5px;
    background-color: #f2f2f2;
}
.research-search-list-form{
    display: flex;
    align-items: center;
    margin-top: 5px;
    margin-bottom: 5px;
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

}
.search-input {
    width: 200px;
    padding: 5px 10px;
}
.search-button{
	height: 30px;
	border-radius: 4px;
    padding: 5px 10px;
    background-color: #fff;
    border: 1px solid #404040;
    cursor: pointer;
    font-weight: 600;
}
.result{
	border: none;
	background-color: #fff;
}
.choice{
	height: 30px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #CEDDEF;
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 600;
}
</style>

<script>
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

// 참여
// ajax json으로 가져오기(true랑 false)
$(function(){
	$(".choice").click(function(){
		let research_id = $(this).attr("data-research_id");
		location.href = "${pageContext.request.contextPath}/research/open/"+research_id+"/choice";
	});
});

// 결과보기
$(function(){
	$(".result").click(function(){
		let research_id = $(this).attr("data-research_id");
		location.href = "${pageContext.request.contextPath}/research/close/"+research_id+"/result";
	});
});

</script>

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
<div class="right-contentbody">
	<div class="board">
			<div class="title_container">
			<table class="table1" style="margin-bottom: 5px;">
				<tr>
					<td class="title" > <h2><span><i class="fa-solid fa-clipboard-list"></i></span>&nbsp;사내 설문조사</h2> 
					</td>
				</tr>
			</table>
			
			<table class="table1" style="margin-bottom: 5px;">
				<tr>
					<td align="right">
						<form name="searchForm" class="research-search-list-form" action="${pageContext.request.contextPath}/ " method="post">
							<select name="condition" class="search-option">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >설문조사명</option>
								<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >부서명</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="search-input" placeholder="검색어를 입력하세요">
							<button type="button" class="search-button" onclick="searchList();">검색</button>
						</form>
					</td>
				</tr>
			</table>
		 </div>
	<table class="table2" >
		<thead>
				<tr>
					<th>번호</th>
					<th style="width: 30%;">
						설문조사명
					</th> 
					<th> 설문시작날짜 </th>
					<th> 설문종료날짜 </th>
					<th> 작성자 </th>
					<th> 보기 </th>
				</tr>
		</thead>
			
		<tbody> 
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td>${dataCount - (page-1) * size - status.index} </td>
					<td align="left"> ${dto.research_title} </td>					
					<td> ${dto.research_startdate}</td>
					<td> ${dto.research_enddate}</td>
					<td> ${dto.emp_name} </td>				
					<td>
						<c:if test="${category=='open'}">
							<button type="button" class="choice" data-research_id="${dto.research_id}">참여하기</button>
						</c:if>
						<c:if test="${category=='close'}">
							<button type="button" class="result" data-research_id="${dto.research_id}"><i class="fa-solid fa-magnifying-glass-chart"></i></button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;"></div>
	
	</div>
</div>

		