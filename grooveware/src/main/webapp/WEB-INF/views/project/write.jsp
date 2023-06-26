<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.myForm .flexBox{display: flex; justify-content: space-between;}

.board5 {
	display: flex;
	justify-content: flex-end;
	padding-top : 20px;
}


.project-member {
	display: inline-block;
	width: 100px;
	height: 100px;
	border: 1px solid #333;
	padding: 3px;
}

.project-member img {
	display: block;
	width: 50px;
	height: 50px;
}
.project-member label {
	display: block;
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
</style>

<script type="text/javascript">
	<c:if test="${mode=='update'}">
	function deleteFile(file_no) {
		let url = "${pageContext.request.contextPath}/approval/deleteFile";
		$.post(url, { file_no : file_no }, function(data) {
			$("#f" + file_no).remove();
		}, "json");
	}
	</c:if>
</script>


<script type="text/javascript"> 
function sendOk() {
	const f = document.projectForm;
	let str;

	if($("#forms-emp-list input[name=emps]").length === 0) {
		alert("프로젝트 참여멤버를 추가하세요. ");
		return;
	}
	
    str = f.pj_name.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return false;
    }

	str = f.pj_content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/project/${mode}";
    f.submit();
    
}    
</script>

<script type="text/javascript"> 
$(function(){
    $("button[role='tab']").on("click", function(e){
		let tab = $(this).attr("data-tab");
		if(tab === "send") {
			return false;
		}		
		let url = "${pageContext.request.contextPath}/project/list";
		location.href=url;
    });
});
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

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
			s += "<span>" + " (" + pos_name + "_" + "</span>";
			s += "<span>" + dept_name + ")" + "</span></li>";
			$(".dialog-emp-list ul").append(s);
		}
	}
	
	// 대화상자-받는 사람 추가 버튼
	$(".btnAdd").click(function(){
		let len1 = $(".dialog-emp-list ul input[type=checkbox]:checked").length;
		let len2 = $("#forms-emp-list input[name=emps]").length;
		console.log("len1="+len1);
		console.log("len2="+len2);
		
		if(len1 === 0) {
			alert("추가할 사람을 먼저 선택하세요.");
			return false;			
		}
		
		var b, emp_no, emp_name, pos_name, dept_name, s;

		b = false;
		$(".dialog-emp-list ul input[type=checkbox]:checked").each(function(){
			emp_no = $(this).attr("data-emp_no");
			emp_name = $(this).next("span").text();
			pos_name = $(this).next("span").next("span").text();
			dept_name = $(this).next("span").next("span").next("span").text();
			
			
			$("#forms-emp-list input[name=emps]").each(function(){
				if($(this).val() === emp_no) {
					b = true;
					return false;
				}
			});
			
			if(!b) {
				s = "<span class='project-member'>";
				s += "  <img src='${pageContext.request.contextPath}/resources/images/bg.png'>";
				s += "    <label>" + emp_name + pos_name + dept_name;
				s += "    <input type='hidden' name='emps' value='" + emp_no + "'>";
				s+=  "  </label>"
				s += "</span>"
				
				$("#forms-emp-list").append(s);
			}
		});
	
		
/* 		s += "<span>" + " (" + pos_name + "_" + "</span>";
		s += "<span>" + dept_name + ")" + "</span></li>";
 */		
		
		$("#myDialogModal").hide();
	});
	
	$(".btnClose").click(function(){
		$("#myDialogModal").hide();
	});
	
	$("body").on("click", ".project-member", function(){
		$(this).remove();
		/*
		let emp_no = $(this).attr("data-emp_no");
		
		$(this).parent().remove();
		$("#forms-emp-list input[name=emps]").each(function(){
			let emp = $(this).val();
			if(emp_no === emp) {
				$(this).remove();
				return false;
			}
		});
		*/
	});
});
    

	
	
	
</script>



		<!-- 모달 -->
		<div id="myDialogModal" class="modal fade"  tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="myDialogModalLabel" aria-hidden="true">
		  <div class="modal-content">
		  	<div class="modal-header">
				<div style="border-bottom: 1px solid #ced4da; padding-bottom: 10px;"></div>
			    <span class="close">&times;</span>		<!-- 닫기버튼(x) -->
			</div>
			<div class="modal-body">
			    <h3 style="margin-bottom: 10px;">이름 검색</h3>
			  	<select name="condition" id="condition" class="form-select">
					<option value="emp_name">사원이름</option>
					<option value="emp_no">사번</option>
				</select>
			   <input type="text" name="keyword" id="keyword" placeholder="추가할 사원을 검색하세요" class="form-control" style="height: 26px;">
		       <button type="button" class="btn btn_emp_find"> 검색 </button>		<!-- 검색버튼 -->
									
				<table class="table table-border table-form">
					<tbody>
						<tr>
							<td height="50%">
							 <div style="height: 150px; border: 1px solid black;">
							 	<div class="border p-1 dialog-emp-list">
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
				<button type="button" class="btn btn-secondary btnClose">닫기</button>
			</div>
			
		  </div>
		</div>














