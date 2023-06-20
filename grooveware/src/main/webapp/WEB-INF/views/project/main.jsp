<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="left-side-bar">
         <ul>
            <li>
                <a href="#" class="current_pj_name">현재 진행중인 프로젝트</a>
                <a href="#">&nbsp;프로젝트1</a>
                <a href="#">&nbsp;프로젝트2</a>
                <a href="#">&nbsp;프로젝트3</a>
            <li>
            <hr>
            <li>
                <a href="#">&nbsp;멤버</a>
                <a href="#">&nbsp;목표</a>
                <a href="#">&nbsp;업무</a>
                <a href="#">&nbsp;일정</a>
                <a href="#">&nbsp;공지사항</a>
                <a href="#">&nbsp;자료실</a>
            <li>
        </ul>
</div>
   <div class="right-contentbody">
 		<div class="pj">
			<div class="no_pj_img">
				<a><img src="../resources/images/noproject.svg"></a>
			</div>
			<div class="no_pj_alert">
				<a>프로젝트가 없습니다</a>
			</div>
			<div class="no_pj_ment">
				<a>새 프로젝트를 생성하려면 '프로젝트 생성'을 클릭하세요</a>
			</div>
			<div class="no_pj_button">
				<button>프로젝트 생성</button>
			</div>
		</div>  		
   </div>