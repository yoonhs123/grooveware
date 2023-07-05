<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
  .sub-menu {
    width:200px;
	display:none;
	position: absolute;
	font-size:14px;
	background: skyblue;
    /* 하위 항목들을 숨겨둠 */
    /* 추가적인 스타일링은 필요에 따라 변경 가능 */
  }
  
.main-menu > li:hover > ul {
		display:block;
	}
  
</style>

<header> 
      <ul class="main-menu">
         
         <li style="width: 230px; font-weight: 600;">
         <a href="${pageContext.request.contextPath}/dashboard/main">GROOVE WARE</a>
         </li>
         
         <li><a href="${pageContext.request.contextPath}/approval/list">전자결재</a></li>
         <li><a href="${pageContext.request.contextPath}/myInsa/profile">인사정보</a></li>
         <li><a href="${pageContext.request.contextPath}/project/list">프로젝트</a></li>
         <li><a href="${pageContext.request.contextPath}/schedule/calendar/main">일정관리</a></li> 
         <li><a href="${pageContext.request.contextPath}/club/list">그루비룸</a></li>
         <li><a href="${pageContext.request.contextPath}/notice/all/list">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath}/archive/1">자료실</a></li>
         <li>
            <a href="${pageContext.request.contextPath}/chat/chat" title="메신저"><i class="fa-brands fa-facebook-messenger"></i></a>
             &nbsp;&nbsp;&nbsp;&nbsp;
         	<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
         </li>
      </ul>
</header>

