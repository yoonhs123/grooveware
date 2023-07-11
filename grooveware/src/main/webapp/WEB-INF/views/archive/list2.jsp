<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<script type="text/javascript">
	//모달 열기
	function openModal() {
		document.getElementById("myModal").style.display = "block";
	}

	// 모달 닫기
	function closeModal() {
		document.getElementById("myModal").style.display = "none";
	}

	// 사용자가 모달 외부를 클릭할 때 모달 닫기
	window.onclick = function(event) {
		var modal = document.getElementById("myModal");
		if (event.target === modal) {
			modal.style.display = "none";
		}
	};
	//모달 열기
	function openModal1() {
		document.getElementById("myModal1").style.display = "block";
	}

	// 모달 닫기
	function closeModal1() {
		document.getElementById("myModal1").style.display = "none";
	}

	// 사용자가 모달 외부를 클릭할 때 모달 닫기
	window.onclick = function(event) {
		var modal = document.getElementById("myModal1");
		if (event.target === modal) {
			modal.style.display = "none";
		}
	};
</script>

<script type="text/javascript">
function sendOk(){

	const f = document.uploadForm;
	
	
	f.action = "${pageContext.request.contextPath}/archive/upload";
	f.submit();
}

function folder_create(){

	const f = document.createForm;
	
	var fileName = document.getElementsByName("folder_name")[0].value;
	if(fileName === "") {
	    alert("폴더명을 입력하시오");
	    return;
	}
	
	f.action = "${pageContext.request.contextPath}/archive/create";
	f.submit();
}

$(function() {
    $("#chkAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=file_no]").prop("checked", true);
		   $("input[name=folder_no]").prop("checked", true);
        } else {
		   $("input[name=file_no]").prop("checked", false);
		   $("input[name=folder_no]").prop("checked", false);
        }
    });
    
$("#btnDelete").click(function(){
	let fileCnt = $("input[name=file_no]:checked").length;
	let folderCnt = $("input[name=folder_no]:checked").length;
	if (fileCnt + folderCnt === 0) {
		alert("삭제할 폴더 및 파일을 선택하십쇼");
		return;
	}
	       
	if(confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
		const f = document.listForm;
		f.action = "${pageContext.request.contextPath}/archive/delete";
		f.submit();
	}
});   
    
});



</script>



	   




<div class="left-side-bar">
      
        <ul>
            
            <li>
                <a href="${pageContext.request.contextPath}/archive/1">전사 자료실</a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/archive/2">개인 자료실</a>
            </li>
            
            
        </ul>
    </div>
		<div class="right-contentbody">
		
			<div class="board">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" style="width:20%">
							<h2>
								<i class="fa-solid fa-floppy-disk"></i>
								${root_folderNum == '1' ? '전사 자료실' : '개인 자료실'}
							</h2> 
							
						</td>
						<td class="left" >
							<c:if test="${folder_no != '1' && folder_no != '2' }">
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/archive/${preFolder_no}'">상위 폴더</button>
							</c:if>
							<c:if test="${((root_folderNum == '1' && (sessionScope.member.dept_no == '60' || sessionScope.member.dept_no == '61' || sessionScope.member.dept_no == '62')) || root_folderNum == '2')}">
								<button type="button" class="btn" onclick="openModal1();">폴더 생성</button>
								<button type="button" class="btn" onclick="openModal();">파일 업로드</button>
								<button type="button" class="btn" id="btnDelete">삭제</button>
							</c:if>
						</td>
						
					</tr>
				</table>
			 </div>
			<form name="listForm" method="post">
				<table class="table table-border table-list" >
					<thead>
						<tr>
							<th width="10%;">
								<input type="checkbox" id="chkAll" value="all"> 
							</th> 
							<th style=" width:60%; text-align:left;"> 이름 </th>
							<th> 크기 </th>
							<th> 업로드 날짜 </th>
							<th><input type="hidden" name="root_folder" value="${folder_no}"></th>
			 
						</tr>
					</thead>
					
					<tbody>
												
							
						<c:forEach var="folder" items="${sub_folders}">
					    	<c:if test="${folder.getRoot_folder() != null}">
					    		<tr>
									<td>
										<input type="checkbox" name="folder_no" value="${folder.folder_no}">
									</td>		
									<td style="text-align:left;">
										<a href="${pageContext.request.contextPath}/archive/${folder.folder_no}?preFolder_no=${folder_no}"><i class="fa-regular fa-folder"></i>&nbsp;${folder.folder_name}</a>
									</td>
									<td></td>
									<td>${folder.reg_date}</td>
									
								</tr>
					    	</c:if>
					    </c:forEach>
						<c:forEach var="file" items="${sub_files}">
								<tr>
									<td>
										<input type="checkbox" name="file_no" value="${file.file_no}">
									</td>		
									<td style="text-align:left;">
										<a style="margin-left:20px;" href="${pageContext.request.contextPath}/archive/download/${file.file_no}"><i class="fa-regular fa-file"></i>&nbsp;${file.original_filename}</a>
									</td>
									<td>${file.file_size}</td>
									<td>${file.reg_date}</td>
									<td>
										
									</td>
								</tr>
								
					    </c:forEach>
					</tbody>
				</table>
			</form>
					    <div class="page-navigation" style="width: 900px; margin: 0 auto;">${msg}</div>
			<%-- <div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div> --%>
				
			</div>
		</div>
		
<!-- 모달 -->
		<div id="myModal" class="arch-modal">
		  <div class="arch-modal-content">
			<form name="uploadForm" method="post" enctype="multipart/form-data">
				<div style="border-bottom: 1px solid #ced4da; margin-bottom: 10px;">
				    <div style="width: 100%; height: 100%;">
				    	<button type="button" class="arch-close" onclick="closeModal();">&times;</button>
				   	</div>
				   	
				   	<div style="">파일 업로드</div>
				</div>					
				   <input type="file" name="selectFile" class="form-control">
			      
			    <div>
			    	<input type="hidden" name="root_folder" value="${folder_no}">
			    </div>
				<div style="padding-left : 80%;">
					<button type="button" class="btn" onclick="sendOk();">확인</button>
				</div>			
		</form>
		  </div>
		</div>	
		
		<div id="myModal1" class="arch-modal">
		  <div class="arch-modal-content">
			<form name="createForm" method="post">
			<div style="border-bottom: 1px solid #ced4da; margin-bottom: 10px;">
			    <div style="width: 100%; height: 100%;">
				   	<div style="">폴더 생성
				   		<button type="button" class="arch-close" onclick="closeModal1();">&times;</button>
				   		
				   	</div>
			    				   	</div>
		    </div>
			   	
		    	<span>폴더명 :</span><input name="folder_name">
		    	<input type="hidden" name="root_folder" value="${folder_no}">
			<div style="padding-left : 80%;">
				<button type="button" class="btn" onclick="folder_create();">확인</button>
			</div>			
		</form>
		  </div>
		</div>
		
		