<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="left-side-bar">
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/address/list">주소록</a>
            <a href="${pageContext.request.contextPath}/chat/chat">메신저</a>
        </li>
    </ul>
    <hr>
</div>

<div class="right-contentbody">

    <div class="title_container">
        <table class="table" style="margin-bottom: 20px;">
            <tr>
                <td class="title"><i class="fa-brands fa-facebook-messenger"></i>&nbsp;<span>그루비&nbsp;톡</span></td>
            </tr>
        </table>
    </div>
 <div class="chat-main">
    <div class="chat-left">
        <div class="chat-left-main">
             <div class="mt-2">
            <p class="form-control-plaintext fs-6">
                <i class="bi bi-chevron-double-right"></i> &nbsp; 그루비 &nbsp; 톡 </p>
            </div>
        </div>
        <div class="chat-msg-container"></div>
    
            <input type="text" id="chatMsg" class="form-control" placeholder="채팅 메시지를 입력하세요...">
        
    </div>
    
    <div class="chat-right">	
        <div class="mt-3">
        <p class="form-control-plaintext fs-6">
            <i class="bi bi-chevron-double-right"></i> 접속자 리스트
        </p>
        </div>
        <div class="chat-connection-list"></div>
        </div>
         
</div>


<script type="text/javascript">

  $(function(){
	  var socket = null;
	 	 
	 
	  
	  
  })
  


</script>
	