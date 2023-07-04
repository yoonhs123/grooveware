<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.mr-res-timetable,
.mr-res-daytable {
    width: 100%;
    border-spacing: 0;
    text-align: center;
	margin: auto;
	color: #404040;
	border-collapse: collapse;

}
.mr-res-timetable th, 
.mr-res-timetable td {
    padding: 8px;
    border-top: 2px solid #c1c1c1;
}

.mr-res-daytable th{
	padding: 10px;
	border-top: 2px solid #c1c1c1;
	border-bottom: 2px solid #c1c1c1;
}
.mr-res-daytable td {
	padding: 10px;
	border-top: 1px solid #c1c1c1;
}

.mr-res-timetable th,
.mr-res-daytable th{
    padding: 10px;
    font-size: 16.5px;
    background-color: #f6f6f6;
}
.mr-res-timetable .time {
    font-weight: bold;
}
.mr-res-timetable .empty {
    background-color: #ffffff;
}

.mr-res-timetable .reservation {
    background-color: #CEDDEF;
}
.mr-res-timetable .item {
  	width: 100%; height: 100%;
}

.res-date{
	text-align: center;
	font-weight: 600;
	font-size: 20px;
}

.res-prebutton,
.res-nextbutton{
	height: 35px;
	width : 70px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #fff; 
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 550;
    font-size: 20px;
    margin: 0 10px;
}
.mr-res-button,
.mr-info-button,
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

.mr-res-button{
    font-weight: 600;
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
			<div><h2><span>|</span>&nbsp;회의실 예약 현황</h2></div>
		</div>
	</div>
	<div class="res-date">
		<div>
			<i class="fa-solid fa-chevron-left res-prebutton" onclick="changeDate('${preDate}')"></i>
			<span>${date}</span>
			<i class="fa-solid fa-chevron-right res-nextbutton" onclick="changeDate('${nextDate}')"></i>
		</div>
		<div class="res-button" style="text-align:right;">
			<button type="button" class="mr-res-button"
					onclick="location.href='${pageContext.request.contextPath}/reservation/write';"> 예약 </button>
		</div>
	</div>
	<br>
	<table class="mr-res-timetable">
	  <tr>
	    <th colspan="2"></th>
	    <th>9:00</th>
	    <th>10:00</th>
	    <th>11:00</th>
	    <th>12:00</th>
	    <th>13:00</th>
	    <th>14:00</th>
	    <th>15:00</th>
	    <th>16:00</th>
	    <th>17:00</th>
	  </tr>
	  
	  <c:forEach var="vo" items="${listMr}">
	  	<tr>
	  		<td style="border-bottom: 2px solid #c1c1c1;">${vo.meroom_name}</td>
	  		<td style="border-bottom: 2px solid #c1c1c1;">
	    		<button type="button" class="mr-info-button">보기</button>
	    	</td>
	    	
	    	<c:forEach var="t" begin="9" end="17">
	    		<td style="padding: 0; border-bottom: 2px solid #c1c1c1;">
	    			<c:set var="state" value="0"/>
	    			<c:forEach var="m" items="${listByDate}">
	    				<c:if test="${vo.meroom_id == m.meroom_id && (m.starttime==t || m.endtime==t || (m.starttime<t && m.endtime>t))}"><c:set var="state" value="1"/></c:if>
	    			</c:forEach>
	    			<c:if test="${state==0}"><div class="item empty">&nbsp;</div></c:if>
	    			<c:if test="${state==1}"><div class="item reservation">&nbsp;</div></c:if>
	    		</td>
	    	</c:forEach>
	  	</tr>
	  </c:forEach>

	</table>
	<br>
	<br>
	<div class="title_container">
		<div class="table1" style="margin-bottom: 5px;">
			<div>
				<h2><span>|</span>&nbsp;회의실별 일별 현황</h2>
			</div>
		</div>
	</div>	
	<br>
	<table class="mr-res-daytable">
	  <tr>
	    <th>자산</th>
	    <th>이름</th>
	    <th>예약날짜</th>
	    <th>예약시작시간</th>
	    <th>예약종료시간</th>
	    <th>예약상세</th>
	  </tr>
	<c:forEach var="dto" items="${list}">
	  <tr style="border-bottom: 2px solid #c1c1c1;">
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
