<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.researchBoxForm {
	width: 100%;
	padding: 10px;
	margin: 10px;
}
.researchTitle {
	margin: 10px;
}
.researchBox-table {
	width: 100%;
}
.rBox input{
	width: 100%;
	hight: 30px;
	margin: 10px;
	padding: 10px;
}
.research_title{
	width: 100%;
}

input[type="radio"] {
	width: 16px;
	height: 16px;
	border-radius: 50%; /* 원형으로 둥글게 표현 */
}
</style>

<script type="text/javascript">
function sendOk(){
    const f = document.researchBoxForm;

	let str = f.research_title.value;
    if(!str) {
        alert("설문 제목을 입력하세요. ");
        f.research_title.focus();
        return false;
    }
    
	str = f.research_content.value;
    if(!str) {
        alert("설문 설명을 입력하세요. ");
        f.research_content.focus();
        return false;
    }

    str = f.research_startdate.value.trim();
	if(! isValidDateFormat(f.research_startdate.value)) {
		alert("설문 시작날짜를 입력하세요.");
		f.research_startdate.focus();
		return false;
	}
	
    str = f.research_enddate.value.trim();
	if(! isValidDateFormat(f.research_enddate.value)) {
		alert("설문 종료날짜를 입력하세요.");
		f.research_enddate.focus();
		return false;
	}
	

	f.action = "${pageContext.request.contextPath}/research/${mode}";
	f.submit();
}
</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
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
	<div class= "research-main" >
		<table class="table" style="margin-bottom: 20px;">
			<tr>
				<td class="title" > 
					<h3><span>|</span>&nbsp;설문작성</h3> 
				</td>
			</tr>
		</table>
		<form name="researchBoxForm" method="post"> 
			<table class="researchBox-table">		
		       <tr>
				  <td class="rBox">
					 <div class="researchTitle">
						설문 제목		
			 	 	 </div>
					 <input type="text" id="research_title" name="research_title" class="research_title" placeholder="설문 제목을 입력하세요" value="${dto.research_title}">
				  </td>		
			   </tr>
		       <tr>
				  <td class="rBox">
					 <div class="researchTitle">
						시작안내 문구		
			 	 	 </div>
					 <input type="text" id="research_content" name="research_content" class="research_content" placeholder="설문 설명을 입력하세요" value="${dto.research_content}">
				  </td>		
			   </tr>
		       <tr>
				  <td class="rBox">
					 <div class="researchTitle">
						설문시작날짜	
			 	 	 </div>
			 	 	  <input type="date" id="research_startdate" name="research_startdate" class="research_startdate" value="${dto.research_startdate}">
				  </td>		
			   </tr>
		       <tr>
				  <td class="rBox">
					 <div class="researchTitle">
						설문종료날짜	
			 	 	 </div>
					  <input type="date" id="research_enddate" name="research_enddate" class="research_enddate" value="${dto.research_enddate}">
				  </td>		
			   </tr>
		       <tr>
				  <td class="rBox">
					 <div class="researchTitle">
						공개여부	
			 	 	 </div>
			 	 	 <label>
						 <input type="radio" id="research_status" name="research_status" class="research_status" value="0" ${dto.research_status==0?"checked":"" }>
						 <span>공개</span>
					 </label>
			 	 	 <label>
						 <input type="radio" id="research_status" name="research_status" class="research_status" value="1" ${dto.research_status==1?"checked":"" }/>
						 <span>비공개</span>
					 </label>

				  </td>		
			   </tr>
			</table>	
	      	<div class = "bottom-box"> 	
		      	<div class="button-container">
		            <div style="float: right;">
		            	<button type="button"class="research-create-btn" onclick="sendOk();">${mode=='write'?'설문등록':'수정완료'}</button>
		            	<button type="reset" class="research-reset-btn">다시입력</button>
		            	<button type="button" class="research-cancel-btn" onclick="location.href='${pageContext.request.contextPath}/research/list';">${mode=='write'?'등록취소':'수정취소'}</button>     	
			      	</div>
		      	</div>	      	
			</div>
			</form>
      	</div>
      	
</div>
      	


<script type="text/javascript">

</script>
