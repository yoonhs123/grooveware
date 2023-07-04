<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.modal-clubcontent{
	width: 100%;
	  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  align-items: flex-start;
}


.box {
  margin-top: 20px;
  width: 40%
}

.clubcontent1 {
  display: flex;
  width: 60%
  flex-direction: column;
  justify-content: space-between;
}
.clubcontent-detail{
  white-space:pre;
}

.clubcontent2 {
  width: 100%
  margin-right: 20px;
}

</style>

<div class="modal-clubcontent">
  
   	<div class="clubinfo">
   		<div class="box">
   			<img src="이미지 URL" alt="이미지 설명">
   		</div>
   		
   		<div class="clubcontent1">
    		<div class="clubcontent-detail">
    			<h4>커뮤니티명</h4>
    			<p> ${dto.club_name} </p>	
    		</div>
    		
    		<div class="clubcontent-detail">
    			<h4>운영자</h4>
    			<p> ${dto.emp_name} </p>	
    		</div>
    		
    		<div class="clubcontent-detail">
    			<h4>개설일</h4>
    			<p> ${dto.club_startdate} </p>		
    		</div>
   		</div>
   		
		<div class="clubcontent2">
   			<h4>커뮤니티 소개</h4>
   			<p> ${dto.club_content} </p>
   		</div>
   		
   	</div>

</div>

		