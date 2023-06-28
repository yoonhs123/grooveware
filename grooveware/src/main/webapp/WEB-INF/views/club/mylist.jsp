<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css"> 

<style type="text/css">

.table1 {
    width: 100%;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
	margin: auto;
}

.table2 {
    width: 100%;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
	margin: auto;
}

.table1 td {
    padding: 5px;
}

.table1 th {
    background-color: #939393;
   <!-- background-color: #333; -->
    color: #fff;
    padding: 10px;
}

.table2 td {
    padding: 10px;
    background-color: #F3F3F3;
}

.table2 th {
    background-color: #939393;
   <!-- background-color: #333; -->
    color: #fff;
    padding: 10px;
}

img {
    width: 90px;
    height: 90px;
}

</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate.js"></script>

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


</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/mylist">&nbsp;가입 커뮤니티</a>
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
			<table class="table1" style="margin-bottom: 5px;">
				<tr>
					<td class="title" > <h2><span>|</span> 내 커뮤니티</h2></td>
				</tr>
				<tr>
					<td align="right">
						<form name="searchForm" action="${pageContext.request.contextPath}/club/list " method="post">
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
				<th> 클럽 </th>
            </tr>
        </thead>
        
        <tbody>
        	<c:forEach var="dto" items="${list}" varStatus="status">
            <tr>
                <td><img src="https://i.postimg.cc/yYYd1HV1/katara.jpg" alt="img"> </td>
                <td>
					${dto.club_name}
				</td>		
                <td> ${dto.member_count} </td>
                <td> ${dto.emp_name} </td>
                <td> ${dto.club_startdate} </td>
                <td>
                    <button type="button" class="read" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
							onclick="read('${dto.club_id}')">소개</button></td>
                <td>    
					<button type="button" class="enterClub" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"
						data-club_id="${dto.club_id}">입장</button>
                </td>
            </tr>
            </c:forEach>
		</tbody>
	</table>

	<div class="page-navigation" style="width: 900px; margin: 0 auto;"></div>
	
	</div>
</div>

<div id="clubModal" style="display: none;"></div>
		