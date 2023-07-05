<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.clubinfo1 {
  display: flex;
  height: 150px;
  justify-content: space-between;
}

.clubinfo-items {
  width: 500px;
  height: 100px;
}
.clubcontent-detail,
.clubinfo-content {
  text-align: left;
  padding: 5px;
}
.clubinfo2{
	margin: 10px;
}
.clubinfo-items img{
  width: 200px;
  height: 400px;
}
</style>

<div class="modal-clubcontent">
  
   	<div class="clubinfo1">
   		<div class="clubinfo-items">
   			<img src="이미지 URL" alt="이미지 설명">
   		</div>
   		
   		<div class="clubinfo-items">
    		<div class="clubcontent-detail">
    			<h4>커뮤니티명.</h4>
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
   	</div>
   	
   	<div class="clubinfo2">
		<div class="clubinfo-content">
   			<h4>커뮤니티 소개</h4>
   			<p> ${dto.club_content} </p>
   		</div>
   	</div>

</div>

		