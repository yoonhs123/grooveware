<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <script type="text/javascript">
 
 
 function sendNotice() {
	  const f = document.noticeForm;
	  
	  
	  f.action = "${pageContext.request.contextPath}/notice/${gubun}/${mode}";
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
  <div class="notice-list">
	<div class="title">
	    <h3><span>|</span> ${gubun=="dept"? dept_name :"회사" } 공지사항</h3>
	</div>

	<form name="noticeForm" method="post"  enctype="multipart/form-data"  >
		<table class="table table-border table-form">
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td> 
					<input type="text"  name = "noti_title" class="form-control" value="${dto.noti_title}">
				</td>
			</tr>
			<tr  > 
				<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td> 
					<textarea name="noti_content" class="form-control" style="height: 400px;">${dto.noti_content}</textarea>
				</td>
			</tr>

			<tr>
				<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
				<td> 
					<input type="file" name="selectFile" class="form-control">
				</td>
			</tr>



		</table>
			
		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn" onclick="sendNotice();">${mode=="write"?"등록하기":"수정완료"}</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/${gubun}/list';"> ${mode=="write"?"등록취소":"수정취소"}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="save_filename" value="${dto.save_filename}">
						<input type="hidden" name="original_filename" value="${dto.original_filename}">
					</c:if>
				</td>
			</tr>
		</table>

	</form>
	
</div>
		</div>

</body>
</html>
