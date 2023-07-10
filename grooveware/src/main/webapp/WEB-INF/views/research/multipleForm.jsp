<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.research-Qna-Form,
.research-Qna-Form-table{
	width: 100%;
}

input[type="radio"] {
  width: 16px;
  height: 16px;
  border-radius: 50%; /* 원형으로 둥글게 표현 */
}

.research-Qna-Form {
	width: 100%;

}
.researchTitle {
	margin: 10px;
}
.research-Qna-Form-table {
	width: 100%;
}
.question_content{
	width: 100%;
	hight: 30px;
	margin: 10px;
	padding: 10px;
}

.ans_option_contents{
	width: 85%;
	hight: 30px;
	margin: 10px;
	padding: 10px;
}
.research_title{
	width: 100%;
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
.rqTitle{
	font-size: 18px;
	font-weight: 600;
	margin: 10px 10px 20px 10px;
}
.rqTitle-op{
	margin: 10px;
}
.rqBox{
	border-top: 2px solid #c1c1c1;
	padding: 15px 10px;

}

.ans_option_nums {
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
.remove-btn{
	color: black;
	border: none;
}

.Qna-create-btn,
.Qna-reset-btn,
.Qna-cancel-btn{
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

$(function(){
	$("body").on("click", ".surveySendButton", function(){
		const f = $(this).closest("form");
		
		let qs = f.serialize();
		let url = "${pageContext.request.contextPath}/research/${research_id}/multipleForm";
		const fn = function(data){
			let state = data.state;
			if(state === "true"){
				alert("질문 등록에 성공했습니다.");
			} else if(state === "false"){
				alert("질문 등록에 실패했습니다.");
			}
		};
		
		ajaxFun(url, "post" , qs, "json", fn);
	});
});
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
	        <td>${research.research_title}</td>
	      </tr>
	
	      <tr>
	        <th>설문설명</th>
	        <td>${research.research_content}</td>
	      </tr>
	
	      <tr>
	        <th>시작날짜</th>
	        <td>${research.research_startdate}</td>
	      </tr>
	
	      <tr>
	        <th>종료날짜</th>
	        <td>${research.research_enddate}</td>
	      </tr>
	
	      <tr>
	        <th style="border-bottom: 2px solid #c1c1c1;">공개여부</th>
	        <td style="border-bottom: 2px solid #c1c1c1;">${research.research_status==0?'공개':'비공개'}</td>
	      </tr>
	    </table>
		<br>
	    <table class="table2" style="margin-bottom: 20px;">
	      <tr>
	        <td class="title">
	          <h3><span>|</span>&nbsp;설문 문항 작성</h3>
	        </td>
	      </tr>
	    </table>

    <div>

      <form id="research-Qna-Form" class="research-Qna-Form" method="post">
        <table class="research-Qna-Form-table">
          <tbody class="QuestBox">
            <tr>
              <td class="rqBox">
                <div class="rqTitle">
                  질문 내용
                </div>
                <input type="text" name="question_content" class="question_content" placeholder="질문 내용을 입력하세요" value="${dto.question_content}">
              </td>
            </tr>

            <tr>
              <td class="rqBox">
                <div class="rqTitle">
                  설문 문항 타입
                </div>
                <div class="rqTitle-op" style="padding:10px 10px 10px 0;">
	                <label>
	                  <input type="radio" name="question_category" class="SurveyBox" value="0" checked/>
	                  <span>객관식</span>
	                </label>
	                	&nbsp;&nbsp;&nbsp;
	                <label>
	                  <input type="radio" name="question_category" class="SurveyBox" value="1">
	                  <span>주관식</span>
	                </label>
                </div>
              </td>
            </tr>

            <tr>
              <td class="rqBox">

                <div class="rqTitle">
                  보기
                </div>

                <div id="sbox-container">
                  <div class="rqTitle-op">
                    <input type="number" name="ans_option_nums" class="ans_option_nums" min="1" max="4" step="1" placeholder="번호">
                    <input type="text" name="ans_option_contents" class="ans_option_contents" placeholder="보기 내용을 입력하세요">
                    <button type="button" class="remove-btn" onclick="removeBox(this)">x</button>
                  </div>
                </div>

                <button type="button" class="SurveyButton" onclick="addBox()">보기 추가</button>

              </td>
            </tr>

          </tbody>
        </table>
        
       	<div class="bottom-box">
        	<div class="button-container">
          		<div style="float: right;">
            		<button type="button" class="Qna-create-btn surveySendButton">${mode=='write'?'질문등록':'수정완료'}</button>
            		<button type="reset" class="Qna-reset-btn">다시입력</button>
            		<button type="button" class="Qna-cancel-btn" onclick="location.href='${pageContext.request.contextPath}/research/list';">${mode=='write'?'등록취소':'수정취소'}</button>
				</div>
			</div>
		</div>
        
      </form>

    </div>

  </div>
  </div>
  
<script type="text/javascript">
function addBox() {
	  var container = $("#sbox-container");

	  var newBox = $("<div>").addClass("rqTitle-op");

	  var checkbox = $("<input>").attr({
		  "type": "number",
		  "name": "ans_option_nums",
		  "class": "ans_option_nums",
		  "placeholder": "번호"
	  });

	  var input = $("<input>").attr({
	    "type": "text",
	    "name": "ans_option_contents",
	    "class": "ans_option_contents",
	    "placeholder": "보기 내용을 입력하세요"
	  });

	  var button = $("<button>").attr("type", "button").addClass("remove-btn").html("x").click(function() {
	    removeBox(this);
	  });

	  newBox.append(checkbox);
	  newBox.append(input);
	  newBox.append(button);

	  container.append(newBox);
	}

	function removeBox(button) {
	  $(button).closest(".rqTitle-op").remove();
	}
</script>

