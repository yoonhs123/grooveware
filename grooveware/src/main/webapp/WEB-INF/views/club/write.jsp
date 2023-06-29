<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" type="text/css"> 

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/mylist">&nbsp;가입 커뮤니티</a>
         <li>
         
         <li>
             <a href="#">설문조사</a>
             <a href="#">&nbsp;설문리스트</a>
             <a href="#">&nbsp;진행중인 설문</a>
             <a href="#">&nbsp;마감된 설문</a>
         <li>
     </ul>
</div>

<div class="right-contentbody" >
	<div>
		<div class="title">
			<h3>
				<span>|</span> 커뮤니티 만들기
			</h3>
		</div>
		
		<form name="clubForm" method="post">
		<div class="club">
			<table class="table table-border table-form">
				<tr>
					<td style="width:20%">커뮤니티명</td>
					<td><input type="text" name="club_name" class="inputForm-control"></td>
				</tr>
				<tr>
					<td style="width:20%; text-align=center; valign= top;" >소개</td>
					<td><textarea name="club_content" class="form-control"
							style="height: 100px;"></textarea></td>
				</tr>
				<tr>
					<td style="width:20%" valign="top">커뮤니티 사진</td>
					<td><textarea name="club_picture" class="form-control"
							style="height: 100px;"></textarea></td>
				</tr>

				</table>
			</div>

			<table class="table">
				<tr>
					<td align="center">
							<button type="button" class="btn" onclick="sendOk();" style="margin-right: 10px">${mode=="write"?"등록하기":"수정완료"}</button>
						<button type="reset" class="btn" style="margin-right: 10px">다시입력</button>
						<button type="button" class="btn"
								onclick="location.href='${pageContext.request.contextPath}/club/list';">${mode=="write"?"등록취소":"수정취소"}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="club_id" value="${dto.club_id}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>

		</form>

	</div>
</div>
	
<script type="text/javascript">
function sendOk(){
	const f = document.clubForm;
	let str;
	
	str = f.club_name.value.trim();
	if(!str){
		alert("커뮤니티명을 입력하세요.");
		f.club_name.focus();
		return;
	}
	
    str = f.club_content.value.trim();
    if(!str) {
        alert("커뮤니티 소개를 입력하세요. ");
        f.club_content.focus();
        return;
    }
    
	f.action = "${pageContext.request.contextPath}/club/${mode}";
	f.submit();
}

</script>