<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  회의실 상세  -->

<div class="left-side-bar">
      
        <ul>
            <li>
                 <a href="#">회의실</a>
                <a href="#">&nbsp;회의실 리스트</a>
                <a href="#">&nbsp;회의실 관리</a>
            <li>
            
            <hr>
          </li>
          </ul>
    </div>
  <div class="right-contentbody">
  <div class="board">
  
    <!--  title  -->
    <div class="title_container">
      <table class="table" style="margin-bottom: 20px;">
        <tr>
          <td class="title">
            <td class="Rtitle">
            <h3>&nbsp;&nbsp;회의실 관리</h3>
          
          </td>
		  </tr>
		 </table> 
	  </div>
	  
	  <!--  reservation -->
	<div class="reservation-main">
	    <div class="left-box">
	      <!-- 왼쪽 박스 내용 -->
	      <div class="left-head">
	           <div class="image-box">
	            <img alt="회의실 사진" src="">                      
	           </div>	       
	      </div>	     
	    </div>	    
	    
	   <div class="right-box">
       <!-- 오른쪽 박스 내용 -->
	  <div class="right-head">
	   <h2>등록일</h2>
	  <span> 2023-06-01 </span>
	  </div>
	  <div class="right-main">
	  <h2>회의실 명</h2>
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <h4> 102호실 </h4>
	  </div> 
	  
	  <div class="right-footer">
	   <h2>회의실 정보</h2>  
	    <div class = "right-main textarea">
	    <textarea rows="4" cols="50" placeholder="텍스트를 입력하세요"></textarea>	
	  </div>
	   <div class="button-container">
    	<div style="float: right;">
			<button class="blueBtn" type="button" onclick="#">등록</button>
			<button class="blueBtn" type="button" onclick="#">취소</button>
		</div>
	  </div>
  	  </div>
	</div>  
	</div>
	</div>
</div>