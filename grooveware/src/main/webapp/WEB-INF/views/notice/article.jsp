<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <script type="text/javascript">
 
 
 function sendlist() {
	  const f = document.memoForm;
	  f.action = "${pageContext.request.contextPath}/notice/list";
	  f.submit();
	}
 
 
 
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
		<div class="notic-list">
	<div class="title">
	    <h3><span>|</span> ${gubun=="dept"? dept_name :"회사" } 공지사항</h3>
	</div>
	
	<table class="table table-border table-article" style="
    margin-top: 20px;
">
		<thead>
			<tr>
				<td width="50%">
					등록일 : ${dto}
				</td>
			</tr>
			<tr>
				<td width="50%">
					작성자 :  ${dto}
				</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td colspan="2" valign="top" height="400">
					${dto.content}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					첨부 : 
					<c:if test="${not empty dto.saveFilename }">
						<a href="${pageContext.request.contextPath}/memo/download.do?num=${dto.num}">${dto.originalFilename}</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	
	<table class="table">
		<tr>
			<td width="50%">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/memo/update.do?num=${dto.num}&page=${page}';">수정</button>
				<button type="button" class="btn" onclick="deleteMemo();">삭제</button>
			</td>
			<td align="right">
				<button type="button" class="btn" onclick="sendlist()">리스트</button>
			</td>
		</tr>
	</table>
</div>
		</div>

</body>
</html>
