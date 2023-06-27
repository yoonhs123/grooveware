<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <script type="text/javascript">
 <c:if test="${sessionScope.member.emp_no == dto.emp_no}">
 function deleteNotice() {
 	let query = "noti_id=${dto.noti_id}&${query}";
 	let url = "${pageContext.request.contextPath}/notice/delete?" + query;

 	if(confirm(" 삭제 하시겠습니까 ? ")) {
 		location.href = url;
 	}
 }
 </c:if>
 </script>


<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/notice/all/list">회사 공지사항</a>
                <a href="${pageContext.request.contextPath}/notice/dept/list">${dept_name} 공지사항</a>
            <li>
        </ul>
       <hr>
</div>
    
<div class="right-contentbody">
		<div class="notice-list">
	<div class="title">
	    <h3><span>|</span> ${gubun=="dept"? dept_name :"회사" } 공지사항</h3>
	</div>
	
	<table class="table table-border table-article" style="
    margin-top: 20px;
">
		<thead>
			<tr>
				<td width="50%">
					등록일 : ${dto.noti_regdate}
				</td>
			</tr>
			<tr>
				<td width="50%">
					작성자 : ${dto.emp_name}
				</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td colspan="2" valign="top" height="400">
					${dto.noti_content}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					첨부 : ${dto.save_filename}
					<c:if test="${dto.save_filename}">
						<a href="${pageContext.request.contextPath}/notice${gubun}/download.do?num=${dto.noti_id}">${dto.save_filename}</a>
					</c:if>
				</td>
			</tr>	
		</tbody>
	</table>
	
	<table class="table">
		<tr>
			<td width="50%">
				<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/${gubun}/update.do?noti_id=${dto.noti_id}&page=${page}';">수정</button>
				<button type="button" class="btn" onclick="deleteNotice();">삭제</button>
			</td>
			<td align="right">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/${gubun}/list';">리스트</button>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>
