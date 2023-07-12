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
 
/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da;  }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

/* board */

.title { font-size: 20px; font-weight: bold; padding: 13px 0; }

.table-list thead > tr { background: #f8f9fa; }
.table-list th, .table-list td { text-align: center; }
.table-list td:nth-child(5n+2) {  padding-left: 5px; }


 
.btn {
	color: black;
	border: 1px solid #999999;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	line-height: 15px;
	background-color: white;
	
}

.btn:hover {
	background-color: #f2f2f2;
}

input[type=text]{
    width: 300px;
    height: 26px;
    
}

.form-select{ height: 26px; margin-right: 10px; border-radius: 4px;}


.title_container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}



.table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.table th,
.table td {
  padding: 10px;
  border-bottom: 1px solid #ccc;
  text-align: center;
  font-size: 16px;
}

.table th {
  font-weight: bold;
  background-color: #f2f2f2;
}

.table .left {
  position: relative;
}

.table .text-reset {
  text-decoration: none;
  color: #333;
}

.table .text-reset:hover {
  text-decoration: none;
  color: #4048a8; 
}


.keyword_left {

	justify-content : flex-end;
}


div.board1 .title_left {
	text-align : left;
}


div.board1 .numbering {
	font-size : 10px;
	color : #BDBDBD;
}

div.board1 .sort_numbering {
	color : #BDBDBD;
}



.btn-disabled {
	background-color: #f0f0f0;
    color: gray;
    pointer-events: none;
}

.pj {
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
  top: 10px;
  text-align: center;
}

.no_pj_img {
  margin-bottom: 20px;
}

.no_pj_alert {
  font-size: 30px;
  font-weight: bold;
  padding: 20px;
  color: #243A73; 
}

.no_pj_ment {	
  font-size: 15px;
  padding-top: 30px;
  color: #4a587d;
}

.no_pj_button {
  padding: 20px;
}

