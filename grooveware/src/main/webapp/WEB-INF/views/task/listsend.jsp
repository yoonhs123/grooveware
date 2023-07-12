<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style type="text/css">
 
.left-side-bar ul > li > a:first-child {
    font-weight: initial;
    padding-left : 30px;
} 

.left-side-bar ul > li > p {
    display: block;
    padding: 15px 10px 10px 30px;
    white-space: nowrap;
    font-weight: bold;
    padding-left : 20px;
}
 
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

.btn:hover {
	background-color: #f2f2f2;
}


input[type="text"] {
  display: inline-block;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  width: 300px;

}

.form-select{ height: 26px; margin-right: 10px; border-radius: 4px;}


.title_container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}



.table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.table th,
.table td {
  padding: 10px;
  border-bottom: 1px solid #ccc;
  text-align: center;
  font-size: 16px;
}

.table th {
  font-weight: bold;
  background-color: #f2f2f2;
}

.table .left {
  position: relative;
}

.table .text-reset {
  text-decoration: none;
  color: #333;
}

.table .text-reset:hover {
  text-decoration: none;
  color: #4048a8; 
}


.keyword_left {

	justify-content : flex-end;
}


div.board1 .title_left {
	text-align : left;
}


div.board1 .numbering {
	font-size : 10px;
	color : #BDBDBD;
}

div.board1 .sort_numbering {
	color : #BDBDBD;
}




.pj {
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
  top: 10px;
  text-align: center;
}

.no_pj_img {
  margin-bottom: 20px;
}

.no_pj_alert {
  font-size: 30px;
  font-weight: bold;
  padding: 20px;
  color: #243A73; 
}

.no_pj_ment {	
  font-size: 15px;
  padding-top: 30px;
  color: #4a587d;
}

.no_pj_button {
  padding: 20px;
}

.no_pj_button button {
  background-color: #c0cded; 
  font-size: 20px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.no_pj_button button:hover {
  background-color: #243A73; 
}

.main-table tr td {
  padding: 10px;
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
            	<p>나의 프로젝트</p>
                <a href="${pageContext.request.contextPath}/project/list">&nbsp;진행중인 프로젝트</a>
                <a href="${pageContext.request.contextPath}/project/listend">&nbsp;완료된 프로젝트</a>
            <li>
            <hr>
            <li>
            	<p>메뉴</p>
            	<a href="${pageContext.request.contextPath}/task/listsend">&nbsp;요청한 업무</a>
            	<a href="${pageContext.request.contextPath}/task/listreceive">&nbsp;요청받은 업무</a>
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>

<c:if test="${dataCount == 0 && keyword == '' }">
<div class="right-contentbody">
	<div class="pj">
		<div class="no_pj_img">
			<p><i class="fa-solid fa-file-circle-question" style="font-size: 150px;"></i></p>
		</div>
		
		<div class="no_pj_alert">
			<p>요청한 업무가 없습니다.</p>
		</div>
		
	</div>
</div>
</c:if>


<c:if test="${dataCount != 0 || keyword != ''}">
   <div class="right-contentbody">
		
			<div class="board1">
				<div class="title_container">
						<div class="project"><h2><i class="fa-solid fa-toggle-on"></i> 요청한 업무 </h2></div>
						<div class="keyword_left">
							<form name="searchForm" action="${pageContext.request.contextPath}/task/listsend" method="post">
								<select name="condition" class="form-select">
									<option value="task_name"  ${condition == "task_name" ? "selected='selected'" : ""} >업무 이름</option>
									<option value="goal_name"  ${condition == "goal_name" ? "selected='selected'" : ""} >해당 업무</option>
									<option value="doing"  ${condition == "doing" ? "selected='selected'" : ""} >진행중인 업무</option>
									<option value="finish"  ${condition == "finish" ? "selected='selected'" : ""} >완료된 업무</option>
									<option value="task_member"  ${condition == "task_manager" ? "selected='selected'" : ""} >담당자</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button> 	
							</form>
						</div>
			 </div>
			<div>
				<div class="col-auto me-auto dataCount">
	            	${dataCount}개(${page}/${total_page} 페이지)
	            </div>
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th class="sort_numbering"><i class="fa-solid fa-sort-down"></i></th>
						<th width="20%;"> 업무 이름 </th>
						<th width="20%;"> 해당 목표 </th>	
						<th> 담당자 </th>
						<th> 시작일 </th>
						<th> 종료일 </th>
						<th> 진행상태 </th>
						<th> 파일 </th>
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td class="numbering">${dataCount - (page-1) * size - status.index}</td>
							<td class="left title_left">
								<c:if test="${dto.identify == ''}">
									<c:choose>
										<c:when test="${dto.task_name.length() > 15}">
											<a href="${articleUrl}&task_no=${dto.task_no}" class="text-reset" style="font-weight: bold;">
												${fn:substring(dto.task_name, 0, 15)}....
											</a>
										</c:when>
										<c:otherwise>
											<a href="${articleUrl}&task_no=${dto.task_no}" class="text-reset" style="font-weight: bold;">
												${dto.task_name};
											</a>
										</c:otherwise>
									</c:choose>
								</c:if>
								
								<c:if test="${dto.identify != ''}">
									<c:choose>
										<c:when test="${dto.task_name.length() > 15}">
											<a href="${articleUrl}&task_no=${dto.task_no}" class="text-reset">
												${fn:substring(dto.task_name, 0, 15)}....
											</a>
										</c:when>
										<c:otherwise>
											<a href="${articleUrl}&task_no=${dto.task_no}" class="text-reset">
												${dto.task_name}
											</a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</td>
							<td>
								<c:choose>
										<c:when test="${dto.goal_name.length() > 15}">
												${fn:substring(dto.goal_name, 0, 15)}....
										</c:when>
										<c:otherwise>
												${dto.goal_name}
										</c:otherwise>
								</c:choose>
							</td>
							<td>${dto.emp_name}(${dto.pos_name}_${dto.dept_name})</td>
							<td>${dto.task_start_date}</td>
							<td>${dto.task_end_date}</td>
							<td>${dto.identify == "" ? "진행중" : "완료" }</td>						
							<td>
								<c:if test="${not empty dto.saveFilename}">
									<a href="<c:url value='/task/download?task_no=${dto.task_no}'/>" class="text-reset"><i class="fa-solid fa-file-arrow-down"></i></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">
				${dataCount == 0 ? "검색 결과가 없습니다." : paging}
			</div>
			
			</div>

   </div>
</c:if>
