<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="left-side-bar">
         <ul>
            <li>
                <a href="#" class="current_pj_name">현재 진행중인 프로젝트</a>
                <a href="#">&nbsp;메인으로</a>
                <a href="#">&nbsp;새 프로젝트 생성</a>
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
			<div class="pj_main_img">
				<div><img src="../resources/images/noproject.svg" width="200px"></div>
			</div>
			<div class="pj_main_alert">
				<div>프로젝트가 없습니다</div>
			</div>
			<div class="pj_main_ment">
				<div>새 프로젝트를 생성하려면 '프로젝트 생성'을 클릭하세요</div>
			</div>
			<div class="pj_main_btn">
				<button>프로젝트 생성</button>
			</div>
		</div>  		
   </div>