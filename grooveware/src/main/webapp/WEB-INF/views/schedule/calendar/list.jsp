<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>






<div class="left-side-bar">
      
        <ul>
            
            <li>
                <a href="${pageContext.request.contextPath}/archive/list">캘린더</a>
            </li>
            
            <li>
                <a href="#">회의실 예약</a>
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
							<c:if test="${folder.folder_no != 1}">
								<button type="button" class="btn" onclick="goBack()">상위 폴더</button>
							</c:if>
							<button type="button" class="btn" onclick="openModal();" style="margin-right: 10px;">폴더 생성</button>
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
					<thead>
						<tr>
							<th width="5%;">
								<input type="checkbox" id="chkAll" value="all"> 
							</th> 
							<th width="60%;"> 이름 </th>
							<th> 크기 </th>
							<th> 업로드 날짜 </th>
			 
						</tr>
					</thead>
					
					<tbody>
						
						
						
							<c:if test="${folder.folder_no == 1}">
								<tr>
									<td>
										<input type="checkbox" name="nums" value="${folder.folder_no}">
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/archive/${folder.folder_no}"><i class="fa-regular fa-folder"></i>&nbsp;${folder.folder_name}</a>
									</td>
									<td>1</td>
									<td></td>
								</tr>
							</c:if>
							
						<c:forEach var="folder" items="${sub_folders}">
					    	<c:if test="${folder.getRoot_folder() != null}">
					    		<tr>
									<td>
										<input type="checkbox" name="nums" value="${folder.folder_no}">
									</td>		
									<td>
										<a href="${pageContext.request.contextPath}/archive/${folder.folder_no}"><i class="fa-regular fa-folder"></i>&nbsp;${folder.folder_name}</a>
									</td>
									<td>${dto.folder_no}</td>
									<td>2</td>
								</tr>
					    	</c:if>
					    </c:forEach>
						<c:forEach var="file" items="${sub_files}">
								<tr>
									<td>
										<input type="checkbox" name="nums" value="${file.folder_no}">
									</td>		
									<td>
										<a href="${pageContext.request.contextPath}/archive/download/${file.file_no}"><i class="fa-regular fa-file"></i>&nbsp;${file.file_name}</a>
									</td>
									<td>${file.file_size}</td>
									<td>${file.reg_date}</td>
								</tr>
								
					    </c:forEach>
					</tbody>
				</table>
			</form>
			<%-- <div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div> --%>
				
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
		      
		    <div>
		    	<span>파일 이름 :</span><input name="file_name">
		    	<input type="hidden" name="root_folder_no" value="${folder_no}">
		    </div>
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



	
		