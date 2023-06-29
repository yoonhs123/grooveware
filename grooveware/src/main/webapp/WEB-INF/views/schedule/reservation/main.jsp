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
  
  th {
    background-color: #f2f2f2;
  }
  
  td.time {
    font-weight: bold;
  }
  
  td.empty {
    background-color: #f7f7f7;
  }
</style>

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
	<table class="timetable">
	  <tr>
	    <th></th>
	    <th>9</th>
	    <th>10</th>
	    <th>11</th>
	    <th>12</th>
	    <th>13</th>
	    <th>14</th>
	    <th>15</th>
	    <th>16</th>
	    <th>17</th>
	    <th>18</th>
	  </tr>
	  <tr>
	    <td>2층 소회의실</td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>

	  </tr>
	  <tr>
	    <td>3층 소회의실</td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	  </tr>
	  <tr>
	    <td>3층 대회의실</td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	    <td class="empty"></td>
	  </tr>
	  <!-- 나머지 시간대에 대한 행들을 추가로 작성하시면 됩니다 -->
	</table>
		
	<div class="title_container">
		<div class="table1" style="margin-bottom: 5px;">
			<div><h2><span>|</span> 내 예약 현황</h2></div>
		</div>
	</div>	
	<table class="timetable">
	  <tr>
	    <th>자산</th>
	    <th>이름</th>
	    <th>예약 시간</th>
	    <th>취소</th>
	  </tr>
	  <tr>
	    <td>회의실</td>
	    <td>2층 소회의실</td>
	    <td>2023.06.28 09:00 ~ 10:00 </td>
	    <td>
	    	<button>취소</button>
	    </td>
	  </tr>
	</table>		
</div>

</body>
</html>
