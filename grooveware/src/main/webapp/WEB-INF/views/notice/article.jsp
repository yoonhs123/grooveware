<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <script type="text/javascript">
 <script type="text/javascript">
 <c:if test="${sessionScope.member.dept_no != 60}">
 function deleteNotice() {
   alert("관리자만 삭제 가능합니다.");
 }
 </c:if>
 
 function noticeAlert() {
   var message = "${message}";
   if (message !== "") {
     alert(message);
     history.back();
   }
 }
 noticeAlert();
</script>



<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/notice/all/list">사내 공지사항</a>
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
    margin-top: 20px; ">
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
						<a href="${pageContext.request.contextPath}/notice/${gubun}/download.do?num=${dto.noti_id}">${dto.save_filename}</a>
					</c:if>
				</td>
			</tr>	
		</tbody>
	</table>
	
	<table class="table">
		<tr>
			<td width="50%">
				<button type="button" class="btn-notice" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/${gubun}/update?noti_id=${dto.noti_id}&page=${page}';">수정</button>
				<button type="button" class="btn-notice" onclick="deleteNotice();">삭제</button>
			</td>
			<td align="right">
				<button type="button" class="btn-notice" onclick="location.href='${pageContext.request.contextPath}/notice/${gubun}/list';">목록으로</button>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>
