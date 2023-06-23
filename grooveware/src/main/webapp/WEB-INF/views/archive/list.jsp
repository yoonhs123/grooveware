<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.toggle-button {
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	//모달 열기
	function openModal() {
		document.getElementById("myModal1").style.display = "block";
	}

	// 모달 닫기
	function closeModal() {
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

$(function() {
    $("#chkAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=file_no]").prop("checked", true);
        } else {
		   $("input[name=file_no]").prop("checked", false);
        }
    });
    
$("#btnDelete").click(function(){
	let cnt = $("input[name=file_no]:checked").length;
	console.log(cnt);
	if (cnt === 0) {
		alert("삭제할 파일을 선택하십쇼");
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
                <a href="${pageContext.request.contextPath}/archive/list">전사 자료실</a>
            </li>
            
            <li>
                <a href="#">개인 자료실</a>
            </li>
            
            
        </ul>
    </div>
		<div class="right-contentbody">
		
			<div class="board">
				<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" > 
							<h3><span>|</span> 전사 자료실</h3> 
							
						</td>
						<td class="title" >
							<button type="button" class="btn" onclick="openModal();" style="margin-right: 10px;">파일 업로드</button>
							<button type="button" class="btn" id="btnDelete">삭제</button>
						</td>
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >파일명</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</form>
						</td>
					</tr>
				</table>
			 </div>
			<form name="listForm" method="post">
				<table class="table table-border table-list" >
					<thead >
						<tr>
							<th width="5%;">
								<input type="checkbox" id="chkAll" value="all"> 
							</th> 
							<th> 번호 </th>
							<th width="60%;"> 파일명 </th>
							<th> 파일 크기 </th>
							<th> 업로드 날짜 </th>
			 
						</tr>
					</thead>
					
					<tbody> 
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td>
									<input type="checkbox" name="file_no" value="${dto.file_no}">
								</td>					
								<td>${(page-1) * size + status.index + 1}</td>
								<td>
									<a href="${pageContext.request.contextPath}/archive/download?file_no=${dto.file_no}">${dto.original_filename }</a>
								</td>
								<td>${dto.file_size }</td>
								<td>${dto.reg_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>
				
			</div>
		</div>
		
<!-- 모달 -->
		<div id="myModal1" class="arch-modal">
		  <div class="arch-modal-content">
			<form name="uploadForm" method="post" enctype="multipart/form-data">
			<div style="border-bottom: 1px solid #ced4da; margin-bottom: 10px;">
			    <div style="width: 100%; height: 100%;">
			    	<button type="button" class="arch-close" onclick="closeModal();">&times;</button>
			   	</div>
			   	
			   	<div style="">파일 업로드</div>
			</div>					
			   <input type="file" name="selectFile" class="form-control">
		      
		      
			<div style="padding-left : 80%;">
				<button type="button" class="btn" onclick="sendOk();">확인</button>
			</div>			
		</form>
		  </div>
		</div>	
		
		<div id="myModal" class="modal">
			  <div class="modal-content">
			    <!-- 모달 내용 -->
			    <div id="folderStructure"></div>
			    
			    <!-- 모달 닫기 버튼 -->
			    <span class="close">&times;</span>
			  </div>
		</div>



<!-- 모달창을 열기 위한 버튼 -->
<button id="modalBtn">모달 열기</button>

<!-- 모달창 -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <!-- 모달 내용 -->
    <div id="folderStructure"></div>
    
    <!-- 모달 닫기 버튼 -->
    <span class="close">&times;</span>
  </div>
</div>




	
		