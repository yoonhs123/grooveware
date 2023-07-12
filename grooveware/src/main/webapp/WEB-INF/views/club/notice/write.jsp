<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.club-noti-write{
  width: 100%;
  padding: 10px;
  margin : 10px 0;
  border-spacing: 0;
}

.club-noti-write td{
  padding: 15px 15px;
  border-top: 1.6px solid #c1c1c1;
}

.club-noti-write-left{
  width: 17%;
  text-align: center;
  background: #f6f6f6;
}

.club-noti-write input, 
.club-noti-write textarea{
  width: 100%;
  padding: 10px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
}

.club-noti-write textarea{
  height: 150px;
}

.club-noti-wirte-btn,
.club-noti-reset-btn,
.club-noti-cancel-btn{
	height: 36px;
	width : 80px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #eaeaea; 
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 550;
    margin: 0 10px;
}
</style>

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

<div class="right-contentbody" >
	<div class="body-container">
		<div class="title">
			<h3>
				<span>|</span>&nbsp;${club.club_name} 공지사항 ${mode=="write"?'작성':'수정'}
			</h3>
		</div>
			
		<div class="clubNotice">
		<form name="clubNoticeForm" method="post" enctype="multipart/form-data">
			<table class="club-noti-write" >
				<tr>
					<td class="club-noti-write-left">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td>
						<input type="text" name="club_noti_title" class="inputForm-control" value="${dto.club_noti_title}">
					</td>
				</tr>

				<tr class="club-noti-write-table">
					<td class="club-noti-write-left" scope="row">작&nbsp;&nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;자</td>
					<td>
						<p class="form-control-plaintext">${sessionScope.member.emp_name}</p>
					</td>
				</tr>
			
				<tr class="club-noti-write-table">
					<td class="club-noti-write-left" scope="row">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td>
						<textarea name="club_noti_content" id="ir1" class="form-control">${dto.club_noti_content}</textarea>
					</td>
				</tr>
				
				<tr class="club-noti-write-table">
					<td class="club-noti-write-left" style="border-bottom: 1.6px solid #c1c1c1;">파&nbsp;일&nbsp;첨&nbsp;부</td>
					<td style="border-bottom: 1.6px solid #c1c1c1;"> 
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
						<button type="button" class="club-noti-wirte-btn" onclick="sendOk();">${mode=="write"?"등록하기":"수정완료"}</button>
						<button type="reset" class="club-noti-reset-btn">다시입력</button>
						<button type="button" class="club-noti-cancel-btn"
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