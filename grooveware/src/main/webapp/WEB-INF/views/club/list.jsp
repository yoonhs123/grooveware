<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css"> 

<style type="text/css">
.clubcontent, clubcontent2{
	flex: 1;
}
.box {
	float: left;
    width: 100px; /* 박스의 너비 */
  	height: 140px; /* 박스의 높이 */
  	background-color: #f1f1f1; /* 박스의 배경색 */
  	border: 1px solid #f2f2f2; /* 박스의 테두리 */
  	padding: 20px; /* 내부 여백 */
	margin: 10px;
  	box-sizing: border-box; /* 내부 여백과 테두리를 포함한 크기 지정 */
}
.clubcontent1 {
	float: right;
    border: 1px solid #ccc;
    padding: 10px;
    margin: 10px;
    width: 400px;;
    height: 140px;
}
.clubcontent2 {
    border: 1px solid #ccc;
    padding: 10px;
    margin: 10px;
    width: 540px;
    height: 300px;
}

</style>

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

function read(club_id){
	let dlg = $("#clubModal").dialog({
		autoOpen:false,
		model:true,
		height:600,
		width:900,
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

// 가입
	// ajax json으로 가져오기(true랑 false)
$(function(){
	$(".joinClub").click(function(){
		
		if(! confirm('커뮤니티에 가입하시겠습니까 ? ')) {
			return false;
		}
		
		const f = document.clubJoinForm;
		
		let club_id = $(this).attr("data-club_id");
		f.club_id.value = club_id;
		
		f.action = "${pageContext.request.contextPath}/club/join";
		f.submit();
	});
});
	


</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="#">&nbsp;가입 커뮤니티</a>
         <li>
         
         <hr>
         
         <li>
             <a href="#">설문조사</a>
             <a href="#">&nbsp;설문리스트</a>
             <a href="#">&nbsp;진행중인 설문</a>
             <a href="#">&nbsp;마감된 설문</a>
         <li>
     </ul>
</div>
<div class="right-contentbody">
	<div class="board">
			<div class="title_container">
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<td class="title" > <h3><span>|</span> 사내 커뮤니티</h3> 
					</td>
					<td>${dataCount - (page-1) * size - status.index}</td>
					<td align="right">
						<div>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/club/write';" 
							style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;">커뮤니티 만들기</button>
						</div>
						
						<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
							<select name="condition" class="form-select">
								<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >커뮤니티</option>
								<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >운영자</option>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="keywordform-control">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</form>
					</td>
				</tr>
			</table>
		 </div>
	<table class="table table-border table-list" >
		<thead>
				<tr>
					<th style="width: 25%;">
						커뮤니티 
					</th> 
					<th> 회원수 </th>
					<th> 운영자 </th>
					<th> 개설일 </th>
					<th> 소개 </th>
					<th> 가입상태 </th>
				</tr>
		</thead>
			
		<tbody> 
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td> ${dto.club_name} </td>					
					<td> ${dto.member_count}</td>
					<td> ${dto.emp_name} </td>
					<td> ${dto.club_startdate} </td>
					<td><button type="button" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
								onclick="read('${dto.club_id}')">소개</button></td>
					<td><button type="button" class="joinClub" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
								data-club_id="${dto.club_id}">가입</button></td>
				</tr>
			</c:forEach>
		</tbody>

		</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
	
	</div>
</div>

<form name="clubJoinForm" method="post">
	<input type="hidden" name="club_id"> 
</form>

<div id="clubModal" style="display: none;"></div>
		