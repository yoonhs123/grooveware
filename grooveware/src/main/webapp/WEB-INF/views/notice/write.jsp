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

/* 글 쓰기 폼 */
.table-form tr>td { padding: 7px 0; }
.table-form p { line-height: 200%; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr>td:first-child { width: 110px; text-align: center; background: #f8f9fa; }
.table-form tr>td:nth-child(2) { padding-left: 10px; }
.table-form input[type=text], .table-form input[type=file], .table-form textarea { width: 98%; }

</style>

 <script type="text/javascript">
 
 
 function check() {
	  const f = document.noticeForm;
	  let str;
	  
	  str = f.noti_title.value.trim();
	    if(!str) {
	        alert("제목을 입력하세요. ");
	        f.noti_title.focus();
	        return false;
	    }
	    
	    str = f.noti_content.value;
		if( !str || str === "<p><br></p>" ) {
	        alert("내용을 입력하세요. ");
	        f.noti_content.focus();
	        return false;
	    }
	  
	  f.action = "${pageContext.request.contextPath}/notice/${gubun}/${mode}";
	  
	  return true;
	}
 
 
 
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
	    <h3>&nbsp;<span>|</span>&nbsp;${gubun=="dept"? dept_name :"사내" } 공지사항</h3>
	</div>

	<form name="noticeForm" method="post"  enctype="multipart/form-data"  >
		<table class="table table-border table-form">
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td> 
					<input type="text"  name = "noti_title" class="form-control" style="width: 98%;" value="${dto.noti_title}">
				</td>
			</tr>
			<tr> 
				<td class= "LeftBox">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td> 
					<textarea name="noti_content" id="ir1" class="form-control"
                 		style="width: 98%;">${dto.noti_content}</textarea>
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
					<button type="button" class="btn-notice" onclick="submitContents(this.form);">${mode=="write"?"등록하기":"수정완료"}</button>
					<button type="reset" class="btn-notice">다시입력</button>
					<button type="button" class="btn-notice" onclick="location.href='${pageContext.request.contextPath}/notice/${gubun}/list';"> ${mode=="write"?"등록취소":"수정취소"}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="noti_id" value="${dto.noti_id}">
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


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</body>
</html>
