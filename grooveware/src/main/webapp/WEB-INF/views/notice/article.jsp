<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* form */
.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

.form-check-input { width: 1em; height: 1em; vertical-align: middle; background-color: #fff; border: 1px solid rgba(0,0,0,.25); margin-top: 7px; margin-bottom: 7px; }
.form-check-input:checked { background-color: #0d6efd; border-color: #0d6efd; }
.form-check-input[type=checkbox] { border-radius: 0.25em; }
.form-check-label { cursor: pointer; vertical-align: middle; margin-top: 7px; margin-bottom: 7px; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }
</style>

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

<style type="text/css">

.notice-list1 {
	wedth: 100%;
    height: 100%;
    background-color: #FFFFFF;
    padding: 20px;  
}

.noti_title1{
  width: 100%;
  text-align: center;
  border: none;
  font-weight: 600;
  font-size: 17px;
  padding: 10px; 
  border-bottom: 2px solid #c1c1c1;
}
.noti_article_title {
 border-top: 2px solid #c1c1c1;
 padding: 30px;
 
}
</style>


<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/notice/all/list">사내 공지사항</a>
                <a href="${pageContext.request.contextPath}/notice/dept/list">${dept_name} 공지사항</a>
            <li>
        </ul>
      
</div>
    
<div class="right-contentbody">
		<div class="notice-list1">
	<table class="table table-border">
	  
		<thead>
			<tr>
				<td class ="noti_title1" colspan="2">
				     ${dto.noti_title}
				</td>
			</tr>
			<tr> 
				<td width="50%">
					관리자
				<td align="right">
				 	&nbsp;${dto.noti_regdate}&nbsp;
				</td>
				
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td class="noti_article_title" colspan="2" valign="top" height="400">			  
                     ${dto.noti_content}        
			  	</td>
			</tr>
			<tr>
				<td colspan="2">
					첨부 : ${dto.original_filename}
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
