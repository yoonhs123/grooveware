<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="#">문서함</a>
                <a href="#">&nbsp;내 문서</a>
                <a href="#">&nbsp;부서 문서</a>
                <a href="#">&nbsp;임시보관 문서</a>
            <li>
            
            <hr>
            
            <li>
                <a href="#">결재함</a>
                <a href="#">&nbsp;대기</a>
                <a href="#">&nbsp;진행중</a>
                <a href="#">&nbsp;보류</a>
                <a href="#">&nbsp;반려</a>
                <a href="#">&nbsp;완료</a>
            <li>
        </ul>
    </div>
		<div class="right-contentbody">
		<div class="notic-list">
	<div class="title">
	    <h3><span>|</span> 공지사항</h3>
	</div>
	
	<table class="table table-border table-article" style="
    margin-top: 20px;
">
		<thead>
			<tr>
				<td width="50%">
					등록일 : ${dto.reg_date}
				</td>
			</tr>
			<tr>
				<td width="50%">
					작성자 :  
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
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/memo/list.do?page=${page}';">리스트</button>
			</td>
		</tr>
	</table>
</div>
		</div>

</body>
</html>
