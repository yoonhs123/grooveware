<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="left-side-bar">
        <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70}">
            <!-- dept_no가 60~70 사이일 때만 아래 <li> 태그들이 보이도록 처리하기 -->
            <li>
                <a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/workList">&nbsp;근태관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidayList">&nbsp;휴가관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidaySetting">&nbsp;휴가설정</a>
            </li>
        </c:when>
        <c:otherwise>
            <!-- dept_no가 60~ 70 사이가 아닐 때는 두 번째 <li> 태그를 출력하지 않게 -->
        </c:otherwise>
   	 	</c:choose>
	</ul>
    </div>
   <div class="right-contentbody">
   		<div class="board">
   			<div class="title-container">
	   				<div class="table-title">
	   					<div class="title">
	   						<h2><i class="bi bi-person-fill"></i>2023년도 개인별 휴가일 책정</h2>
	   					</div>
						<div class="search-insa">
							<select name="condition" class="form-select">
								<option value="name"  ${condition == "name" ? "selected='selected'" : ""} > 이름 </option>
								<option value="m_id"  ${condition == "m_id" ? "selected='selected'" : ""} > 사원번호 </option>
								<option value="dept"  ${condition == "dept" ? "selected='selected'" : ""} > 부서 </option>
								<option value="position"  ${condition == "position" ? "selected='selected'" : 	""} > 직위 </option>
							</select>
							<input type="text" name="keyword" value="" class="form-control">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</div>
	   				</div>
   					<div class="person-holiday">
   						<div class="one-person">
   							<div class="pic-per">
   								<div class="person-picture">사진</div>
   								<div class="person-name">관리자</div>
   							</div>
   							<div class="line1">
   								<div class="line2">
   								연차 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								<button type="button" class="btn-save">저장</button>
   								<input type="text" name="Annual" class="year-holiday">&nbsp;시간
   								</div>
   								<div class="line2">
   								보상 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								</div>
   								<div class="use-holiday">
   									연차 0일 0시간 소진 <p class="use-icon-holiday">연차휴가사용현황</p> 
   								</div>
   								<div class="use-holiday">
   									보상 휴가 0일 0시간 소진 <p class="use-icon-holiday">보상휴가사용현황</p>
   								</div>
   							</div>
   						</div>
   						
   						<div class="one-person">
   							<div class="pic-per">
   								<div class="person-picture">사진</div>
   								<div class="person-name">김대표</div>
   							</div>
   							<div class="line1">
   								<div class="line2">
   								연차 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								<button type="button" class="btn-save">저장</button>
   								<input type="text" name="Annual" class="year-holiday">&nbsp;시간
   								</div>
   								<div class="line2">
   								보상 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								</div>
   								<div class="use-holiday">
   									연차 0일 0시간 소진 <p class="use-icon-holiday">연차휴가사용현황</p> 
   								</div>
   								<div class="use-holiday">
   									보상 휴가 0일 0시간 소진 <p class="use-icon-holiday">보상휴가사용현황</p>
   								</div>
   							</div>
   						</div>
   						
   						<div class="one-person">
   							<div class="pic-per">
   								<div class="person-picture">사진</div>
   								<div class="person-name">김부장</div>
   							</div>
   							<div class="line1">
   								<div class="line2">
   								연차 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								<button type="button" class="btn-save">저장</button>
   								<input type="text" name="Annual" class="year-holiday">&nbsp;시간
   								</div>
   								<div class="line2">
   								보상 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								</div>
   								<div class="use-holiday">
   									연차 0일 0시간 소진 <p class="use-icon-holiday">연차휴가사용현황</p> 
   								</div>
   								<div class="use-holiday">
   									보상 휴가 0일 0시간 소진 <p class="use-icon-holiday">보상휴가사용현황</p>
   								</div>
   							</div>
   						</div>
   						
   						<div class="one-person">
   							<div class="pic-per">
   								<div class="person-picture">사진</div>
   								<div class="person-name">김차장</div>
   							</div>
   							<div class="line1">
   								<div class="line2">
   								연차 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								<button type="button" class="btn-save">저장</button>
   								<input type="text" name="Annual" class="year-holiday">&nbsp;시간
   								</div>
   								<div class="line2">
   								보상 휴가 <input type="text" name="Annual" class="year-holiday">&nbsp;일
   								</div>
   								<div class="use-holiday">
   									연차 0일 0시간 소진 <p class="use-icon-holiday">연차휴가사용현황</p> 
   								</div>
   								<div class="use-holiday">
   									보상 휴가 0일 0시간 소진 <p class="use-icon-holiday">보상휴가사용현황</p>
   								</div>
   							</div>
   						</div>
   						
   					</div>
   				<div class="page-navigation">
   				1 2 3 (페이지 말고 스크롤로?)
   				</div>
   				
   			</div>
   		</div>
   </div>