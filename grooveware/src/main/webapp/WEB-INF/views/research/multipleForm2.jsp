<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.reseach-Form{
	width: 100%;
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

<script>

function addBox(button) {
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
	  // 새로운 reseach-Form 테이블 요소 생성
	  var newTable = document.createElement("table");
	  newTable.classList.add("reseach-Form");

	  // 새로운 테이블 내용 생성
	  var tbody = document.createElement("tbody");
	  tbody.classList.add("QuestBox");

	  var tr1 = document.createElement("tr");
	  var td1 = document.createElement("td");
	  td1.classList.add("sBox");
	  var surveyTitle1 = document.createElement("div");
	  surveyTitle1.classList.add("SurveyTitle");
	  surveyTitle1.textContent = "질문";
	  var input1 = document.createElement("input");
	  input1.setAttribute("type", "text");
	  input1.classList.add("qBox");
	  td1.appendChild(surveyTitle1);
	  td1.appendChild(input1);
	  tr1.appendChild(td1);

	  var tr2 = document.createElement("tr");
	  var td2 = document.createElement("td");
	  td2.classList.add("sBox");
	  var surveyTitle2 = document.createElement("div");
	  surveyTitle2.classList.add("SurveyTitle");
	  surveyTitle2.textContent = "설문 문항 타입";
	  var select = document.createElement("select");
	  select.setAttribute("required", true);
	  var option1 = document.createElement("option");
	  option1.setAttribute("value", "");
	  option1.setAttribute("disabled", true);
	  option1.setAttribute("selected", true);
	  option1.setAttribute("hidden", true);
	  option1.textContent = ":: 옵션::";
	  var option2 = document.createElement("option");
	  option2.setAttribute("value", "객관식형");
	  option2.textContent = "객관식형";
	  var option3 = document.createElement("option");
	  option3.setAttribute("value", "주관식형");
	  option3.textContent = "주관식형";
	  select.appendChild(option1);
	  select.appendChild(option2);
	  select.appendChild(option3);
	  td2.appendChild(surveyTitle2);
	  td2.appendChild(select);
	  tr2.appendChild(td2);

	  var tr3 = document.createElement("tr");
	  var td3 = document.createElement("td");
	  td3.classList.add("sBox");
	  var surveyTitle3 = document.createElement("div");
	  surveyTitle3.classList.add("SurveyTitle");
	  surveyTitle3.textContent = "보기";
	  var sboxContainer = document.createElement("div");
	  sboxContainer.setAttribute("id", "sbox-container");
	  var scBox = document.createElement("div");
	  scBox.classList.add("scBox");
	  var checkbox = document.createElement("input");
	  checkbox.setAttribute("type", "checkbox");
	  checkbox.classList.add("round-checkbox");
	  var input2 = document.createElement("input");
	  input2.setAttribute("type", "text");
	  input2.classList.add("scBox-input");
	  input2.setAttribute("placeholder", "문항 입력");
	  var removeBtn = document.createElement("button");
	  removeBtn.classList.add("remove-btn");
	  removeBtn.setAttribute("onclick", "removeBox(this)");
	  removeBtn.textContent = "x";
	  scBox.appendChild(checkbox);
	  scBox.appendChild(input2);
	  scBox.appendChild(removeBtn);
	  sboxContainer.appendChild(scBox);
	  td3.appendChild(surveyTitle3);
	  td3.appendChild(sboxContainer);
	  var addBoxBtn = document.createElement("button");
	  addBoxBtn.classList.add("SurveyButton");
	  addBoxBtn.setAttribute("onclick", "addBox(button)");
	  addBoxBtn.textContent = "문항 추가";
	  td3.appendChild(addBoxBtn);
	  tr3.appendChild(td3);

	  tbody.appendChild(tr1);
	  tbody.appendChild(tr2);
	  tbody.appendChild(tr3);
	  newTable.appendChild(tbody);

	  // reseach-Form 테이블을 추가할 위치 요소 가져오기
	  var container = document.querySelector(".QuestBox");

	  // 새로운 reseach-Form 테이블 추가
	  container.appendChild(newTable);
 }
 
</script>
		