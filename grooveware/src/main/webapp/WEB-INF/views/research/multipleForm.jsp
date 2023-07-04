<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
  
 function addQuestBox() {
    var questBox = document.querySelector('.QuestBox');

    var newRow = document.createElement('tr');

    var newTd = document.createElement('td');
    newTd.classList.add('sBox');

    var surveyTitle = document.createElement('div');
    surveyTitle.classList.add('SurveyTitle');
    surveyTitle.textContent = '질문';

    var qBox = document.createElement('input');
    qBox.type = 'text';
    qBox.classList.add('qBox');

    newTd.appendChild(surveyTitle);
    newTd.appendChild(qBox);

    newRow.appendChild(newTd);

    questBox.appendChild(newRow);
    
    var sBox = document.querySelector('.sBox');

    var surveyTitle = document.createElement('div');
    surveyTitle.classList.add('SurveyTitle');
    surveyTitle.textContent = '설문 문항 타입';

    var selectBox = document.createElement('select');
    selectBox.required = true;

    var defaultOption = document.createElement('option');
    defaultOption.value = '';
    defaultOption.disabled = true;
    defaultOption.selected = true;
    defaultOption.hidden = true;
    defaultOption.textContent = ':: 옵션 ::';

    var option1 = document.createElement('option');
    option1.value = '객관식형';
    option1.textContent = '객관식형';

    var option2 = document.createElement('option');
    option2.value = '주관식형';
    option2.textContent = '주관식형';

    selectBox.appendChild(defaultOption);
    selectBox.appendChild(option1);
    selectBox.appendChild(option2);

    sBox.appendChild(surveyTitle);
    sBox.appendChild(selectBox);
    
    questBox.appendChild(newRow);
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
						<td class="title" > <h3><span>|</span><span>&nbsp;&nbsp;</span> 설문문항작성</h3> 
						</td>
					</tr>
			</table>
			
			 <div class= "top-box"> 
				<table class = "SurveyTable">		
				       <tr>
							<td class="sBox">
								<div class="SurveyTitle">
									시작안내 문구			
						 	 	</div>
								<input type="text" class="SurveyBox">
						  </td>		
					  </tr>
				</table>
			 
				<table>	
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
								<select required>
								  <option value="" disabled selected hidden>:: 옵션:: </option>
								  <option value="객관식형">객관식형</option>
								  <option value="주관식형">주관식형</option>
								</select>
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
					<button class="questButton" onclick="addQuestBox()">질문/답변 추가</button>
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

		