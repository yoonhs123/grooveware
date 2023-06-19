<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<div class="left-side-bar">
	<ul>
            <li>
                <a href="#">나의 인사정보</a>
                <a href="#">&nbsp;인사정보</a>
                <a href="#">&nbsp;인사기록카드</a>
                <a href="#">&nbsp;내 출근 기록</a>
                <a href="#">&nbsp;내 휴가 기록</a>
            <li>
            
            <hr>
	</ul>
</div>
<div class="right-contentbody">
	<div style="display : flex; height: 200px; justify-content: space-between;">
		
			<div class="profile-ficture border-radius" >
				<div style="border: 1px solid black; width : 100px; height : 100px;"><img>
			</div> 
				<div style="width : 200px; height : 50px; padding-top: 10px; text-align : center; ">이메일</div> 
			</div>
			
			<div class="profile-content1 border-radius">
			
				<table class="profile-content1-table">
					<tr>
						<td>사번</td>
						<td><input></td>
						<td>부서</td>
						<td><input></td>
						
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input></td>
						<td>직급</td>
						<td><input></td>
					</tr>
					<tr>
						<td>입사일</td>
						<td><input></td>
					</tr>
					
				</table>
			</div>
		</div>
		<div class="profile-content2 border-radius">
			<div style="margin-bottom:15px;">자택주소</div>
			<div><input id="addressCode" disabled="disabled" style="width: 200px; height : 30px; margin-bottom:5px;"><button class="asdf" type="button" onclick="daumPostcode();">우편번호</button></div>
			
			<input id="address">
			<input id="addressDetail">
			<div style="margin-bottom:15px; margin-top : 15px;">전화번호</div>
			<select>
				<option>02</option>
				<option>010</option>
				<option>011</option>
			</select>
			<input><input style="margin-left:6px;">
			<div style="margin-bottom:15px; margin-top : 15px;"></div>
		</div>
		
		<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-tab-1"></div>
				<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2"></div>
				<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-2"></div>
		</div>
</div>