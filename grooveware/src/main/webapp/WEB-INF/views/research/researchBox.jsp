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
.research-createbtn {
	height: 30px;
	border-radius: 4px;
    padding: 5px 10px;
    background-color: #243A73;
    border: 1px solid #404040;
    cursor: pointer;
    font-weight: 550;
    color: #fff;
}

.research-search-form{
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
.Quest-create-btn {
	height: 30px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #CEDDEF;
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 600;
}
.Quest-info-btn{
	height: 30px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #eaeaea;
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 600;
}
</style>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="#">&nbsp;가입 커뮤니티</a>
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
					<td class="title" > <h2><span><i class="fa-solid fa-box-archive"></i></span>&nbsp;설문작성함</h2> 
					</td>
				</tr>
				</table>
			<table class="table1" style="margin-bottom: 5px;">
				<tr>
					<td>
						<form name="searchForm" class="research-search-form" action="${pageContext.request.contextPath}/ " method="post">
							<select name="condition"  class="search-option">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >설문조사명</option>
								<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >부서명</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="search-input" placeholder="검색어를 입력하세요">
							<button type="button" class="search-button" onclick="searchList();">검색</button>
						</form>
					</td>
					<td align="right">
						<div>
							<button type="button" class="research-createbtn"
							onclick="location.href='${pageContext.request.contextPath}/research/write';" ><i class="fa-solid fa-file-circle-plus"></i>&nbsp;설문 작성</button>
						</div>
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
					<th> 질문등록 </th>
					<th> 공개여부 </th>
					<th> 상태 </th>
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
					<td><button type="button" class="Quest-create-btn"
								onclick="location.href='${pageContext.request.contextPath}/research/${dto.research_id}/multipleForm';" >질문 작성</button></td>
					<td><button type="button" class="Quest-info-btn"
								onclick="location.href='${pageContext.request.contextPath}/research/${dto.research_id}/article';" >상세</button></td>
					<td>진행중</td>
				</tr>
			</c:forEach>
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;"></div>
	
	</div>
</div>

		