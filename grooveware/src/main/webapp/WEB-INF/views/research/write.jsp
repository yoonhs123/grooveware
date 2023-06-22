<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
 
</script>

<div class="left-side-bar">
      
        <ul>
            <li>
                 <a href="#">설문조사</a>
                <a href="#">&nbsp;진행중인 설문조사</a>
                <a href="#">&nbsp;종료된 설문조사</a>
            <li>
            
            <hr>
          </li>
          </ul>
    </div>
 <div class="right-contentbody">	 
			<div class= "survey-main" >
			<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > <h3><span>&nbsp;&nbsp;&nbsp;</span> 설문문항작성</h3> 
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
							<button type="button" class="SurveyButton">파일첨부</button>
						  </td>		
					  </tr>
						
						
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
								  <option value="" disabled selected hidden>선택형</option>
								  <option value="항목1">항목1</option>
								  <option value="항목2">항목2</option>
								  <option value="항목3">항목3</option>
								</select>
								
								 <select required>
								  <option value="" disabled selected hidden>하나만 선택</option>
								  <option value="항목1">항목1</option>
								  <option value="항목2">항목2</option>
								  <option value="항목3">항목3</option>
								</select>
								
								
								<input type="checkbox" id="checkbox1" name="option1" value="값1">
								<label for="checkbox1">필수 답변</label>
								
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
		