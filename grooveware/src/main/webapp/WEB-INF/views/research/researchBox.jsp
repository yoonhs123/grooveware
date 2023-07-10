<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<td class="title" > <h3><span>|</span>&nbsp;사내 설문조사</h3> 
					</td>
					
					<td align="right">
						<div>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/research/write';" 
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
					<th> 질문등록 </th>
					<th> 공개여부 </th>
					<th> 상태 </th>
				</tr>
		</thead>
			
		<tbody> 
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td>${dataCount - (page-1) * size - status.index} </td>
					<td> ${dto.research_title} </td>					
					<td> ${dto.research_startdate}</td>
					<td> ${dto.research_enddate}</td>
					<td> ${dto.emp_name} </td>
					<td> ${dto.research_regdate} </td>
					<td><button type="button" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
								onclick="location.href='${pageContext.request.contextPath}/research/${dto.research_id}/multipleForm';" >질문 작성</button></td>
					<td><button type="button" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
								onclick="location.href='${pageContext.request.contextPath}/research/${dto.research_id}/article';" >상세</button></td>
					<td>진행중/마감</td>
				</tr>
			</c:forEach>
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;"></div>
	
	</div>
</div>

		