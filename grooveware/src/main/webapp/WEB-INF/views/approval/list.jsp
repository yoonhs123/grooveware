<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<style type="text/css">
 
/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da;  }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

/* board */

.title { font-size: 20px; font-weight: bold; padding: 13px 0; }

.table-list thead > tr { background: #f8f9fa; }
.table-list th, .table-list td { text-align: center; }
.table-list td:nth-child(5n+2) {  padding-left: 5px; }

.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }

 
.btn {
	color: black;
	border: 1px solid #999999;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	line-height: 15px;
	background-color: white;
}
input[type=text]{
    width: 300px;
    height: 26px;
    
}

.form-select{ height: 26px; margin-right: 10px; border-radius: 4px;}

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
					<a href="${pageContext.request.contextPath}/approval/write">문서작성</a>
		</li>       
        
            <li>
                <a>문서함</a>
                <a href="${pageContext.request.contextPath}/approval/list?doc_status=1">&nbsp;내 문서</a>
                <a href="#">&nbsp;부서 문서</a>
                <a href="${pageContext.request.contextPath}/approval/list?doc_status=0">&nbsp;임시보관 문서</a>
                <a href="#">&nbsp;중요 문서</a>
            <li>
            
            
            <li>
                <a>결재함</a>
                <a href="${pageContext.request.contextPath}/approval/standByList">&nbsp;대기</a>
                <a href="${pageContext.request.contextPath}/approval/progressList">&nbsp;진행중</a>
                <a href="${pageContext.request.contextPath}/approval/sendBackList">&nbsp;반려</a>
                <a href="#">&nbsp;완료</a>
            <li>
        </ul>
    </div>
		<div class="right-contentbody">
		
			<div class="board1">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > 
							<h3><span>|</span> 
								<c:choose>
								  <c:when test="${doc_status == 0}">
								    임시보관
								  </c:when>
								  <c:when test="${doc_status == 1}">
								    내문서
								  </c:when>								  
											  
								</c:choose>
							</h3> 
						</td>
						<td class="title" >
								<select name="condition" class="form-select"> 
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >내문서</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >그룹문서</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >임시문서</option>
									<option value="subject"  ${condition == "subject" ? "selected='selected'" : ""} >중요문서</option>
								</select> 
							<button type="button" class="btn" onclick="" style="margin-right: 10px;">이동</button>
							<button type="button" class="btn" onclick="">다운로드</button>
						</td>
						
						<td align="right">
						  <form name="searchForm" action="${pageContext.request.contextPath}/approval/list" method="post">
						    <select name="condition" class="form-select">
						      <option value="all" ${condition == "all" ? "selected='selected'" : ""}>전체</option>
						      <option value="draft_date" ${condition == "draft_date" ? "selected='selected'" : ""}>등록일</option>
						      <option value="doc_name" ${condition == "doc_name" ? "selected='selected'" : ""}>제목</option>
						      <option value="draft_content" ${condition == "draft_content" ? "selected='selected'" : ""}>내용</option>
						    </select>
						    <input type="text" name="keyword" value="${keyword}" class="form-control">
						    <button type="button" class="btn" onclick="searchList();">검색</button>
						    <!-- 
						    <input type="hidden" name="condition" value="${condition}">
						    <input type="hidden" name="keyword" value="${keyword}">
						    <input type="hidden" name="size" value="${size}">
						     -->
						  </form>
						</td>
					</tr>
				</table>
			 </div>
			<div>
			<div style="margin-bottom: 10px;">
		       	${dataCount}개(${page}/${total_page} 페이지)
			</div>
			
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th width="5%;">
							<input type="checkbox" name="chkAll" value="all"> 
						</th> 
						<th> 문서번호 </th>
						<th> 문서종류 </th>
						<th width="35%;"> 제목 </th>
						<th> 작성자 </th>
						<th> 기안일 </th>
						<th> 문서상태 </th>
						<th> 긴급여부</th>
		 
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>
								<input type="checkbox" name="" value="">
							</td>					
							<td>${dto.doc_no}</td>
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td>
								<a href="${articleUrl}&doc_no=${dto.doc_no}&size=${size}">${dto.doc_name}</a>
							</td>
							<td>${sessionScope.member.emp_name}</td>
							<td>${dto.draft_date}</td>
							<c:choose>
								  <c:when test="${dto.doc_status == 0}">
								    <td>임시</td>
								  </c:when>
								  <c:when test="${dto.doc_status == 1}">
								    <td>발송완료</td>
								  </c:when>
								  <c:when test="${dto.doc_status == 2}">
								    <td>결재진행</td>
								  </c:when>
								  <c:when test="${dto.doc_status == 3}">
								    <td>결재완료</td>
								  </c:when>
								  <c:when test="${dto.doc_status == 4}">
								    <td>반려문서</td>
								  </c:when>
							</c:choose>
							<td>${dto.urgent == 0? '일반' : '긴급' }</td>
						</tr>
					</c:forEach>
			
				</tbody>
			</table>
				</div>
	
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
	
			</div>
		</div>
