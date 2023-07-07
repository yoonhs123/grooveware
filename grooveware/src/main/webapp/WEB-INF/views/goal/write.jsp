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
  background-color: #c0c0c0;
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
    
 
   .body-main td span {
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
  background-color: #c0c0c0;
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
}

</style>
 
<script type="text/javascript">
function sendOk() {
    const f = document.goalinsert;

    
    if(! f.parent.value) {
    	alert("상위 목표를 선택하세요. ")
    	f.selectparent.focus
    	return;
    }
    
    
    if(! f.goal_name.value) {
    	alert("제목을 입력하세요. ")
    	f.goal_name.focus
    	return;
    }
    
    if(! f.goal_start_date.value) {
    	alert("시작일을 입력하세요. ")
    	f.goal_start_date.focus
    	return;
    }
    
    
    if(! f.goal_end_date.value) {
    	alert("종료일을 입력하세요. ")
    	f.goal_end_date.focus
    	return;
    }
    
    if(! f.goal_content.value) {
    	alert("내용을 입력하세요. ")
    	f.goal_content.focus
    	return;
    }
    
    
    
	if($("#forms-emp-list input[name=emps]").length === 0) {
		alert("목표 참여사원를 추가하세요. ");
		return;
	}
	
    
    f.action="${pageContext.request.contextPath}/goal/${mode}";
    f.submit();
}


<c:if test="${mode=='update'}">
function deleteFile(num) {
	if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
		return;
	}
	let url = "${pageContext.request.contextPath}/bbs/deleteFile?num=" + num + "&page=${page}";
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

<!-- 모달 -->
		<div id="myDialogModal" class="modal">
		  <div class="modal-content">
			    <span class="close">&times;</span>		<!-- 닫기버튼(x) -->
				<h3 style="color: #243A73;">구성원 추가</h3>
			
			<div class="modal-body">
			  	<select name="condition" id="condition">
					<option value="emp_name">사원이름</option>
					<option value="emp_no">사번</option>
				</select>
			   <input type="text" name="keyword" id="keyword" placeholder="추가할 사원을 검색하세요" class="form-control" style="height: 26px;">
		       <button type="button" class="btn btn_emp_find"> 검색 </button>		<!-- 검색버튼 -->
									
				<table>
					<tbody>
						<tr>
							<td height="50%">
							 <div>
							 	<div class="dialog-emp-list">
							 		<ul></ul>
							 	</div>
							 </div>
							</td>
						</tr>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnAdd">추가</button>
			</div>
			
		  </div>
		</div>    




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
            	<a href="#">&nbsp;나의 업무</a>
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
				<h2><i class="fa-solid fa-list-check"></i> 목표 추가 </h2>
		    </div>
		</div>
	<br>
			<div class="body-main">
				
				<form name="goalinsert" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="pj_no" value="${pj_no}">
									
					<table class="table table-border border-top2 table-form main-table">
						<tr>
							<th>프로젝트이름</th>
							<td>${pj_name}</td>
						</tr>
		
						<tr>
							<th>최상위목표</th>
							<td>
								<select name="parent" class="form-select yoonhs-select">
									<option value="0">최상위 목표로 설정</option>
									<optgroup>
									</optgroup>
									<optgroup label="<최상위목표>">
										<c:forEach var="vo" items="${listdepth_0}">
								      		<option value="${vo.goal_no}"  ${dto.depth==vo.depth?"selected='selected'":""}>${vo.goal_name}</option>
										</c:forEach>
									</optgroup>
								    <optgroup label="<상위목표>">
								    	<c:forEach var="vo" items="${listdepth_1}">
								      		<option value="${vo.goal_no}" ${dto.depth==vo.depth?"selected='selected'":""}>${vo.goal_name}</option>
										</c:forEach>
								    </optgroup>
							  </select>
							</td>
						</tr>

								
														
						<tr>
							<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
							<td> 
								<input type="text" name="goal_name" maxlength="100" class="form-control" value="${''}">
							</td>
						</tr>
				
						<tr>
							<th>기&nbsp;&nbsp;&nbsp;&nbsp;간</th>
							<td> 
								<input type="date" name="goal_start_date" id="start_date_input" class="form-control" value="${''}"/> 
								<span>~</span>
								<input type="date" name="goal_end_date" id="end_date_input" class="form-control" value="${''}"/> 
							</td>
						</tr>
				
						<tr>
							<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
							<td> 
								<textarea name="goal_content" class="form-control">${''}</textarea>
							</td>
						</tr>
	
						<tr>
							<th>참여사원</th>
							<td>
								<div id="forms-emp-list">
								
								<c:if test="${mode=='update'}">
									<c:forEach var="vo" items="${pj_member}" varStatus="status">
							            <span class='project-member'>
							              <i class="fa-solid fa-user-tie"></i>
							              <label>${vo.emp_name}(${vo.pos_name}_${vo.dept_name})
							              <input type="hidden" name="pj_member_no" value="${vo.pj_member_no}">
							                <c:if test="${vo.pj_member_no == dto.pj_creator}">
							                	&nbsp;<i style="color: #4048a8" class="fa-solid fa-star"></i>
							                </c:if>
											<c:if test="${vo.pj_member_no != dto.pj_creator && vo.pj_join_type == 1}">
												&nbsp;<i style="color: #4048a8" class="fa-regular fa-star"></i>
											</c:if>
							              </label>
							            </span>
							          </c:forEach>
						          </c:if>
						          
								</div>
								<button type="button" class="btn btn_pj_add" style="margin-top: 5px;">추가</button>
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
											<a href="javascript:deleteFile('${dto.num}');"><i class="fa-solid fa-trash"></i></a>
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
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/goal/list?${query}';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
									<c:if test="${mode=='update'}">
									<input type="hidden" name="pj_no" value="${dto.pj_no}">
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
    



    

