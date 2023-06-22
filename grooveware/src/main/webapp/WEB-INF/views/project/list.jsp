<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<c:url var="listUrl" value="/project/list">
	<c:if test="${not empty keyword}">
		<c:param name="condition" value="${condition}"/>
		<c:param name="keyword" value="${keyword}"/>
	</c:if>
</c:url> 

<script type="text/javascript">
window.addEventListener("load", function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = "${listUrl}"; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector(".dataCount").innerHTML = dataCount+"개 ("
			+page+"/"+total_page+"페이지)";

	document.querySelector(".page-navigation").innerHTML = 
		dataCount === 0 ? "등록된 게시물이 없습니다." : paging;
});
</script>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="left-side-bar">
         <ul>
            <li>
                <a href="#" class="current_pj_name">현재 진행중인 프로젝트</a>
                <a href="#">&nbsp;메인으로</a>
                <a href="#">&nbsp;새 프로젝트 생성</a>
            <li>
            <hr>
            <li>
                <a href="#">&nbsp;멤버</a>
                <a href="#">&nbsp;목표</a>
                <a href="#">&nbsp;업무</a>
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>
   <div class="right-contentbody">
		
			<div class="board1">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h3><span>|</span> 진행중인 프로젝트 </h3> 
						</td>
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/project/list " method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >프로젝트 이름</option>
									<option value="pmName"  ${condition == "name" ? "selected='selected'" : ""} >PM</option>
									<option value="start_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >시작일</option>
									<option value="end_date"  ${condition == "subject" ? "selected='selected'" : ""} >종료일</option>
									<option value="client"  ${condition == "content" ? "selected='selected'" : ""} >클라이언트</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</form>
						</td>
					</tr>
				</table>
			 </div>
			<div>
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th>번호</th>
						<th width="35%;"> 프로젝트 이름 </th>
						<th> PM </th>
						<th> 시작일 </th>
						<th> 종료일 </th>
						<th> 클라이언트 </th>
						<th> 파일 </th>
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>
								<c:url var="url" value="/project/article">
									<c:param name="num" value="${dto.pj_no}"/>
									<c:param name="page" value="${page}"/>
									<c:if test="${not empty keyword}">
										<c:param name="condition" value="${condition}"/>
										<c:param name="keyword" value="${keyword}"/>
									</c:if>									
								</c:url>
								<a href="${url}" class="text-reset">${dto.pj_name}</a>
							</td>
							<td>${dto.pj_creator}</td>
							<td>${dto.pj_start_date}</td>
							<td>${dto.pj_end_date}</td>
							<td>${dto.client_name}</td>
							<td>
								<c:if test="${not empty dto.saveFilename}">
									<a href="<c:url value='/project/download?num=${dto.pj_no}'/>" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
	
			</div>


<br><br><hr><br><br><br><br>

			<div class="board1">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h3><span>|</span> 완료된 프로젝트 </h3> 
						</td>
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >프로젝트 이름</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >PM</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >시작일</option>
									<option value="subject"  ${condition == "subject" ? "selected='selected'" : ""} >종료일</option>
									<option value="content"  ${condition == "content" ? "selected='selected'" : ""} >클라이언트</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</form>
						</td>
					</tr>
				</table>
			 </div>
			<div>
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th width="35%;"> 프로젝트 이름 </th>
						<th> PM </th>
						<th> 시작일 </th>
						<th> 종료일 </th>
						<th> 클라이언트 </th>
						<th> 파일 </th>
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="n" begin="1" end="5">
						<tr>
							<td><a href=" ">'K'관공서 솔루션 개발</a></td>
							<td>한자바</td>
							<td>2022-01-01</td>
							<td>2022-12-31</td>
							<td>K관공서</td>
							<td>파일</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>

	
			</div>	
   </div>