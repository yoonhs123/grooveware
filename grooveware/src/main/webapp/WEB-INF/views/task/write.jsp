<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <style>
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
  width: 400px;
}

input[type="date"] {
  display: inline-block;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  width: 200px;
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
    .body-main .yoonhs-select {
      display: flex;
      flex-direction: column;
      font-size: 14px;
      border-radius: 4px;
      border: 1px solid #ddd;
      background-color: #fff;
      color: #333;
      outline: none;
    }

    /* 카테고리 스타일 */
    .body-main optgroup {
      display: flex;
      flex-direction: row;
      margin-right: 20px;
    }

    /* 선택지 스타일 */
    .body-main option {
      margin-bottom: 5px;
      padding: 5px;
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
      width: 30%;
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

    .modal li:nth-child(odd) {
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
    
    .dialog-emp-list ul {
		text-align: left;    
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

.modal .modal-content {
  background-color: #f2f2f2;
  margin: 10% auto;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  width: 30%;
  max-height: 80%;
  overflow-y: auto;
}

.modal th {
  background-color: #243A73;
  color: white;
}

.modal tr:nth-child(even) {
  background-color: #dfe2eb;
}

.modal td {
  padding: 10px;
  text-align: left;
  color: #333; /* 수정: 글씨 색상 연하게 설정 */
}

.modal .modal-body {
  margin-bottom: 20px; /* 수정: <h3>와 modal-body 사이 거리 벌리기 */
}

.modal table {
  width: 100%;
  border-collapse: collapse;
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
  
span.project-member:hover,
span.project-member:hover label {
  cursor: pointer;
  background-color: #f2f2f2;
}

  .project-member img {
    width: 20px;
    height: 20px;
    margin-right: 5px;
    vertical-align: middle;
  }
  
.main-table tr th {
  padding: 10px;
  width: 150px;
}  

textarea {
  height : 300px;
  resize : none;
  padding: 10px;
  border-radius: 3px;
}


</style>

<script type="text/javascript">
function sendOk() {
	 const f = document.taskinsert;
	
	 if(! f.task_name.value) {
	    	alert("제목을 입력하세요. ")
	    	f.task_name.focus
	    	return;
	    }
	    
	    if(! f.task_start_date.value) {
	    	alert("시작일을 입력하세요. ")
	    	f.task_start_date.focus
	    	return;
	    }
	    
	    
	    if(! f.task_end_date.value) {
	    	alert("종료일을 입력하세요. ")
	    	f.task_end_date.focus
	    	return;
	    }
	    
	    if(! f.task_content.value) {
	    	alert("내용을 입력하세요. ")
	    	f.task_content.focus
	    	return;
	    }
	    
	    f.action="${pageContext.request.contextPath}/task/${mode}";
	    f.submit();
}



<c:if test="${mode=='update'}">
function deleteFile(task_no) {
	if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
		return;
	}
	let url = "${pageContext.request.contextPath}/goal/deleteFile?pj_no=${dto.pj_no}&goal_no=${dto.goal_no}";
	location.href = url;
}
</c:if>


</script>



<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}



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

	<div class="board1">
		<div class="body-container">
		    <div class="body-title">
				<h2><i class="fa-solid fa-list-check"></i> 업무 요청 </h2>
		    </div>
		</div>
	

		<div class="body-main">
				
				<form name="taskinsert" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="goal_no" value="${goal_no}">
				<input type="hidden" name="pj_no" value="${pj_no}">
				.
					<table class="table table-border border-top2 table-form main-table">
						<tr>
							<th>목&nbsp;&nbsp;&nbsp;&nbsp;표</th>
							<td>${goal_name}</td>
						</tr>
						
						<tr>
							<th>요&nbsp;&nbsp;청&nbsp;&nbsp;자</th>
							<td>${sessionScope.member.emp_name}(${sessionScope.member.pos_name}_${sessionScope.member.dept_name})</td>
						</tr>
						
						<tr>
							<th>담&nbsp;&nbsp;당&nbsp;&nbsp;자</th>
							<td>
								<select name="task_member_no" class="form-select yoonhs-select">
									<c:forEach var="vo" items="${goal_member}">
										<option value="${vo.emp_no}"  ${dto.emp_no==vo.emp_no?"selected='selected'":""}>${vo.emp_name}(${vo.pos_name}_${vo.dept_name})</option>
									</c:forEach>
								</select>	
							</td>
						</tr>
						
						<tr>
							<th>업&nbsp;무&nbsp;&nbsp;제&nbsp;목</th>
							<td> 
								<input type="text" name="task_name" maxlength="100" class="form-control" value="${dto.task_name}">
							</td>
						</tr>
				
						<tr>
							<th>기&nbsp;&nbsp;&nbsp;&nbsp;간</th>
							<td> 
								<input type="date" name="task_start_date" id="start_date_input" class="form-control" value="${dto.task_start_date}"/> 
								<span>~</span>
								<input type="date" name="task_end_date" id="end_date_input" class="form-control" value="${dto.task_end_date}"/> 
							</td>
						</tr>
				
						<tr>
							<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
							<td> 
								<textarea name="task_content" class="form-control">${dto.task_content}</textarea>
							</td>
						</tr>
	
						
						
						<tr>
							<th class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</th>
							<td> 
								<input type="file" name="selectFile" class="form-control">
							</td>
						</tr>						
						
						
						<c:if test="${mode=='update'}">
							<tr>
								<th class="table-light col-sm-2" scope="row">첨부된파일</th>
								<td> 
									<p class="form-control-plaintext">
										<c:if test="${not empty dto.saveFilename}">
											<a href="javascript:deleteFile('${dto.task_no}');"><i class="fa-solid fa-trash"></i></a>
											${dto.originalFilename}
										</c:if>
										&nbsp;
									</p>
								</td>
							</tr>
						</c:if>
					</table>
					
					<table class="table">
						<tr>
							<td align="center">
								<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
								<button type="reset" class="btn">다시입력</button>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/goal/article?goal_no=${dto.goal_no}&pj_no=${dto.pj_no}';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
									<c:if test="${mode=='update'}">
									<input type="hidden" name="pj_no" value="${dto.pj_no}">
									<input type="hidden" name="goal_no" value="${dto.goal_no}">
									<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
									<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
									<input type="hidden" name="page" value="${page}">
		 							</c:if>			
							</td>
						</tr>
					</table>
				</form>
			</div>



	</div>
</div>
