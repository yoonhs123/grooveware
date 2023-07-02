<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
  .timetable {
    border-collapse: collapse;
    width: 100%;
  }
  
  .timetable th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
  }
  
  .timetable th {
    background-color: #f2f2f2;
  }
  
  .timetable .time {
    font-weight: bold;
  }
  
  .timetable .empty {
    background-color: #fff;
  }

  .timetable .reservation {
    background-color: yellow;
  }
  .timetable .item {
  	width: 100%; height: 100%;
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
          <li>
      </ul>
</div>

<div class="right-contentbody">
	<div class="title_container">
		<div class="table1" style="margin-bottom: 5px;">
			<div><h2><span>|</span> 회의실 예약 - 시간대별 현황</h2></div>
		</div>
	</div>
	<div>
		<div>
			<button type="button" onclick="changeDate('${preDate}')">이전</button>
			<span>${date}</span>
			<button type="button" onclick="changeDate('${nextDate}')">다음</button>
		</div>
		<div class="res-button" style="text-align:right;">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/reservation/write';" 
					style="background-color: #eeeeee; border:none; font-size:13px; padding:5px 10px; border-radius: 7px;"> 예약 </button>
		</div>
	</div>
	<br>
	<table class="timetable">
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
	  		<td>${vo.meroom_name}</td>
	  		<td>
	    		<button>보기</button>
	    	</td>
	    	
	    	<c:forEach var="t" begin="9" end="17">
	    		<td style="padding: 0;">
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
			<div><h2><span>|</span> 내 예약 현황</h2></div>
		</div>
	</div>	
	<br>
	<table class="timetable">
	<c:forEach var="dto" items="${list}">
	  <tr>
	    <th>자산</th>
	    <th>이름</th>
	    <th>예약날짜</th>
	    <th>예약시작시간</th>
	    <th>예약종료시간</th>
	    <th>예약</th>
	  </tr>
	  <tr>
	    <td>${dto.meroom_id}</td>
	    <td>${dto.meroom_name}</td>
	    <td>${dto.meroom_resdate} </td>
	    <td>${dto.res_starttime} </td>
	    <td>${dto.res_endtime}</td>
	    <td>
	    	<button>상세</button>
	    	<button>취소</button>
	    </td>
	  </tr>
	  </c:forEach>
	</table>		
</div>

</body>
</html>
