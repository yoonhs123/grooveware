<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="left-side-bar">
      <ul> 
          <li>
              <a href="${pageContext.request.contextPath}/archive/list">캘린더</a>
          </li>
          
          <li>
              <a href="${pageContext.request.contextPath}/reservation/main">자원 예약</a>
              <a href="${pageContext.request.contextPath}/reservation/main">&nbsp;회의실 예약</a>
          <li>
      </ul>
</div>
		<div class="right-contentbody">
		
			<div class="r-list">
			
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h3><span>|</span> 회의실 리스트</h3> 
						</td>
						
					
					
				
						
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >작성자</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >등록일</option>
									<option value="subject"  ${condition == "subject" ? "selected='selected'" : ""} >제목</option>
									<option value="content"  ${condition == "content" ? "selected='selected'" : ""} >내용</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</form>
						</td>
					</tr>
				</table>
			 </div>
			
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th width="5%;">
							<input type="checkbox" name="chkAll" value="all"> 
						</th> 
						<th> 번호 </th>
						<th width="30%;"> 회이실명 </th>
						<th> 위치 </th>						
						<th> 등록일 </th>
						<th> 조회수 </th>
						<th> 첨부 </th>
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="n" begin="1" end="9">
						<tr>
							<td>
								<input type="checkbox" name="" value=" ">
							</td>					
							<td>1</td>
							<td>
								<a href=" ">회의실</a>
							</td>
							<td>102호</td>
							<td>2020-12-25</td>
							<td>12</td>
							<td></td>
							
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
	
			</div>
		</div>

</body>
</html>
