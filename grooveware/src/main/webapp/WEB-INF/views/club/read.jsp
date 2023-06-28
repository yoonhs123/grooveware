<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <div class="modal-content">
    <button type="button" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px; width:80px;"
    		class="close" onclick="closeModal()">close</button>
   	<div class="clubcontent">
   		<div class="box">
   			<img src="이미지 URL" alt="이미지 설명">
   		</div>
   		<div class="clubcontent1">
    		<div>
    			<h4>커뮤니티명</h4>
    			<p> ${dto.club_name} </p>	
    		</div>
    		<div>
    			<h4>운영자</h4>
    			<p> ${dto.emp_name} </p>	
    		</div>
    		<div>
    			<h4>개설일</h4>
    			<p> ${dto.club_startdate} </p>		
    		</div>
   		</div>
   	</div>
  			<div class="clubcontent2">
   			<h4>커뮤니티 소개</h4>
   			<p> ${dto.club_content} </p>
   		</div>

		<button type="button" style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px; width:80px;">가입</button>
	</div>

		