.no_pj_button button {
  background-color: #c0cded; 
  font-size: 20px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.no_pj_button button:hover {
  background-color: #243A73; 
  
}

.board-list td
.board-list tr
.board-list th
 { 
	text-align: center; 
}

.table-list td:first-child {  
	padding-left: 20px;
	text-align: left; 
}


  .creategoal {
  padding: 10px 20px;
    font-size: 14px;
    border-radius: 4px;
    border: none;
    background-color: #243A73;
    color: white;
    cursor: pointer;
  }

.main-table tr td {
  padding: 10px;
}  

</style>	   

<script>
// 초기에 최상위목표빼고 다 숨기기
window.addEventListener("DOMContentLoaded", function() {
	  var rows = document.getElementsByTagName("tr");
	  for (var i = 0; i < rows.length; i++) {
	    var parentValueElement = rows[i].getElementsByClassName("parent")[0];
	    if (parentValueElement) {
	      var parentValue = parentValueElement.value;
	      if (parentValue !== "0") {
	        rows[i].style.display = "none";
	      }
	    }
	  }
	});
</script>





<script>
// 토글 클릭 이벤트 핸들러
$(document).ready(function() {
  $('.toggle').click(function() {
    var depth = $(this).closest('tr').find('.depth').val();
    var goalNo = $(this).closest('tr').find('.goal_no').val();
    var groupNo = $(this).closest('tr').find('.group_no').val();

    if ($(this).find('i').hasClass('fa-caret-down')) {
      // 토글이 열려있는 경우
      $(this).find('i').removeClass('fa-caret-down').addClass('fa-caret-right');
      hideChildRows(depth, goalNo, groupNo);
    } else {
      // 토글이 닫혀있는 경우
      $(this).find('i').removeClass('fa-caret-right').addClass('fa-caret-down');
      showChildRows(depth, goalNo, groupNo);
    }
  });
});

function hideChildRows(depth, goalNo, groupNo) {
	  $('.toggle').each(function() {
	    var currentDepth = $(this).data('depth');
	    var currentGroupNo = $(this).closest('tr').find('.group_no').val();
	    var currentParentGoalNo = $(this).closest('tr').find('.parent').val();
		

	    if (currentDepth > depth && currentGroupNo === groupNo) {
	      $(this).closest('tr').hide();
	    }
	    
	    
	    
	  });
	}

	function showChildRows(depth, goalNo, groupNo) {
	  $('.toggle').each(function() {
	    var currentDepth = $(this).data('depth');
	    var currentGroupNo = $(this).closest('tr').find('.group_no').val();
	    var currentParentGoalNo = $(this).closest('tr').find('.parent').val();

	    if (currentDepth > depth && currentGroupNo === groupNo && currentParentGoalNo === goalNo) {
	      $(this).closest('tr').show();
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

<c:if test="${dataCount == 0}">
<div class="right-contentbody">
	<div class="pj">
		<div class="no_pj_img">
			<p><i class="fa-solid fa-file-circle-question" style="font-size: 150px;"></i></p>
		</div>
		
		<div class="no_pj_alert">
			<p>목표가 없습니다</p>
		</div>
		
		<div class="no_pj_ment">
			<p>새 목표를 생성하려면 '새 목표 만들기'을 클릭하세요</p>
		</div>
		
		<c:if test="${ ( qualify == 0 || qualify == 1 ) && pj_status == 0}">
		<div class="no_pj_button">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/goal/write?pj_no=${pj_no}'">새 목표 만들기</button>
		</div>
		</c:if>
		
		<c:if test="${qualify == 2 || pj_status == 1}">
		<div class="no_pj_button">
			<button type="button" class="btn-disabled" disabled="disabled" onclick="location.href='${pageContext.request.contextPath}/goal/write?pj_no=${pj_no}'">새 목표 만들기</button>
		</div>
		</c:if>


	</div>
</div>
</c:if>


<c:if test="${dataCount != 0}">

<div class="right-contentbody">

<div class="board1">
<div class="title_container">
	<div class="project"><h2><i class="fa-solid fa-briefcase"></i> ${pj_name} </h2></div>
	<div class="keyword_left">
	</div>
</div>


<div>
	<div class="col-auto me-auto dataCount">
	    
		<c:if test="${ ( qualify == 0 || qualify == 1 ) && pj_status == 0}">	
	    	<button type="button" class="creategoal" style="float: right" onclick="location.href='${pageContext.request.contextPath}/goal/write?pj_no=${pj_no}'">새 목표 만들기</button>
	    </c:if>
	    <c:if test="${qualify == 2 || pj_status == 1}">
	    	<button type="button" class="btn-disabled creategoal" disabled="disabled" style="float: right" onclick="location.href='${pageContext.request.contextPath}/goal/write?pj_no=${pj_no}'">새 목표 만들기</button>
	    </c:if>
    </div>

	<br><br>
    
    <table class="table table-border table-list table-hover board-list">
    	<thead class="table-right">	
    		<tr>
				<th width="50%">제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>달성률</th>
				<th>첨부파일</th>
			</tr>
    	</thead>
    	
    	<tbody id="goal_list">
    		<c:forEach var="dto" items="${list}" varStatus="status">
	    		<tr>
	    			<td class="left">
	    				<c:forEach var="n" begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
						<a class="toggle" data-depth="${dto.depth}">
					    <i class="fa-solid fa-caret-right"></i>
					    </a>
	    				<a href="${articleUrl}${dto.goal_no}&pj_no=${pj_no}" class="text-reset">&nbsp;&nbsp;&nbsp;&nbsp;${dto.goal_name}</a>	
	    		    <input type="hidden" class="depth" value="${dto.depth}">
	    		    <input type="hidden" class="goal_no" value="${dto.goal_no}">
	    		    <input type="hidden" class="parent" value="${dto.parent}">
	    		    <input type="hidden" class="group_no" value="${dto.group_no}">
	    			</td>
	    			<td>${dto.goal_start_date}</td>
	    			<td>${dto.goal_end_date}</td>
	    		    <td>${dto.goal_achv}</td>
					<td>
						<c:if test="${not empty dto.saveFilename}">
							<a href="<c:url value='/goal/download?goal_no=${dto.goal_no}'/>" class="text-reset"><i class="fa-solid fa-file-arrow-down"></i></a>
						</c:if>
					</td>
	    		</tr>
	   		</c:forEach>
	   	</tbody>
    </table>
</div>


</div>
</div>
</c:if>




    