<div class="left-side-bar">
         <ul>
            <li>
                <a href="#" class="current_pj_name">현재 진행중인 프로젝트</a>
                <a href="#">&nbsp;메인으로</a>
                <a href="${pageContext.request.contextPath}/project/write">&nbsp;새 프로젝트 생성</a>
            <li>
            <hr>
            <li>
                <a href="#">&nbsp;멤버</a>
                <a href="#">&nbsp;목표</a>
                <a href="#">&nbsp;업무</a>
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>

		<div class="right-contentbody">
				<form name="projectForm" method="post" class="myForm" enctype="multipart/form-data">
					<div class="board1">
						<div class="title_container">
							<table class="table" style="margin-bottom: 20px;">
								<tr>
									<td class="title2" width="85%">
										<h2>
											<span>|</span> 프로젝트 생성
										</h2>
									</td>
									<td class="title">
										<span>생성자 : </span> <span> ${sessionScope.member.emp_name} </span>
									</td>
								</tr>
							</table>
						</div>
						
					</div>
					<div class="pj_write">
						<div class="line_container2">
							<div>
								<div>
									<div>
										<label>제목 </label>
									</div>
									<p class="ap_pBox">
										<input type="text" name="pj_name" class="form-control1" value="${dto.pj_name}"
											style="width: 100%;">
									</p>
									<br><br><br><br>
								</div>

								<div>
								
									<div class="title2" style= width:90%>
										<span>구성멤버</span>
										<button type="button" class="btn btn_pj_add" style="margin-top: 5px;">추가</button>
									</div>	
									
									
									
									<div class="line_container" style=" height:250px;">
										<div class="table" style="margin-bottom: 15px;">
					
											<div style="width: 100%; float: left;">
												<div class="forms-emp-name">
														<!-- 여기에 멤버 추가리스트 뜸 -->							
												</div>
												<div id="forms-emp-list">
														<!-- 사진 -->
												</div>
											</div>
					
										</div>
									</div>	
	
															
									 <br><br><br><br>
									<div class="flexBox">
										<div class="leftBox"  >
											<label>프로젝트 시작일 </label>
										</div>
										<div class="leftBox">
											<label>프로젝트 종료일 </label>
										</div>
									</div>
									
									<div class="flexBox ap_pBox">
										<div class="leftBox"  >
											<input type="date" name="pj_start_date" class="form-control1" value="${dto.pj_start_date}"/> 
										</div>
										<div class="leftBox">
											<input type="date" name="pj_end_date" class="form-control1" value="${dto.pj_end_date}"/>
										</div>									
									</div>

									<br><br><br><br>
										<div class="leftBox">
											<label>내용 </label>
										</div>
										<input type="text" name="pj_content" style="display: block; width: 100%; padding: 7px 5px; height: 400px;" />${dto.content}
							
									<br><br><br><br>
										<div class="leftBox">
											<label>클라이언트 정보 </label>
										</div>
										<input type="text" name="client_name" style="display: block; width: 100%; padding: 7px 5px; height: 400px;" />
							
								</div>
								
								
									
								<br><br>
										<div>
											<div class="title3">
												<span> 첨부파일</span>
											</div>
										</div>
										<div class="file_container2">
											<div class="table table-border table-form">
												<div>
													<input type="file" name="selectFile" accept="image/*"
														multiple="multiple" class="form-control1">
												</div>
												<div>
													<div>
														<div class="img-box">
															<c:forEach var="vo" items="${listFile}">
																<img
																	src="${pageContext.request.contextPath}/ / /${vo.imageFilename}"
																	onclick="deleteFile('${vo.fileNum}');">
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
										</div>
							</div>
						</div>
					</div>



					<div class="board5">
						<button type="button" class="btn2" onclick="sendOk();">생성</button>
						<button type="button" class="btn2" style= "justify-content : flex-end" onclick="location.href='${pageContext.request.contextPath}/project/list';">취소</button>
						<div id="form-emp-list"></div>
					</div>
				</form>


</div>
