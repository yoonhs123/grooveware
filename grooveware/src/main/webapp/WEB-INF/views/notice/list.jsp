<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}";

	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);

	document.querySelector(".dataCount").innerHTML = dataCount + "개 (" + page + "/" + total_page + " 페이지)";
	document.querySelector(".page-navigation").innerHTML = dataCount == 0 ? "등록된 게시물이 없습니다." : paging;
}, false);

function searchList() {
	const f = document.searchForm;
	f.submit();
}
 

 
</script>
<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/notice/all/list">회사 공지사항</a>
                <a href="${pageContext.request.contextPath}/notice/dept/list">${dept_name} 공지사항</a>
            <li>
        </ul>
       <hr>
</div>
    
		<div class="right-contentbody">
	
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h3><span>|</span> ${gubun=="dept"? dept_name :"회사" } 공지사항</h3> 
						</td>
					</tr>
				</table>
				
				<div class="notice-list">
				<table class="table">
			
					<tr>	
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/notice/${gubun}/list" method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >작성자</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >등록일</option>
									<option value="subject"  ${condition == "subject" ? "selected='selected'" : ""} >제목</option>
									<option value="content"  ${condition == "content" ? "selected='selected'" : ""} >내용</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn-notice" onclick="searchList();">검색</button>
						    	<button type="button" class="btn-notice" onclick="location.href='${pageContext.request.contextPath}/notice/${gubun}/write';">등록하기</button>
							</form>
						</td>
					</tr>
				</table>

			
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th width="70"> 번호 </th>
						<th> 제목 </th>
						<th width="100"> 작성자 </th>					
						<th width="90"> 작성일 </th>	
						<th width="70"> 조회수 </th>
						<th width="70"> 첨부 </th>
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="dto"  items="${list}" varStatus="status">
						<tr>					
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>
								<a href="${articleUrl}&noti_id=${dto.noti_id}">${dto.noti_title}</a>
							</td>
							<td>${dto.emp_name}</td>
							<td>${dto.noti_regdate}</td>
							<td>${dto.noti_hitcount}</td>
							<td>
								<c:if test="${not empty dto.save_filename}">
										<a href="<c:url value='/notice/${gubun}/download?noti_id=${dto.noti_id}'/>" class="text-reset"><i class="fa-solid fa-file-arrow-down"></i></a>
								</c:if>
							
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
	
			</div>
		</div>
		</div>

</body>
</html>
