<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.restimetable {
    width: 100%;
    border-spacing: 0;
    text-align: center;
	margin: auto;
	color: #404040;
	border-collapse: collapse;
}
  
.restimetable td {
    padding: 10px;
    border-bottom: 1px solid #c1c1c1;
}
  
.restimetable th {
    padding: 10px;
    font-size: 16.5px;
    background-color: #f6f6f6;
    border-top: 2px solid #c1c1c1;
    border-bottom: 2px solid #c1c1c1;
}

.date-select {
  display: flex;
  align-items: center;
  max-width: 200px;
}

.year,
.month {
  flex: 1;
  padding: 4px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
  background-color: #fff;
  font-size: 16px;
  cursor: pointer;
  margin : 20px 0 15px 0;
  margin-right: 10px;
}

.date-select select:focus {
  outline: none;
}

.date-select select option:first-child {
  background-color: #eee;
}

.mr-res-read-button,
.mr-res-cancel-button{
	height: 30px;
	width : 55px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #eaeaea; 
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 550;
    margin: 0 3px;
}


</style>

<script>
function changeDate(date) {
	let query = "date=" + date;
	location.href="${pageContext.request.contextPath}/reservation/main?date=" + date;
}
</script>

<div class="left-side-bar">
      <ul> 
          <li>
              <a href="${pageContext.request.contextPath}/archive/list">캘린더</a>
          </li>
          
          <li>
              <a href="${pageContext.request.contextPath}/reservation/main">자원 예약</a>
              <a href="${pageContext.request.contextPath}/reservation/main">&nbsp;회의실 예약</a>
              <a href="${pageContext.request.contextPath}/reservation/myres">&nbsp;내 예약현황</a>
          <li>
      </ul>
</div>

<div class="right-contentbody">
	<div class="title_container">
		<div class="table1" style="margin-bottom: 5px;">
			<div><h2><span>|</span>&nbsp;내 예약 현황</h2></div>
		</div>
	</div>

	<div class="date-select">
		  <select id="year" name="year" class="year">
		    <option value="" disabled selected>년도</option>
		    <option value="2021">2021년</option>
		    <option value="2022">2022년</option>
		    <option value="2023">2023년</option>
		  </select>
		  <select id="month" name="month" class="month">
		    <option value="" disabled selected>월</option>
		    <option value="01">1월</option>
		    <option value="02">2월</option>
		    <option value="03">3월</option>
		    <option value="04">4월</option>
		    <option value="05">5월</option>
		    <option value="06">6월</option>
		    <option value="07">7월</option>
		    <option value="08">8월</option>
		    <option value="09">9월</option>
		    <option value="10">10월</option>
		    <option value="11">11월</option>
		    <option value="12">12월</option>
		  </select>
	</div>
	
	<table class="restimetable">
	  <tr>
	    <th>자산</th>
	    <th>이름</th>
	    <th>예약날짜</th>
	    <th>예약시작시간</th>
	    <th>예약종료시간</th>
	    <th>예약</th>
	  </tr>
	<c:forEach var="dto" items="${list}">
	  <tr>
	    <td>${dto.meroom_id}</td>
	    <td>${dto.meroom_name}</td>
	    <td>${dto.meroom_resdate} </td>
	    <td>${dto.res_starttime} </td>
	    <td>${dto.res_endtime}</td>
	    <td>
	    	<button type="button" class="mr-res-read-button">상세</button>
	    	<button type="button" class="mr-res-cancel-button">취소</button>
	    </td>
	  </tr>
	  </c:forEach>
	</table>		
</div>

</body>
</html>
