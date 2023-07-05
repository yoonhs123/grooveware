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
input[type=text]{
    width: 300px;
    height: 26px;
    
}

.form-select{ height: 26px; margin-right: 10px; border-radius: 4px;}

 
 
 .pjname {
 
  padding: 10px;
  border-bottom: 3px solid #ccc;
  border-top: 3px solid #ccc;
  font-size: 30px;
  font-weight : bold;
 
 }
 
 
 
 
 .board1 {
  padding: 20px;
  border-radius: 5px;
}

.title_container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.title_container h3 {
  font-size: 24px;
  margin: 0;
  font-weight: bold;
}



.middle_container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.middle_container a {
  font-size: 16px;
  text-decoration: none;
  color: #333;
  padding: 5px 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.middle_container a:hover {
  background-color: #ccc;
}

.dataCount {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
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
  text-align: left;
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
        var depth = $(this).data('depth');
        var goalNo = $(this).closest('tr').find('.goal_no').val();
        var groupNo = $(this).closest('tr').find('.group_no').val();


        	$('.toggle').each(function() {
                var currentDepth = $(this).data('depth');
                var currentGroupNo = $(this).closest('tr').find('.group_no').val();
                var currentParentGoalNo = $(this).closest('tr').find('.parent').val();
                
                if (currentDepth > depth && currentGroupNo === groupNo && currentParentGoalNo === goalNo) {
                    $(this).closest('tr').toggle();
                }
            });
        
        

        // 현재 토글 아이콘 변경
        var icon = $(this).find('i');
        if (icon.hasClass('fa-caret-down')) {
            icon.removeClass('fa-caret-down');
            icon.addClass('fa-caret-right');
        } else {
            icon.removeClass('fa-caret-right');
            icon.addClass('fa-caret-down');
        }
        
        
    });
});



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
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>


<div class="right-contentbody">

<div class="board1">
<div class="title_container">
    <span class="pjname"><i class="fa-solid fa-list" style="color: #0a3d94;"></i>&nbsp;&nbsp;${pj_name}</span>


</div>

<br><br>
<div>
	<div class="col-auto me-auto dataCount middle_container">
    <span>목표 목록</span>
	<a href="${pageContext.request.contextPath}/goal/write?pj_no=${pj_no}" class="text-reset">새 목표 만들기</a>
    </div>
    
    <table class="table table-hover board-list">
    	<thead class="table-right">	
    		<tr>
				<th>제목</th>
				<th class="bw-100">시작일</th>
				<th class="bw-100">종료일</th>
				<th class="bw-70">달성률</th>
				<th class="bw-70" style="text-align: right">첨부파일</th>
				<th class="bw-70" style="text-align: right">더보기</th>
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
	    				<a href="${articleUrl}${dto.goal_no}" class="text-reset">&nbsp;&nbsp;&nbsp;&nbsp;${dto.goal_name}</a>	
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
	    		    <td style="text-align: right"><i class="fa-solid fa-bars"></i></td>
	    		</tr>
	   		</c:forEach>
	   	</tbody>
    </table>
</div>


</div>
</div>




    