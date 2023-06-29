<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css"> 

<script type="text/javascript">
function sendOk(){
	const f = document.clubNoticeForm;
	let str;
	
	str = f.club_noti_title.value.trim();
	if(!str){
        alert("제목을 입력하세요. ");
        f.club_noti_title.focus();
        return false;
    }
	
	str = f.club_noti_content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/club/${club_id}/notice/${mode}";
    f.submit();
}

<c:if test="${mode=='update'}">
function deleteFile(num) {
	if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
		return;
	}
	let url = "${pageContext.request.contextPath}/club/${club_id}/notice/deleteFile?num=" + num + "&page=${page}";
	location.href = url;
}
</c:if>
</script>


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
	<div class="body-container">
		<div class="title">
			<h3>
				<span>|</span> 공지사항 작성
			</h3>
		</div>
			
		<div class="clubNotice">
		<form name="clubNoticeForm" method="post" enctype="multipart/form-data">
			<table class="table table-border table-form" >
				<tr>
					<td>제 목</td>
					<td><input type="text" name="club_noti_title" class="inputForm-control" value="${dto.club_noti_title}"></td>
				</tr>
				
				<tr>
					<td class="table-light col-sm-2" scope="row">작성자</td>
						<td>
						<p class="form-control-plaintext">${sessionScope.member.emp_name}</p>
					</td>
				</tr>
			
				<tr>
					<td class="table-light col-sm-2" scope="row">내 용</td>
					<td>
						<textarea name="club_noti_content" id="ir1" class="form-control" style="width: 93%;">${dto.club_noti_content}</textarea>
					</td>
				</tr>
				
				<tr>
					<td class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td> 
						<input type="file" name="selectFile" class="form-control">
					</td>
				</tr>
				
				<c:if test="${mode=='update'}">
					<tr>
						<td class="table-light col-sm-2" scope="row">첨부된파일</td>
						<td> 
							<p class="form-control-plaintext">
								<c:if test="${not empty dto.save_filename}">
									<a href="javascript:deleteFile('${dto.club_noti_no}');"><i class="bi bi-trash"></i></a>
									${dto.original_filename}
								</c:if>
								&nbsp;
							</p>
						</td>
					</tr>
				</c:if>

			</table>
		

			<table class="table">
				<tr>
					<td align="center">
						<button type="button" class="btn" onclick="sendOk();">${mode=="write"?"등록하기":"수정완료"}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn"
							onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/notice/list';">${mode=="write"?"등록취소":"수정취소"}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="saveFilename" value="${dto.save_filename}">
							<input type="hidden" name="originalFilename" value="${dto.original_filename}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>

		</form>
	</div>
	</div>
</div>

<script type="text/javascript">


</script>