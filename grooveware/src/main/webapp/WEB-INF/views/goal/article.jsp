<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<style type="text/css">
 
.project {
  color: #4048a8;
  font-size: 30px;
  font-weight : bold;
 
 }

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
	background-color: #ccc;
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


</style>
    
<body>
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
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="fa-solid fa-list-check"></i> ${dto.goal_name} </h2>
	    </div>
<br>
	
	
	<div class="body-main">	
		<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">
							${''}
						</td>
					</tr>
				</thead>
					
					<tbody>
						<tr>
							<td width="50%">
								이름 : ${''}
							</td>
							<td align="right">
								${''} | 조회 ${''}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="200" style="border-bottom: none;">
					    		<c:forEach var="dto" items="${goal_member}" varStatus="status">
						    		<tr>
						    			<td>사원이름 : ${dto.emp_name}</td>
						    			<td>직위 : ${dto.pos_name}</td>
						    			<td>부서 : ${dto.dept_name}</td>
						    		</tr>
						   		</c:forEach>								
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								파&nbsp;&nbsp;일 :
								<c:if test="${not empty dto.saveFilename}">
									<a href="${pageContext.request.contextPath}/bbs/download?goal_no=${dto.goal_no}">${dto.originalFilename}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless mb-2">
					<tr>
						<td width="50%">
							<c:choose>
								<c:when test="${''}">
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/update?num=${''}&page=${''}';">수정</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled="disabled">수정</button>
								</c:otherwise>
							</c:choose>
					    	
							<c:choose>
					    		<c:when test="${''}">
					    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
					    		</c:when>
					    		<c:otherwise>
					    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
					    		</c:otherwise>
					    	</c:choose>
						</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list?${''}';">리스트</button>
						</td>
					</tr>
				</table>
				
		
		
	</div>
	</div>	
</div>
</div>
