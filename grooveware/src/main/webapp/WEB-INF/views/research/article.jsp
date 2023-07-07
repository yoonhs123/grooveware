<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.reseach-Form{
	width: 100%;
}

input[type="radio"] {
  width: 16px;
  height: 16px;
  border-radius: 50%; /* 원형으로 둥글게 표현 */
}
</style>

<script type="text/javascript">
function removeBox(button) {
    const box = button.parentNode;
    const container = box.parentNode;
    container.removeChild(box);
};

function addBox() {
    const container = document.getElementById('sbox-container');

    const newBox = document.createElement('div');
    newBox.className = 'scBox';

    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.className = 'round-checkbox';

    const boxInput = document.createElement('input');
    boxInput.type = 'text';
    boxInput.className = 'scBox-input';
    boxInput.placeholder = '문항 입력';

    const removeBtn = document.createElement('button');
    removeBtn.className = 'remove-btn';
    removeBtn.innerText = 'x';
    removeBtn.onclick = function () {
      removeBox(this);
    };

    newBox.appendChild(checkbox);
    newBox.appendChild(boxInput);
    newBox.appendChild(removeBtn);

    container.appendChild(newBox);
};

</script>

<div class="left-side-bar">
     <ul>
         <li>
             <a href="${pageContext.request.contextPath}/club/list">커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/list">&nbsp;전체 커뮤니티</a>
             <a href="${pageContext.request.contextPath}/club/mylist">&nbsp;가입 커뮤니티</a>
         <li>
         
         <li>
             <a href="${pageContext.request.contextPath}/research/list">설문조사</a>
             <a href="${pageContext.request.contextPath}/research/list">&nbsp;설문리스트</a>
             <a href="#">&nbsp;진행중인 설문</a>
             <a href="#">&nbsp;마감된 설문</a>
         <li>
     </ul>
</div>

 <div class="right-contentbody">	 
	<div class= "survey-main" >
		<table class="table" style="margin-bottom: 20px;">
			<tr>
				<td class="title" > 
					<h3><span>|</span>&nbsp;설문문항작성</h3> 
				</td>
			</tr>
		</table>
		
		<div class= "top-box"> 
		
			<table class = "SurveyTable">		
		       <tr>
				  <td class="sBox">
					 <div class="SurveyTitle">
						설문 제목		
			 	 	 </div>
					 <input type="text" class="SurveyBox" placeholder="설문 제목을 입력하세요">
				  </td>		
			   </tr>
		       <tr>
				  <td class="sBox">
					 <div class="SurveyTitle">
						시작안내 문구		
			 	 	 </div>
					 <input type="text" class="SurveyBox" placeholder="설문 설명을 입력하세요">
				  </td>		
			   </tr>
		       <tr>
				  <td class="sBox">
					 <div class="SurveyTitle">
						설문시작날짜	
			 	 	 </div>
			 	 	  <input type="date" id="meroom_resdate" name="meroom_resdate" class="SurveyBox" value="${dto.meroom_resdate}">
				  </td>		
			   </tr>
		       <tr>
				  <td class="sBox">
					 <div class="SurveyTitle">
						설문종료날짜	
			 	 	 </div>
					  <input type="date" id="meroom_resdate" name="meroom_resdate" class="SurveyBox" value="${dto.meroom_resdate}">
				  </td>		
			   </tr>
		       <tr>
				  <td class="sBox">
					 <div class="SurveyTitle">
						공개여부	
			 	 	 </div>
			 	 	 <label>
						 <input type="radio" class="SurveyBox" checked />
						 <span>공개</span>
					 </label>
			 	 	 <label>
						 <input type="radio" class="SurveyBox">
						 <span>비공개</span>
					 </label>

				  </td>		
			   </tr>
			</table>
		 
			<table class="reseach-Form">	
				 <tbody class="QuestBox">	
				   <tr>
	                 <td class="sBox">
						<div class="SurveyTitle">
							질문 		
					    </div>
						<input type="text" class="qBox">		
					  </td>		
		          </tr>
		      
		          <tr>
					<td class="sBox">
						<div class="SurveyTitle">
							설문 문항 타입
						</div>
						 <label>
							 <input type="radio" class="SurveyBox" checked />
							 <span>객관식</span>
						 </label>
				 	 	 <label>
							 <input type="radio" class="SurveyBox">
							 <span>주관식</span>
						 </label>
					 </td>		
				  </tr>

                   <tr>
						<td class="sBox">
						
						<div class="SurveyTitle">
							보기
						</div>
						
						<div id="sbox-container">
						   <div class="scBox">
							    <input type="checkbox" class="round-checkbox">
							    <input type="text" class="scBox-input" placeholder="문항  입력">
							    <button class="remove-btn" onclick="removeBox(this)">x</button>
						   </div>
						</div>
						
						<button class = "SurveyButton" onclick="addBox()">문항 추가</button>
													
						</td>
					</tr>
					
				</tbody>	
			</table>			
      	</div>
      	
      	</div>
      	
      	<div class = "bottom-box"> 	
	      	<div class="button-container">
	            <div style="float: right;">
	            	<button class="blueBtn" type="button" onclick="#">등록</button>
	            	<button class="blueBtn" type="button" onclick="#">취소</button>     	
		      	</div>
	      	</div>	      	
		</div>
</div>