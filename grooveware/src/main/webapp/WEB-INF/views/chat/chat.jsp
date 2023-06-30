<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/address/list">주소록</a>
                <a href="${pageContext.request.contextPath}/char/chat">메신저</a>
            <li>
        </ul>
       <hr>
</div>
    

		<div class="right-contentbody">
		
			<div class="title_container">
				<table class="table" style="margin-bottom: 20px;">
					<tr>
						<td class="title" ><i class="fa-brands fa-facebook-messenger"></i>&nbsp;<span>그루비&nbsp;톡</span>
						</td>
					</tr>
				</table>
				
		
		
		
				<div class="notice-list">
				<table class="table">
				
				<div class="container">
				
	<div class="body-container">	
		<div class="body-main content-frame">
			 <div class="chat-main">
				<div class="col-8">
					<p class="form-control-plaintext fs-6"><i class="bi bi-chevron-double-right"></i> 채팅 메시지</p>
					<div class="border p-3 chat-msg-container"></div>
					<div class="mt-2">
						<input type="text" id="chatMsg" class="form-control" 
							placeholder="채팅 메시지를 입력 하세요...">
					
				</div>
				<div class="col-4">
					<p class="form-control-plaintext fs-6"><i class="bi bi-chevron-double-right"></i> 접속자 리스트</p>
					<div class="border p-3 chat-connection-list"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 귓속말 Modal -->


<!-- 
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">귓속말</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<input type="text" id="chatOneMsg" class="form-control" 
							placeholder="귓속말을 입력 하세요...">
			</div>
		</div>
	</div>
</div>
 -->
</table>
</div>
</div>
</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
			