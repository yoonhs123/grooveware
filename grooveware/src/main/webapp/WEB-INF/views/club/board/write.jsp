<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.club-board-write{
  width: 100%;
  padding: 10px;
  margin : 10px 0;
  border-spacing: 0;
}

.club-board-write td{
  padding: 15px 15px;
  border-top: 1.6px solid #c1c1c1;
}

.club-board-write-left{
  width: 17%;
  text-align: center;
  background: #f6f6f6;
}

.club-board-write input, 
.club-board-write textarea{
  width: 100%;
  padding: 10px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
}

.club-board-write textarea{
  height: 150px;
}

.club-board-wirte-btn,
.club-board-reset-btn,
.club-board-cancel-btn{
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
	const f = document.clubBoardForm;
	let str;
	
	str = f.clubboard_title.value.trim();
	if(!str){
        alert("제목을 입력하세요. ");
        f.clubboard_title.focus();
        return false;
    }
	
	str = f.clubboard_content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.clubboard_content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/club/${club_id}/board/${mode}?board_category=${board_category}";
    f.submit();
}

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
				<span>|</span>&nbsp;${club.club_name}&nbsp;${board_category==0?'가입인사':'자유게시판'}&nbsp;${mode=="write"?'작성':'수정'}
			</h3>
		</div>
			
		<div class="clubBoard">
		<form name="clubBoardForm" method="post">
			<table class="club-board-write" >
				<tr class="club-board-write-table">
					<td class="club-board-write-left">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td><input type="text" name="clubboard_title" class="inputForm-control" value="${dto.clubboard_title}"></td>
				</tr>
				
				<tr class="club-board-write-table">
					<td class="club-board-write-left" scope="row">작&nbsp;&nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;자</td>
					<td>
						<p class="form-control-plaintext">${sessionScope.member.emp_name}</p>
					</td>
				</tr>
			
				<tr class="club-board-write-table">
					<td class="club-board-write-left" scope="row" style="border-bottom: 1.6px solid #c1c1c1;">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td style="border-bottom: 1.6px solid #c1c1c1;">
						<textarea name="clubboard_content" id="ir1" class="form-control">${dto.clubboard_content}</textarea>
					</td>
				</tr>
			</table>
		

			<table class="table">
				<tr>
					<td align="center">
						<button type="button" class="club-board-wirte-btn" onclick="sendOk();">${mode=="write"?"등록하기":"수정완료"}</button>
						<button type="reset" class="club-board-wirte-btn">다시입력</button>
						<button type="button" class="club-board-wirte-btn"
							onclick="location.href='${pageContext.request.contextPath}/club/${club_id}/board/list?board_category=${board_category}';">${mode=="write"?"등록취소":"수정취소"}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
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