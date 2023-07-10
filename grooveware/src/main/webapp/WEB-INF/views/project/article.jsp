<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <style type="text/css">
 .left-side-bar ul > li > a:first-child {
    font-weight: initial;
    padding-left : 30px;
} 

.left-side-bar ul > li > p {
    display: block;
    padding: 15px 10px 10px 30px;
    white-space: nowrap;
    font-weight: bold;
    padding-left : 20px;
}

 /* 부모 컨테이너에 플렉스를 적용하여 요소들을 세로 방향으로 정렬합니다. */
#goal_list {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

/* 각 목표 아이템을 감싸는 li 요소에 스타일을 적용합니다. */
#goal_list li {
  margin-bottom: 10px;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 5px;
}

/* 목표 이름을 감싸는 span 요소에 스타일을 적용합니다. */
#goal_list li span {
  font-weight: bold;
}

/* 목표 추가 입력 폼을 감싸는 div 요소에 스타일을 적용합니다. */
#addGoalForm {
  display: flex;
  flex-direction: column;
  margin-bottom: 10px;
}

/* 목표 추가 입력 폼의 라벨 스타일을 적용합니다. */
#addGoalForm label {
  margin-bottom: 5px;
}

/* 목표 추가 입력 폼의 버튼 스타일을 적용합니다. */
#addGoalForm button {
  margin-top: 5px;
  padding: 5px 10px;
  background-color: #e0e0e0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#addGoalForm button:hover {
  background-color: #f2f2f2;
}

/* 하위 목표 목록을 감싸는 ul 요소에 스타일을 적용합니다. */
ul[id^="subgoal_"] {
  margin-top: 5px;
  padding-left: 20px;
  list-style-type: none;
}

/* 하위 목표 아이템을 감싸는 li 요소에 스타일을 적용합니다. */
ul[id^="subgoal_"] li {
  margin: 5px 0;
}

/* 하위 목표 삭제 버튼에 스타일을 적용합니다. */
.deleteSubgoal {
  margin-left: 5px;
  padding: 2px 5px;
  background-color: #e0e0e0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.deleteSubgoal:hover {
  background-color: #f2f2f2;
}

label {
  display: inline-block;
  margin-bottom: 5px;
  font-weight: bold;
}

/* 목표 추가 입력 폼의 입력 필드 스타일을 적용합니다. */
input[type="text"] {
  display: inline-block;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  width: 200px;
  margin-bottom: 10px;
}

/* 목표 추가 버튼의 스타일을 적용합니다. */
#addGoal {
  display: inline-block;
  padding: 5px 10px;
  background-color: #e0e0e0;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#addGoal:hover {
  background-color: #f2f2f2;
}
 




 /* 수평적인 표시를 위한 스타일 */
    .yoonhs-select {
      display: flex;
      flex-direction: column;
    }

    /* 카테고리 스타일 */
    optgroup {
      display: flex;
      flex-direction: row;
      margin-right: 20px;
    }

    /* 선택지 스타일 */
    option {
      margin-bottom: 5px;
    }
    
 
   td span {
    margin: 0 5px; /* 텍스트 간격 조정 */
    font-weight: bold; /* 텍스트 굵게 표시 */
  }
  
.placeholder-style {
    color: #999;
}

.placeholder-style::placeholder {
    color: #999;
}


.table-category {
	border-spacing: 1px;
	background: #999;
	width: 100%;
}
.table-category thead>tr {
	text-align: center;
	background: #f8f9fa;
}
.table-category thead tr>th {
	color:  #787878;
	padding: 10px 0;
	background: #f2f2f2
}

.table-category tbody>tr, .table-category tfoot>tr {
	text-align: center;
	background: #fff;
	height: 30px;
}

