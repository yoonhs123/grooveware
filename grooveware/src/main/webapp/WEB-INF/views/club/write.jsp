<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.club-write{
  width: 100%;
  padding: 10px;
  margin : 10px 0;
  border-spacing: 0;
}

.club-write td{
  padding: 15px 15px;
  border-top: 1.6px solid #c1c1c1;
}

.club-write-left{
  width: 17%;
  text-align: center;
  background: #f6f6f6;
}

.club-write input, 
.club-write textarea{
  width: 100%;
  padding: 10px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
}

.club-write textarea{
  height: 150px;
}

.club-wirte-btn,
.club-reset-btn,
.club-cancel-btn{
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
	<div>
		<div class="title">
			<h3>
				<span>|</span>&nbsp;커뮤니티 만들기
			</h3>
		</div>
		
		<form name="clubForm" method="post">
		<div class="club">
			<table class="club-write">
				<tr class="club-write-table">
					<td class="club-write-left">커&nbsp;뮤&nbsp;니&nbsp;티&nbsp;명</td>
					<td><input type="text" name="club_name" class="inputForm-control"></td>
				</tr>
				
				<tr class="club-write-table">
					<td class="club-write-left" scope="row">운&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자</td>
					<td>
						<p class="form-control-plaintext">${sessionScope.member.emp_name}</p>
					</td>
				</tr>
				
				<tr class="club-write-table">
					<td class="club-write-left">소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개</td>
					<td><textarea name="club_content" class="form-control"
							style="height: 100px;"></textarea></td>
				</tr>
				
				<tr class="club-write-table">
					<td class="club-write-left" style="border-bottom: 1.6px solid #c1c1c1;">커&nbsp;뮤&nbsp;니&nbsp;티&nbsp;사&nbsp;진</td>
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
			</div>

			<table class="table">
				<tr>
					<td align="center">
							<button type="button" class="club-wirte-btn" onclick="sendOk();" style="margin-right: 10px">${mode=="write"?"등록하기":"수정완료"}</button>
						<button type="reset" class="club-wirte-btn" style="margin-right: 10px">다시입력</button>
						<button type="button" class="club-wirte-btn"
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