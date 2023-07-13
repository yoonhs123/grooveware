<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.table1 {
    width: 100%;
    color: #404040;
}
.table1 td {
    padding: 5px;
}
.table2 {
    width: 100%;
    border-spacing: 0;
    text-align: center;
	margin: auto;
	color: #404040;
}
.table2 th, .table2 td {
    padding: 10px;
    border-bottom: 1px solid #c1c1c1;
}
.table2 th {
    padding: 10px;
    border-top: 2px solid #212529;
    border-bottom: 2px solid #c1c1c1;
    font-size: 16.5px;
    background-color: #f6f6f6;
}
img {
    width: 90px;
    height: 90px;
}

.search-form {
    display: flex;
    align-items: center;
    margin-top: 5px;
    margin-bottom: 5px;
}
.search-option,
.search-input {
	height: 30px;
	margin-right: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	outline: none;
}
.search-option {
    width: 100px;
    padding-left: 5px;
    color: #404040;
}
.search-input {
    width: 200px;
    padding: 5px 10px;
}
.search-button {   
	height: 30px;
	border-radius: 4px;
    padding: 5px 10px;
    background-color: #fff;
    border: 1px solid #404040;
    cursor: pointer;
    font-weight: 600;
}

.read,
.joinClub,
.enterClub {
	height: 30px;
    border: none;
	border-radius: 5px;
    padding: 5px 10px;
    font-weight: 600;
    color: #404040;
}
.read {
	background-color: #eaeaea; 
}
.joinClub {
	background-color: #73C0DE; 
}
.enterClub {
	background-color: #CEDDEF; 
}
</style>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate.js"></script>

<c:url var="listUrl" value="/club/mylist">
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

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType: dataType,
		success: function(data){
			fn(data);
		},
		beforeSend : function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR){
			if(jqXHR.status === 403){
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400){
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

// 커뮤니티 소개 - 모달
function read(club_id){
	let dlg = $("#clubModal").dialog({
		autoOpen:false,
		model:true,
		height:400,
		width:700,
		title:"커뮤니티 정보",
		close:function(event, ui){
		}
	});
	
	let url="${pageContext.request.contextPath}/club/read";
	let query="club_id="+club_id;
	
	const fn = function(data){
		console.log(data);
		$('#clubModal').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 클럽 들어가기 - 입장
$(function(){
	$(".enterClub").click(function(){
		let club_id = $(this).attr("data-club_id");
		location.href = "${pageContext.request.contextPath}/club/"+club_id+"/notice/list";
	});
});

</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;사내 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/mylist">&nbsp;가입 커뮤니티</a>
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
	
		<!-- 제목:타이틀 -->
		<div class="title_container">
		<table class="table1" style="margin-bottom: 5px;">
			<tr>
				<td class="title"> <h2><span><i class="fa-solid fa-users"></i></span>&nbsp;가입 커뮤니티</h2> 
				</td>
			</tr>
		</table>
		<table class="table1" style="margin-bottom: 5px;">
			<tr>
				<td>
					<form name="searchForm" class="search-form" action="${pageContext.request.contextPath}/club/list " method="post">
						<select name="condition" class="search-option">
							<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >커뮤니티</option>
							<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >운영자</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="search-input" placeholder="검색어를 입력하세요">
						<button type="button" class="search-button" onclick="searchList();">검색</button>
					</form>
				</td>
			</tr>
		</table>
	 </div>
	 
	 <!-- 리스트: 커뮤니티 표 -->
	 <table class="table2">
        <thead>
            <tr>
                <th colspan="2">
                	커뮤니티 
				</th> 
				<th> 회원수 </th>
				<th> 운영자 </th>
				<th> 개설일 </th>
				<th> 소개 </th>
				<th> 보기 </th>
            </tr>
        </thead>
        
        <tbody>
        	<c:forEach var="dto" items="${list}" varStatus="status">
            <tr>
                <td>
                <img src="${pageContext.request.contextPath}/uploads/insaManage/grooveware.jpg" style="width: 35%; height: 60%; object-fit: contain;'">
                </td>
                <td> ${dto.club_name} </td>		
                <td> ${dto.member_count} </td>
                <td> ${dto.emp_name} </td>
                <td> ${dto.club_startdate} </td>
                <td>
                    <button type="button" class="read" onclick="read('${dto.club_id}')">소개</button>
                </td>
                <td>    
					<button type="button" class="enterClub" data-club_id="${dto.club_id}">입장</button>
                </td>
            </tr>
            </c:forEach>
		</tbody>
	</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;"></div>
	
    </div>
</div>

<div id="clubModal" style="display: none;"></div>
    