.table-category input {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	box-sizing: border-box;
}
.table-category button {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.table-category select {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category select[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.btnCategoryAddOk, .btnSpanIcon {
	cursor: pointer;
}


  /* Added styles for project members */
  .title2 {
    width: 90%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }

  .title2 span {
    font-weight: bold;
    font-size: 18px;
  }

  .line_container {
    height: 250px;
  }

  .table {
    margin-bottom: 15px;
  }

  .forms-emp-name {
    margin-bottom: 10px;
  }

  .project-member {
    display: inline-block;
    margin-right: 10px;
    margin-bottom: 10px;
    padding: 6px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    background-color: #f8f9fa;
  }

  .project-member i {
    width: 20px;
    height: 20px;
    margin-right: 5px;
    vertical-align: middle;
  }


.pj-title {
 padding-bottom : 10px; 
}

.table {
  border-collapse: collapse;
  width: 100%;
}

.main-table tr th {
  border-right: 2px solid #e9e9e9;
  padding: 10px;
  width: 100px;
  background: #f2f2f2;
}

.main-table tr td:nth-child(2) {
	padding-left : 20px;
}

.main-table tr:last-child td {
  border-left: none;
}



.forms-emp-list {
  display: flex;
  flex-wrap: wrap;
}

.forms-emp-list > tr {
  width: 100%;
}

.forms-emp-list > tr > td {
  width: 100%;
  padding: 5px;
}


.btn-disabled {
	border: 1px solid #999999;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	font-size: 14px;
	line-height: 15px;
	background-color: #f0f0f0;
    color: gray;
    display: none;
}
 </style>
 
 
<style>
    /* 모달 스타일 */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal .modal-content {
      background-color: #f2f2f2;
      margin: 10% auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      width: 50%;
      max-height: 80%;
      overflow-y: auto;
    }

    .modal .close {
      color: #243A73;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .modal .close:hover,
    .modal .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    /* 테이블 스타일 */
    .modal table {
      width: 100%;
      border-collapse: collapse;
    }

    .modal th, .modal td {
      padding: 10px;
      text-align: left;
    }

    .modal th {
      background-color: #243A73;
      color: white;
    }


    .modal tr:nth-child(even) {
      background-color: #dfe2eb;
    }

    .modal td:first-child {
    	width: 1%;
    }
    
    .modal th:last-child {
    	text-align: center;
    }
    
    .modal td:last-child {
    	text-align: center;
    }
    
     /* Select 박스 스타일 */
    .modal select {
      padding: 5px;
      font-size: 14px;
      border-radius: 4px;
      border: 1px solid #ddd;
      background-color: #fff;
      color: #333;
      outline: none;
    }

    .modal select option {
      padding: 5px;
    }
    
     .modal-footer {
    text-align: center;
    margin-top: 20px;
    }

     .modal-footer button {
    padding: 10px 20px;
    font-size: 14px;
    border-radius: 4px;
    border: none;
    background-color: #243A73;
    color: white;
    cursor: pointer;
  }
    
</style>
   
<script type="text/javascript">
<c:if test="${pj_join_type == 0}">
	function deletePj() {
	    if(confirm("삭제하면 하위 목표까지 삭제됩니다. 프로젝트를 삭제 하시겠습니까 ? ")) {
		    let query = "pj_no=${dto.pj_no}&${query}";
		    let url = "${pageContext.request.contextPath}/project/delete?" + query;
	    	location.href = url;
	    }
	}
	
</c:if>
</script>


<script type="text/javascript">
<c:if test="${pj_join_type == 0}">
	function endPj() {
		if(confirm("프로젝트를 완료 하시겠습니까?")) {
			let query = "pj_no=${dto.pj_no}&${query}";
			let url = "${pageContext.request.contextPath}/project/endPj?" + query;
	    	location.href = url;
		}
	}
	
</c:if>
</script>


<div class="left-side-bar">
         <ul>
            <li>
            	<p>나의 프로젝트</p>
                <a href="${pageContext.request.contextPath}/project/list">&nbsp;진행중인 프로젝트</a>
                <a href="${pageContext.request.contextPath}/project/listend">&nbsp;완료된 프로젝트</a>
            <li>
            <hr>
            <li>
            	<p>메뉴</p>
            	<a href="${pageContext.request.contextPath}/task/listsend">&nbsp;요청한 업무</a>
            	<a href="${pageContext.request.contextPath}/task/listreceive">&nbsp;요청받은 업무</a>
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>


<div class="right-contentbody">
	<div class="body-container">	
		<div class="body-title pj-title">
			<h2><i class="fa-solid fa-clipboard-check"></i> 프로젝트 상세 </h2>
			
			<c:if test="${dto.pj_status == 0}">
			<span style= "float: right; padding-right: 10px;">
				<c:choose>
					<c:when test="${pj_join_type == 0}">
						<button type="button" class="btn btn-light" onclick="endPj();">마감하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn-disabled" disabled="disabled">마감하기</button>
					</c:otherwise>
				</c:choose>
			</span>
			</c:if>
		</div>
		
		<br><br>
		
		<div class="body-main">
					<table class="table table-border border-top2 table-form main-table">
						<tr>
							<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
							<td> 
								${dto.pj_name}
							</td>
						</tr>
				
						<tr>
							<th>P&nbsp;&nbsp;&nbsp;&nbsp;M</th>
							<td>${dto.emp_name}</td>
						</tr>
		
						<tr>
							<th>기&nbsp;&nbsp;&nbsp;&nbsp;간</th>
							<td> 
								${dto.pj_start_date} ~ ${dto.pj_end_date}
							</td>
						</tr>
				
						<tr>
							<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
							<td style="height : 200px;"> 
								${dto.pj_content}
							</td>
						</tr>
	
						<tr>
							<th>클라이언트</th>
							<td> 
								${dto.client_name}
							</td>
						</tr>
	
						<tr>
						  <th>참여사원</th>
						  <td>
						    <table id="forms-emp-list">
						      <tr>
						        <td style="text-align: left;">
						          <c:forEach var="vo" items="${pj_member}" varStatus="status">
						            <span class='project-member'>
						              <i class="fa-solid fa-user-tie"></i>
						              <label>${vo.emp_name}(${vo.pos_name}_${vo.dept_name})
						                <c:if test="${vo.pj_join_type == 0}">
						                	&nbsp;<i style="color: #4048a8" class="fa-solid fa-star"></i>
						                </c:if>
										<c:if test="${vo.pj_join_type == 1}">
											&nbsp;<i style="color: #4048a8" class="fa-regular fa-star"></i>
										</c:if>
						              </label>
						            </span>
						          </c:forEach>
						        </td>
						      </tr>
						    </table>
						  </td>
						</tr>
						
						<tr>
							<th class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</th>
							<td>
								<c:if test="${not empty dto.saveFilename}">
									<a href="${pageContext.request.contextPath}/project/download?pj_no=${dto.pj_no}"><i class="fa-solid fa-file-arrow-down"></i>&nbsp;&nbsp;${dto.originalFilename}</a>
								</c:if>
							</td>
						</tr>						
						
					</table>
					
					<table class="table">
						<tr>
							<td class="text-end" style= "text-align: left;">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/list?${query}';"><i class="fa-solid fa-rotate-left"></i></button>
							</td>
							
							<td width="50%" style= "text-align: right; padding-right: 10px;">
							<c:if test="${dto.pj_status == 0}">
								<c:choose>
									<c:when test="${pj_join_type == 0}">
										<button type="button" class="btn btn-light" id="modalBtn">권한변경</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn-disabled" id="modalBtn" disabled="disabled">권한변경</button>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${pj_join_type == 0}">
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/update?page=${page}&pj_no=${dto.pj_no}';">수정</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn-disabled" disabled="disabled">수정</button>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
						    		<c:when test="${pj_join_type == 0}">
						    			<button type="button" class="btn btn-light" onclick="deletePj();">삭제</button>
						    		</c:when>
						    		<c:otherwise>
						    			<button type="button" class="btn-disabled" disabled="disabled">삭제</button>
						    		</c:otherwise>
						    	</c:choose>
							</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		
		
		
		
<div id="modal" class="modal">
  <!-- 모달 내용 -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3 style="color: #243A73;">사원 목록</h3>
	<form name="accessForm" method="post">
				
	<table>
		<thead>
		    <tr>
			    <th></th>
			    <th>사원이름</th>
			    <th>직위</th>
			    <th>부서</th>
			    <th>권한</th>
			    <th>수정</th>
			</tr>
		</thead>
		<tbody>
	    	<c:forEach var="vo" items="${pj_member}" varStatus="status">
	            
				<tr>
		        	<td>
		        		<input type="hidden" name="emp_nos" value="${vo.emp_no}">
		        		<c:if test="${vo.pj_join_type == 0}">
		                	<i style="color: #4048a8" class="fa-solid fa-star"></i>
			            </c:if>
						<c:if test="${vo.pj_join_type == 1}">
							<i style="color: #4048a8" class="fa-regular fa-star"></i>
						</c:if>
		        	</td>
		            <td><i class="fa-solid fa-user-tie"></i>&nbsp;&nbsp;${vo.emp_name}</td>
		            <td>${vo.pos_name}</td>
		            <td>${vo.dept_name}</td>
					<td>
						<c:choose>	
						    <c:when test="${vo.pj_join_type == 0}">PM</c:when>
						    <c:when test="${vo.pj_join_type == 1}">매니저</c:when>
						    <c:otherwise>일반</c:otherwise>
						</c:choose>
					</td>
					<td>
						<select name="pj_join_types">
							<c:choose>
								<c:when test="${vo.pj_join_type == 0}">
									<option value="0" selected >PM</option> 
									<option value="1">매니저</option> 
									<option value="2">일반</option>
								</c:when>
								<c:when test="${vo.pj_join_type == 1}">
									<option value="0">PM</option> 
									<option value="1" selected >매니저</option> 
									<option value="2">일반</option>
								</c:when>
								<c:otherwise>
									<option value="0">PM</option> 
									<option value="1">매니저</option> 
									<option value="2" selected >일반</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
				</tr>
	    	</c:forEach>
		</tbody>
	</table>
	
	<div class="modal-footer">
		<input type="hidden" name="pj_no" value="${dto.pj_no}">
		<input type="hidden" name="page" value="${page}">
		<input type="hidden" name="size" value="${size}">
		
		<button type="button" onclick="changeOk();">변경하기</button>
	</div>

		</form>
  </div>
</div>
		
		
		
		
<script type="text/javascript">
<c:if test="${pj_join_type == 0}">
// 모달 요소 가져오기
	var modal = document.getElementById("modal");
	
	// 모달 버튼 가져오기
	var modalBtn = document.getElementById("modalBtn");
	
	// 모달 닫기 버튼 가져오기
	var closeBtn = document.getElementsByClassName("close")[0];

//모달 버튼 클릭 시 모달 열기
modalBtn.onclick = function() {
  modal.style.display = "block";
};

// 모달 닫기 버튼 클릭 시 모달 닫기
closeBtn.onclick = function() {
  modal.style.display = "none";
};

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};
</c:if>
</script>



<script type="text/javascript">
<c:if test="${pj_join_type == 0}">
function changeOk() {
	const f = document.accessForm;	
	
	if( ! confirm("구성원의 권한을 변경하시겠습니까?") ) {
		return;
	}

	f.action="${pageContext.request.contextPath}/project/access";
    f.submit();
}
</c:if>
</script>