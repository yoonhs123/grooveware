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
 
input[type=text] {
    width: 200px;
    height: 26px;
}
</style>

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
			f.action = "${pageContext.request.contextPath}/note/${menuItem}/update";
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
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > 
							<h2><span><i class="fa-solid fa-file-signature"></i></span> 
								<c:choose>
								  <c:when test="${doc_status == 0}">
								    임시보관
								  </c:when>
								  <c:when test="${doc_status == 1}">
								    내문서
								  </c:when>								  
								  <c:when test="${approval_status == 1}">
								    대기 결재함
								  </c:when>
								  <c:when test="${approval_status == 2}">
								    결재 진행함
								  </c:when>	
								  <c:when test="${approval_status == 3}">
								    반려함
								  </c:when>	
								  <c:otherwise>
								  	결재 완료함
								  </c:otherwise>							  
							  
								   						  
								</c:choose>
							</h2> 
						</td>
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select-ap">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >제목+내용</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >기안자</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >등록일</option>
									<option value="subject"  ${condition == "subject" ? "selected='selected'" : ""} >제목</option>
									<option value="content"  ${condition == "content" ? "selected='selected'" : ""} >내용</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control apInput">
								<button type="button" class="btn" onclick="searchList();"  style="margin-left: 3px;">검색</button>
								<input type="hidden" name="condition" value="${condition}">
								<input type="hidden" name="keyword" value="${keyword}">			
								<input type="hidden" name="size" value="${size}">
								<input type="hidden" name="approval_status" value="${approval_status}">
							</form>
						</td>
					</tr>
				</table>
			 </div>
			<div> 

			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th> 문서번호 </th>
						<th> 문서종류 </th>
						<th width="35%;"> 제목 </th>
						<th> 기안자 </th>
						<th> 기안일 </th>
						<th> 문서상태 </th>
						<th> 긴급여부 </th>
		 
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="dto" items="${standByList}">
						<tr>
							<td>${dto.doc_no}</td>
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td style="text-align: left; padding: 0% 3% 0% 3%;">
								<a href="${articleUrl}?doc_no=${dto.doc_no}">${dto.doc_name}</a>
							</td>
							<td>${dto.emp_name}</td>
							<td>${dto.draft_date}</td>
							<c:choose>
								  <c:when test="${dto.approval_status == 1}">
								    <td>대기</td>
								  </c:when>
								  <c:when test="${dto.approval_status == 2}">
								    <td>승인</td>
								  </c:when>
								  <c:when test="${dto.approval_status == 3}">
								    <td>반려</td>
								  </c:when>
							</c:choose>
							<td>${dto.urgent == 0? '일반' : '긴급' }</td>
						</tr>
					</c:forEach>
					<c:forEach var="dto" items="${progressList}">
						<tr>
							<td>${dto.doc_no}</td>
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td>
								<a href="${articleUrl}?doc_no=${dto.doc_no}">${dto.doc_name}</a>
							</td>
							<td>${dto.emp_name}</td>
							<td>${dto.draft_date}</td>
							<c:choose>
								  <c:when test="${dto.approval_status == 1}">
								    <td>대기</td>
								  </c:when>
								  <c:when test="${dto.approval_status == 2}">
								    <td>승인</td>
								  </c:when>
								  <c:when test="${dto.approval_status == 3}">
								    <td>반려</td>
								  </c:when>
							</c:choose>
							<td>${dto.urgent == 0? '일반' : '긴급' }</td>
						</tr>
					</c:forEach>					
					<c:forEach var="dto" items="${sendBackList}">
						<tr>
							<td>${dto.doc_no}</td>
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td>
								<a href="${articleUrl}?doc_no=${dto.doc_no}">${dto.doc_name}</a>
							</td>
							<td>${dto.emp_name}</td>
							<td>${dto.draft_date}</td>
							<c:choose>
								  <c:when test="${dto.doc_status == 1}">
								    <td>대기</td>
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
					<c:forEach var="dto" items="${completionList}">
						<tr>
							<td>${dto.doc_no}</td>
							<td>${dto.draft_category == 0 ? '품의서' : '기안서'}</td>
							<td>
								<a href="${articleUrl}?doc_no=${dto.doc_no}">${dto.doc_name}</a>
							</td>
							<td>${dto.emp_name}</td>
							<td>${dto.draft_date}</td>
							<c:choose>
								  <c:when test="${dto.doc_status == 1}">
								    <td>대기</td>
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
				
							<div class="page-navigation" style="width: 900px; margin: 0 auto;">${cnt == 0 ? "등록된 게시물이 없습니다." : ""}</div>
				
			</div>
		</div>
