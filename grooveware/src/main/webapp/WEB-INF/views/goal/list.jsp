<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <style type="text/css">


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

.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }

 
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

 
 </style>
    

<div class="left-side-bar">
         <ul>
            <li>
            	<a></a>
                <a href="${pageContext.request.contextPath}/project/list">&nbsp;진행중인 프로젝트</a>
                <a href="${pageContext.request.contextPath}/project/listend">&nbsp;완료된 프로젝트</a>
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

<div class="board1">
<div class="title_container">
    <h3>프로젝트 이름</h3>

    <h2>목표 추가</h2>
	<a href="${pageContext.request.contextPath}/goal/write?pj_no=${pj_no}" class="text-reset">새 목표 만들기</a>

		   
</div>

<br><br><br><br><br>
<div>
	<div class="col-auto me-auto dataCount">
    목표 목록
    </div>
    
    <table class="table table-hover board-list">
    	<thead class="table-right">	
    		<tr>
				<th>제목</th>
				<th class="bw-100">시작일</th>
				<th class="bw-100">종료일</th>
				<th class="bw-70">달성률</th>
			</tr>
    	</thead>
    	
    	<tbody id="goal_list">
    		<c:forEach var="dto" items="${list}" varStatus="status">
	    		<tr>
	    			<td class="left">
	    				<c:forEach var="n" begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
		    				<c:if test="${dto.depth==0}"><i class="fa-solid fa-caret-down"></i></c:if>
		    				<c:if test="${dto.depth==1}"><i class="fa-solid fa-caret-right"></i></c:if>
		    				<c:if test="${dto.depth >= 2}"><img class="" src="${pageContext.request.contextPath}/resources/images/bottomgoal.png" style="max-height: 50px;"></c:if>
	    				<a class="text-reset">&nbsp;&nbsp;${dto.goal_name}</a>	
	    			</td>
	    			<td>${dto.goal_start_date}</td>
	    			<td>${dto.goal_end_date}</td>
	    		    <td>${dto.goal_achv}</td>      
	    		</tr>
	   			</c:forEach>
	   	</tbody>
    </table>
</div>


</div>
</div>
    
    
    
    
    