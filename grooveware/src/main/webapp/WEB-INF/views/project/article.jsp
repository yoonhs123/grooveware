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
  background-color: #c0c0c0;
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
  background-color: #c0c0c0;
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
  background-color: #c0c0c0;
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



<!-- -->
  .modal-content {
    border-radius: 10px;
  }

  .modal-header {
    border-bottom: 1px solid #ced4da;
    padding-bottom: 10px;
  }

  .modal-body {
    padding: 20px;
  }

  .modal-title {
    margin-bottom: 10px;
  }

  .form-group {
    margin-bottom: 20px;
  }

  .btn_emp_find {
    margin-top: 10px;
  }

  .emp-list {
    height: 150px;
    border: 1px solid black;
    overflow-y: auto;
    padding: 10px;
  }

  .emp-list ul {
    padding: 0;
    list-style: none;
  }

  .modal-footer {
    justify-content: flex-end;
    border-top: none;
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

  .project-member img {
    width: 20px;
    height: 20px;
    margin-right: 5px;
    vertical-align: middle;
  }


.pj-title {
 padding-bottom : 10px; 
 font-size: 30px; 
 font-weight: bold;"
}

.table {
  border-collapse: collapse;
  width: 100%;
}

.main-table tr td:first-child {
  text-align: center;
}


.main-table tr:last-child td {
  border-bottom: none;
}

.main-table tr td:first-child {
  border-right: 2px solid #e9e9e9;
  padding: 10px;
}

.main-table tr td:nth-child(2) {
	padding-left : 20px;
}

.main-table tr:last-child td {
  border-left: none;
}
 </style>


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
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>


<div class="right-contentbody">
	<div class="body-container">	
		<div class="body-title pj-title">
			<i class="fa-solid fa-clipboard-check"></i> <span>프로젝트 상세</span>
		</div>
		
		<div class="body-main">
					<table class="table table-border border-top2 table-form main-table">
						<tr>
							<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td> 
								${dto.pj_name}
							</td>
						</tr>
				
						<tr>
							<td>P&nbsp;&nbsp;&nbsp;&nbsp;M</td>
							<td>${dto.emp_name}</td>
						</tr>
		
						<tr>
							<td>기&nbsp;&nbsp;&nbsp;&nbsp;간</td>
							<td> 
								${dto.pj_start_date} ~ ${dto.pj_end_date}
							</td>
						</tr>
				
						<tr>
							<td>내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td style="height : 200px;"> 
								${dto.pj_content}
							</td>
						</tr>
	
						<tr>
							<td>클라이언트</td>
							<td> 
								${dto.client_name}
							</td>
						</tr>
	
						<tr>
							<td>참여사원</td>
							<td>
								<table id="forms-emp-list">
									<c:forEach var="dto" items="${pj_member}" varStatus="status">
										<tr>
											<td style="text-align : left;">
												<c:if test="${dto.pj_join_type == 0}"><i class="fa-solid fa-crown"></i></c:if>
												${dto.emp_name}(${dto.pos_name}_${dto.dept_name})
											</td> 
											<td>참여날짜 : ${dto.pj_member_join_date}</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
				
				
				
								<span class='project-member'>
								  <img src='${pageContext.request.contextPath}/resources/images/bg.png'>
								    <label> + emp_name + pos_name + dept_name</label>
								</span>
								
				
				
				
				
				
						
						<tr>
							<td class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
							<td>
								<c:if test="${not empty dto.saveFilename}">
										<a href="<c:url value='/project/download?project_no=${dto.pj_no}'/>" class="text-reset"><i class="fa-solid fa-file-arrow-down"></i>
										${dto.originalFilename}
										</a>
								</c:if>
							</td>
						</tr>						
						
					</table>
					
					<table class="table">
						<tr>
							<td width="50%">
								<c:choose>
									<c:when test="${sessionScope.member.emp_no==dto.pj_creator}">
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/update?num=${dto.pj_no}&page=${page}';">수정</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-light" disabled="disabled">수정</button>
									</c:otherwise>
								</c:choose>
						    	
								<c:choose>
						    		<c:when test="${sessionScope.member.emp_no==dto.pj_creator}">
						    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
						    		</c:when>
						    		<c:otherwise>
						    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
						    		</c:otherwise>
						    	</c:choose>
							</td>
							<td class="text-end">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/project/list?${query}';">리스트</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>