<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.research-Qna-Form-table,
.research_title {
	width: 100%;
}
input[type="radio"] {
  width: 16px;
  height: 16px;
  border-radius: 50%; /* 원형으로 둥글게 표현 */
}
.research-detail-table2 th{
	background-color: #f6f6f6;
}

.research-detail-table2 th, 
.research-detail-table2 td{
	border-top: 2px solid #c1c1c1;
	border-spacing: 0;
	padding : 10px;
	text-align: center;
}

.rqBox-title{
	font-size: 18px;
	font-weight: 600;
	margin: 10px;
	padding: 10px;
	border-top: 2px solid #c1c1c1;
	border-bottom: 2px solid #c1c1c1;
}
.rqBox-content{
	font-size: 18px;
	margin: 10px;
	padding: 20px 10px;
}

.rqBox-content td{
	padding: 10px;
}

.ans_option_num {
    width: 60px;
    height: 40px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-right: 10px;
    box-sizing: border-box;
    font-size: 14px;
    outline: none;
    text-align: center;
  }

.reponse-send-btn{
	height: 32px;
	width : 70px;
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
function sendOk(research_id) {
    const f = document.responseForm;

	let str = f.multiple_choice.value;
    if(!str) {
        alert("보기을 선택하세요.");
        f.multiple_choice.focus();
        return false;
    }
    alert("제출이 완료되었습니다.");

	f.action = "${pageContext.request.contextPath}/research/open/"+research_id+"/choice";
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

<div class="right-contentbody">
  <div class="survey-main">

	    <table class="research-detail-table1" style="margin-bottom: 20px;">
	      <tr>
	        <td class="title">
	          <h3><span>|</span>&nbsp;설문 상세 정보</h3>
	        </td>
	      </tr>
	    </table>

	    <table class ="research-detail-table2">
	      <tr>
	        <th>설문제목</th>
	        <td>${dto.research_title}</td>
	      </tr>
	
	      <tr>
	        <th>설문설명</th>
	        <td>${dto.research_content}</td>
	      </tr>
	
	      <tr>
	        <th>시작날짜</th>
	        <td>${dto.research_startdate}</td>
	      </tr>
	
	      <tr>
	        <th>종료날짜</th>
	        <td>${dto.research_enddate}</td>
	      </tr>
	
	      <tr>
	        <th style="border-bottom: 2px solid #c1c1c1;">공개여부</th>
	        <td style="border-bottom: 2px solid #c1c1c1;">
	        	${dto.research_status == 0 ?' 공개' : '비공개'}
            </td>
	      </tr>
	    </table>
	    
		<br>
		
	    <table class="table2" style="margin-bottom: 20px;">
	      <tr>
	        <td class="title">
	          <h3><span>|</span>&nbsp;설문 문항 정보</h3>
	        </td>
	      </tr>
	    </table>

    <div>

		<form name="responseForm" method="post">
	        <table class="research-Qna-Form-table">
	          <tbody class="QuestBox">
	            <tr class="rqBox">
	            	<td colspan="2" class="rqBox-title">
	             		 질문
	             	 </td>
				</tr>
				<tr>
					<td colspan="2" class="rqBox-content">
	              		${dto.question_no} <span>|</span> ${dto.question_content}
	              		<input type="hidden" name="question_no" value="${dto.question_no}">
	                </td>
	            </tr>
	            <tr class="rqBox-op">
	            	<td colspan="2"  class="rqBox-title">
	           			보기
	           		</td>
	           	</tr>
	
				<c:forEach var="vo" items="${list}" varStatus="status">
		            <tr class="rqBox-content">
		            	<td colspan="2">
		                  <input type="radio" name="multiple_choice" class="multiple_choice" value="${status.count}">
		                  ${vo.ans_option_content}
						</td>
					
		            </tr>
				</c:forEach>
				<tr>
					<td>
						<button type="button" class="reponse-send-btn" onclick="sendOk('${dto.research_id}');">응답제출</button>
					</td>
				</tr>
	          </tbody>
	        </table>   
        </form>
    </div>
  </div>
  </div>
