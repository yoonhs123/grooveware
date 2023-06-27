<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<div class="left-side-bar">
      
        <ul>
            <li>
                <a href="#">문서함</a>
                <a href="#">&nbsp;내 문서</a>
                <a href="#">&nbsp;부서 문서</a>
                <a href="#">&nbsp;임시보관 문서</a>
            <li>
            
            <hr>
        
            <hr>
             <li>
                <a href="#">주소</a>
                <a href="#">&nbsp;공용 주소록</a>
                <a href="#">&nbsp;직원 주소록</a>
                <a href="#">&nbsp;휴지통</a>
            <li>
        </ul>
    </div>
  <div class="right-contentbody">
  <div class="board">
    <div class="title_container">
      <table class="table" style="margin-bottom: 20px;">
        <tr>
          <td class="title">
            <h3><span>|</span> 기본 주소록</h3>
          </td>
          <td align="right">
            <form name="searchForm" action="${pageContext.request.contextPath}/" method="post">
              <div class="address-select">
                <select name="condition" class="form-select">
                  <option value="subject" ${condition == "subject" ? "selected='selected'" : ""}>제목</option>
                  <option value="content" ${condition == "content" ? "selected='selected'" : ""}>내용</option>
                  <option value="all" ${condition == "all" ? "selected='selected'" : ""}>제목+내용</option>
                  <option value="name" ${condition == "name" ? "selected='selected'" : ""}>이름</option>
                </select>
                <input type="text" name="keyword" value="${keyword}" class="addInput" placeholder="검색어를 입력하세요">
  				  <button type="button" class="btn" onclick="searchList();">검색</button>
 		 	</div>
            </form>
          </td>
        </tr>
      </table>

      <div class="button-container" style="margin-bottom: 10px;">
        <input type="checkbox" name="checkboxName" id="checkboxId">
        <label for="checkboxId"></label>
        <button type="button" class="btn" onclick="email();">전체</button>
        <button type="button" class="btn" onclick="email();">이메일</button>
        <button type="button" class="btn" onclick="email();">이동</button>
        <button type="button" class="btn" onclick="email();">중요</button>
        <button type="button" class="btn" onclick="email();">파일</button>
        <button type="button" class="btn" onclick="remove();">삭제</button>
      </div>
    </div>

   <table class="table table-border table-list">
   
  <thead>
    <tr>
      <!-- 테이블 헤더 셀들 -->
        <th width="5%;">
	    <input type="checkbox" name="chkAll" value="all"> 
		</th>
		<th width="5%"> 이름 </th>
		<th> 사명 </th>
		<th> 전화번호 </th>
		<th> 이메일 </th>
		<th> 직급 </th>
		<th> 재직현황 </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <!-- 테이블 내용 셀들 -->
     
      	<tr>
      	        <th width="5%;">
				<input type="checkbox" name="chkAll" value="all"> 
		        </th> 
			    <td>
				 김자바
				</td>					
				<td>다수결주식회사</td>
				<td>010-1234-5678</td>				
				<td>dasugyeol@naver.com</td>
				<td>대리</td>
				<td>재직</td>
		
	     </tr>
  </tbody>
	</table>
	
  
	<div class="page-navigation" style="width: 900px; margin: 0 auto;">${dataCount == 0 ? "등록된 게시물이 없습니다." : "<span>-123-</span>"}</div>
	
	</div>
	</div>