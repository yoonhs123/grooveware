<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* form */
.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select2 {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select2[readonly] { background-color:#f8f9fa; }

.form-check-input { width: 1em; height: 1em; vertical-align: middle; background-color: #fff; border: 1px solid rgba(0,0,0,.25); margin-top: 7px; margin-bottom: 7px; }
.form-check-input:checked { background-color: #0d6efd; border-color: #0d6efd; }
.form-check-input[type=checkbox] { border-radius: 0.25em; }
.form-check-label { cursor: pointer; vertical-align: middle; margin-top: 7px; margin-bottom: 7px; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

.n_title {
   
    border-bottom: none;

}

.n_button {
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

<script type="text/javascript">

function searchList() {
	const f = document.searchForm;
	f.submit();
}
 

 
</script>
<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/notice/all/list">사내 공지사항</a>
                <a href="${pageContext.request.contextPath}/notice/dept/list">${dept_name} 공지사항</a>
            <li>
        </ul>
</div>
    
		<div class="right-contentbody">
	
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h2>
                &nbsp;&nbsp;  <i class="fa-solid fa-pen-to-square"></i>
               ${gubun == "dept" ? dept_name : "사내"} 공지사항
               </h2>

               
						</td> 
					</tr>
				</table>
				
				<div class="notice-list">
			<table class="table">
				<tr>	
					<td align="right">
						<form name="searchForm" action="${pageContext.request.contextPath}/notice/${gubun}/list" method="post">
							<select name="condition" class="form-select2">
								<option value="all" ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
								<option value="name" ${condition == "name" ? "selected='selected'" : ""} >작성자</option>
								<option value="reg_date" ${condition == "reg_date" ? "selected='selected'" : ""} >등록일</option>
								<option value="subject" ${condition == "subject" ? "selected='selected'" : ""} >제목</option>
								<option value="content" ${condition == "content" ? "selected='selected'" : ""} >내용</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="form-control">
							<button type="button" class="btn-notice" onclick="searchList();">검색</button>
							<c:if test="${sessionScope.member.dept_no == '60' || sessionScope.member.dept_no == '61' || sessionScope.member.dept_no == '62'}">
								<button type="button" class="btn-notice" onclick="location.href='${pageContext.request.contextPath}/notice/${gubun}/write';">등록하기</button>
							</c:if>
						
						</form>
						<div style="margin-top: 10px;">
							${dataCount}개(${page}/${total_page} 페이지)
						</div>
					</td>
				</tr>
			</table>
							

			
			<table class="table table-border table-list">
				<thead style= " border-bottom: none;">
					<tr class = "n_title">
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
							<td align="left">
								<a href="${articleUrl}&noti_id=${dto.noti_id}">${dto.noti_title}</a>
							</td>
							<td>관리자</td>
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