<script type="text/javascript"> 

// JavaScript로 placeholder 동작 구현
var input = document.getElementById('start_date_input');
input.addEventListener('focus', function() {
  this.classList.remove('placeholder-style');
  this.placeholder = '목표시작일';
});
input.addEventListener('focus', function() {
  if (!this.value) {
    this.classList.add('placeholder-style');
    this.placeholder = '목표시작일을 선택하세요';
  }
});


var input = document.getElementById('end_date_input');
input.addEventListener('focus', function() {
  this.classList.remove('placeholder-style');
  this.placeholder = '';
});
input.addEventListener('blur', function() {
  if (!this.value) {
    this.classList.add('placeholder-style');
    this.placeholder = '목표종료일을 선택하세요';
  }
});
</script> 

    

<script type="text/javascript"> 
$(function(){
	$(".btn_pj_add").click(function(){
		$("#condition").val("emp_name");
		$("#keyword").val("");
		$(".dialog-emp-list ul").empty();
		
		$("#myDialogModal").show();
	});
	
	// 대화상자 - 받는사람 검색 버튼
	$(".btn_emp_find").click(function(){
		let condition = $("#condition").val();
		let keyword = $("#keyword").val();
		if(!keyword) {
			$("#keyword").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/project/listEmp"; 
		let query = "condition=" + condition + "&keyword=" + encodeURIComponent(keyword);
		
		const fn = function(data){
			$(".dialog-emp-list ul").empty();
			searchListEmp(data);
		};
		ajaxFun(url, "get", query, "json", fn);
	});
	
	function searchListEmp(data) {
		let s;
		for(let i=0; i<data.listEmp.length; i++) {
			let emp_no = data.listEmp[i].emp_no;
			let emp_name = data.listEmp[i].emp_name;
			let pos_name = data.listEmp[i].pos_name;
			let dept_name = data.listEmp[i].dept_name;
			
			s = "<li><input type='checkbox' class='form-check-input' data-emp_no='" + emp_no + "' title='" + emp_no+ "'> <span>" + emp_name+ "</span>"
			s += "<span>" + "(" + pos_name + "_" + "</span>";
			s += "<span>" + dept_name + ")" + "</span></li>";
			$(".dialog-emp-list ul").append(s);
		}
	}
	
	// 대화상자-받는 사람 추가 버튼
	$(".btnAdd").click(function(){
		let len1 = $(".dialog-emp-list ul input[type=checkbox]:checked").length;
		let len2 = $("#forms-emp-list input[name=emps]").length;
		
		if(len1 === 0) {
			alert("추가할 사람을 먼저 선택하세요.");
			return false;			
		}
		
		var b, emp_no, emp_name, pos_name, dept_name, s;
		let existingEmps = [];
		let preexistingEmps = [];
		
		
	
		
        $(".dialog-emp-list ul input[type=checkbox]:checked").each(function(){
            emp_no = $(this).attr("data-emp_no");
            emp_name = $(this).next("span").text();
            pos_name = $(this).next("span").next("span").text();
            dept_name = $(this).next("span").next("span").next("span").text();

            // 중복 체크
            let isDuplicate = false;
            $("#forms-emp-list input[name=emps]").each(function(){
                if($(this).val() === emp_no) {
                    isDuplicate = true;
                    return false;
                }
            });
            
            if(isDuplicate) {
                existingEmps.push(emp_name); // 중복된 경우 배열에 추가
                existingEmps.push(pos_name); // 중복된 경우 배열에 추가
                existingEmps.push(dept_name); // 중복된 경우 배열에 추가
                return true; // 중복된 경우 다음 사원으로 진행
            }

        	
    		let preisDuplicate = false;
            $("#forms-emp-list input[name=pj_member_no]").each(function(){
                if($(this).val() === emp_no) {
                    preisDuplicate = true;
                    return false;
                }
            });
            
            if(preisDuplicate) {
            	preexistingEmps.push(emp_name); // 중복된 경우 배열에 추가
            	preexistingEmps.push(pos_name); // 중복된 경우 배열에 추가
            	preexistingEmps.push(dept_name); // 중복된 경우 배열에 추가
                return true; // 중복된 경우 다음 사원으로 진행
            }
    				
            
            
            s = "<span class='project-member'>";
            s += "  <i class='fa-solid fa-user-plus'></i>";
            s += "    <label>" + emp_name + pos_name + dept_name;
            s += "    <input type='hidden' name='emps' value='" + emp_no + "'>";
            s +=  "  </label>"
            s += "</span>"

            $("#forms-emp-list").append(s);
        });

        // 중복된 emp_no가 있는 경우 알림창 표시
        if(existingEmps.length > 0) {
            let message = "이미 등록된 사원입니다: " + existingEmps.join(" ");
            alert(message);
        }
        
		
        if(preexistingEmps.length > 0) {
            let message = "기존에 등록된 사원입니다: " + preexistingEmps.join(" ");
            alert(message);
        }
        
		
		$("#myDialogModal").hide();
	});
	
	$(".btnClose").click(function(){
		$("#myDialogModal").hide();
	});
	
	$(".close").click(function(){
		$("#myDialogModal").hide();
	});
	
	
	$("body").on("click", ".project-member", function(){
		if(! confirm("해당 사원을 제외 하시겠습니까?")) {
			return false;
		}
		$(this).remove();
	});
});
</script>


<script type="text/javascript">

<c:if test="${mode=='update'}">
$(function(){
	$("body").on("click", ".project-member", function(){
		let $pj_member = $(this);			
		let pj_member_no = $pj_member.find("input[name='pj_member_no']").val();
		
		console.log(pj_member_no);
		
		let url="${pageContext.request.contextPath}/project/deleteMember?page=${page}&pj_no=" + ${dto.pj_no};
		$.post(url, {pj_member_no:pj_member_no}, function(data){
			$pj_member.remove();
		}, "json");
	});
});
</c:if>


</script>