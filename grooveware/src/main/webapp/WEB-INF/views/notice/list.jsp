<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="#">문서함</a>
                <a href="#">&nbsp;내 문서</a>
                <a href="#">&nbsp;부서 문서</a>
                <a href="#">&nbsp;임시보관 문서</a>
            <li>
            
            <hr>
            
            <li>
                <a href="#">결재함</a>
                <a href="#">&nbsp;대기</a>
                <a href="#">&nbsp;진행중</a>
                <a href="#">&nbsp;보류</a>
                <a href="#">&nbsp;반려</a>
                <a href="#">&nbsp;완료</a>
            <li>
        </ul>
    </div>
		<div class="right-contentbody">
		
			<div class="notic-list">
			
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h3><span>|</span> 공지사항</h3> 
						</td>
						
					
					
				<td align="right" width="100">
					
						
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
						<th width="60%;"> 제목 </th>
						<th> 작성자 </th>						
						<th> 작성일 </th>
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
								<a href=" ">22년도 상반기 영업 매출의 보고</a>
							</td>
							<td>김자바</td>
							<td>2023-06-01</td>
							<td>14</td>
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