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
                <a href="#">공지사항</a>
              
            <li>
        </ul>
        
        
    </div>
  <div class="right-contentbody">
  <div class="notic-list">
	<div class="title">
	    <h3><span>|</span> 공지사항</h3>
	</div>

	<form name="memoForm" method="post"  enctype="multipart/form-data"  >
		<table class="table table-border table-form">
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td> 
					<input type="text" class="form-control">
				</td>
			</tr>
			<tr  > 
				<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td> 
					<textarea name="content" class="form-control" style="height: 400px;">${dto.content}</textarea>
				</td>
			</tr>

			<tr>
				<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
				<td> 
					<input type="file" name="selectFile" class="form-control">
				</td>
			</tr>
			<c:if test="${mode=='update' }">
				<tr>
					<td>첨부된 파일</td>
					<td>
						<label>${dto.originalFilename}</label>
					</td>
				</tr>
			</c:if>
		</table>
			
		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn" onclick="sendlist();">${mode=="write"?"등록하기":"수정완료"}</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="sendlist();">${mode=="write"?"등록취소":"수정취소"}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
						<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
					</c:if>
				</td>
			</tr>
		</table>

	</form>
	
</div>
		</div>

</body>
</html>
