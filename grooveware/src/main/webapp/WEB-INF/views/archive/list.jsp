<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</script>

<script>
function sendOk(){

const f = document.uploadForm;

f.action = "${pageContext.request.contextPath}/archive/upload";
f.submit();
	
}

</script>

<div class="left-side-bar">
      
        <ul>
            <li>
            	<a href="#" style="width:100%; background: blue; text-align: center;">파일 업로드</a>
            </li> 
            
            <li>   
                <p>전사/개인 자료실 용량</p>
            </li>
            
            <li>
                <a href="#">전사 자료실</a>
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
						<td class="title" > <h3><span>|</span> 전사 자료실</h3> 
						</td>
						<td class="title" > 
							<button type="button" class="btn" onclick="openModal();" style="margin-right: 10px;">파일 업로드</button>
						</td>
						<td align="right">
							<form name="searchForm" action="${pageContext.request.contextPath}/ " method="post">
								<select name="condition" class="form-select">
									<option value="all"  ${condition == "all" ? "selected='selected'" : ""} >파일명</option>
									<option value="name"  ${condition == "name" ? "selected='selected'" : ""} >작성자</option>
									<option value="reg_date"  ${condition == "reg_date" ? "selected='selected'" : ""} >등록일</option>
								</select>
								<input type="text" name="keyword" value="${keyword}" class="form-control">
								<button type="button" class="btn" onclick="searchList();">검색</button>
							</form>
						</td>
					</tr>
				</table>
			 </div>
			
			<table class="table table-border table-list" >
				<thead >
					<tr>
						<th width="5%;">
							<input type="checkbox" name="chkAll" value="all"> 
						</th> 
						<th> 번호 </th>
						<th width="60%;"> 파일명 </th>
						<th> 파일 크기 </th>
						<th> 업로드 날짜 </th>
		 
					</tr>
				</thead>
				
				<tbody> 
					<c:forEach var="n" begin="1" end="9">
						<tr>
							<td>
								<input type="checkbox" name="" value=" ">
							</td>					
							<td>1</td>
							<td>
								<a href=" ">22년도 상반기 영업 매출의 보고</a>
							</td>
							<td>14MB</td>
							<td>2020-05-15(목) 11:30</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 1 2 3</div>
	
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
		      
		      
			<div style="padding-left : 80%;">
				<button type="button" class="btn" onclick="sendOk();">확인</button>
			</div>			
		</form>
		  </div>
		</div>	
	
	
		