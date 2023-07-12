<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<style type="text/css">
 

 
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
    width: 200px;
    height: 26px;
    
}
div.board1 .numbering {
	font-size : 10px;
	color : #BDBDBD;
}

div.board1 .sort_numbering {
	color : #BDBDBD;
}


</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	
	f.submit();
}
</script>
<script type="text/javascript">

$(function() {
    $("#chkAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=doc_no]").prop("checked", true);
        } else {
		   $("input[name=doc_no]").prop("checked", false);
        }
    });
 
    $(".btnMove").click(function(){
		let cnt = $("input[name=doc_no]:checked").length;

		if (cnt === 0) {
			alert("이동할 문서를 선택하세요");
			return;
		}
         
		if(confirm("선택한 문서를 이동하시겠습니까 ? ")) {
			const f = document.listForm;
			f.action = "${pageContext.request.contextPath}/approval/updateList";
			f.submit();
		}
	});
});

</script> 

<div class="left-side-bar">
      
        <ul>
		<li>
			<a href="${pageContext.request.contextPath}/approval/write">문서작성</a>
		</li>       
        
            <li>
                <a>문서함</a>
                <a href="${pageContext.request.contextPath}/approval/list?doc_status=1">&nbsp;내 문서</a>
                <c:if test="${sessionScope.member.pos_no== 2}">
                <a href="${pageContext.request.contextPath}/approval/deptList">&nbsp;부서 문서</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/approval/list?doc_status=0">&nbsp;임시보관 문서</a>
                <a href="${pageContext.request.contextPath}/approval/importantList?important=1">&nbsp;중요 문서</a>
            <li>
            
            
            <li>
                <a>결재함</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/1">&nbsp;대기문서</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/2">&nbsp;진행중 문서</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/3">&nbsp;반려문서</a>
				<a href="${pageContext.request.contextPath}/approval/approvalListByStatus/4">&nbsp;완료문서</a>
            <li>
        </ul>
    </div>
		<div class="right-contentbody">
		
			<div class="board1">
			<form name="listForm" action="${pageContext.request.contextPath}/approval/list" method="post">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > 
							<h2><i class="fa-solid fa-file-signature"></i> 
								<c:choose>
								  <c:when test="${doc_status == 0}">
								    임시보관
								  </c:when>
								  <c:when test="${doc_status == 1}">
								    내문서
								  </c:when>								  
								  <c:when test="${important == 1}">
								    중요문서
								  </c:when>	
								  <c:otherwise>
								  	부서문서
								  </c:otherwise>											  
								</c:choose>
							</h2> 
						</td>
						<td class="title">
						    <select name="condition" class="form-select-ap search-option">
						        <option value="all" ${condition == "all" ? "selected='selected'" : ""}>내문서</option>
						        <option value="name" ${condition == "name" ? "selected='selected'" : ""}>부서문서</option>
						        <option value="important" ${condition == "important" ? "selected='selected'" : ""}>중요문서</option>
						    </select>
						    <button type="button" class="btn btnMove" style="margin-right: 10px;">이동</button>
						    <button type="button" class="btn" onclick="">다운로드</button>
						</td>
												
						<td align="right">
						    <select name="condition" class="form-select-ap">
						      <option value="all" ${condition == "all" ? "selected='selected'" : ""}>전체</option>
						      <option value="draft_date" ${condition == "draft_date" ? "selected='selected'" : ""}>등록일</option>
						      <option value="doc_name" ${condition == "doc_name" ? "selected='selected'" : ""}>제목</option>
						      <option value="draft_content" ${condition == "draft_content" ? "selected='selected'" : ""}>내용</option>
						    </select>
						    <input type="text" name="keyword" value="${keyword}" class="form-control apInput">
						    <button type="button" class="btn" onclick="searchList();" style="margin-left: 3px;">검색</button>
						    <!-- 
						    <input type="hidden" name="condition" value="${condition}">
						    <input type="hidden" name="keyword" value="${keyword}">
						    <input type="hidden" name="size" value="${size}">
						     -->
						
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
							<input type="checkbox" name="chkAll"  id="chkAll" value="all" > 
						</th> 
						<th class="sort_numbering"> <i class="fa-solid fa-sort-down" style="vertical-align: text-top;"></i> </th>
						<th> 문서종류 </th>
						<th width="35%;"> 제목 </th>
						<th> 작성자 </th>
						<c:choose>
						  <c:when test="${doc_status == 0}">
							   <th> 작성일 </th>
						  </c:when>
						  <c:otherwise>
								<th> 기안일 </th>
  						  </c:otherwise>											  
					    </c:choose>						
						<th> 문서상태 </th>
						<th> 긴급여부</th>
		 
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="dto" items="${list}"  varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="doc_no" value="${dto.doc_no}" >
							</td>		
							<td class="sort_numbering">${dataCount - (page-1) * size - status.index}</td>
										
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td style="text-align: left; padding: 0% 3% 0% 3%;">
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
								    <td>반려</td>
								  </c:when>
							</c:choose>
							<td>${dto.urgent == 0? '일반' : '긴급' }</td>
						</tr>
					</c:forEach>
					<c:forEach var="dto" items="${deptList}"  varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="doc_no" value="${dto.doc_no}">
							</td>					
							<td class="sort_numbering">${dataCount - (page-1) * size - status.index}</td>
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td style="text-align: left; padding: 0% 3% 0% 3%;">
								<a href="${articleUrl}&doc_no=${dto.doc_no}&size=${size}">${dto.doc_name}</a>
							</td>
							<td>${dto.doc_emp_name}</td>
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
								    <td>반려</td>
								  </c:when>
							</c:choose>
							<td>${dto.urgent == 0? '일반' : '긴급' }</td>
						</tr>
					</c:forEach>			
				</tbody>
			</table>
				</div>
	  </form>
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
	
			</div>
		</div>
