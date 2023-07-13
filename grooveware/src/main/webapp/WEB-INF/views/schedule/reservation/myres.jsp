<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
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
}

.year,
.month {
  padding: 4px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
  background-color: #fff;
  font-size: 16px;
  cursor: pointer;
  margin: 20px 0 15px 0;
  margin-right: 10px;
  width: 90px;
}

.date-select select:focus {
  outline: none;
}

.date-select select option:first-child {
  background-color: #eee;
}

.mr-res-read-button,
.mr-res-cancel-button {
	height: 35px;
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
.res-search-btn{
	height: 35px;
	width : 55px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #fff;
    border: 1px solid #404040;
    cursor: pointer;
    font-weight: 600;
	margin: 20px 0 15px 0;
}


</style>

<script type="text/javascript">
function searchDate() {
	let y = $("#select-year").val();
	let m = $("#select-month").val();
	
	if(!y || !m) {
		alert('날짜를 선택하세요.');
		return;
	}
	
	let query = "year=" + y + "&month=" + m;
	location.href="${pageContext.request.contextPath}/reservation/myres?" + query;
}
</script>

<script type="text/javascript">
function deleteRes(meroom_res_no) {
    if(confirm("예약을 취소하시겠습니까 ? ")) {
	    let query = "meroom_res_no=" + meroom_res_no;
    	location.href = "${pageContext.request.contextPath}/reservation/delete?" + query;
    }
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
			<div><h2><span><i class="fa-solid fa-table"></i></span>&nbsp;내 예약 현황</h2></div>
		</div>
	</div>
	<div class="date-select">
		  <select id="select-year" name="year" class="year">
		    <option value="" disabled selected>년도</option>
		    <c:forEach var="y" begin="${currentYear-3}" end="${currentYear}">
		    	<option value="${y}" ${year==y?"selected='selected'":"" }>${y}년</option>
		    </c:forEach>
		  </select>
		  <select id="select-month" name="month" class="month">
		    <option value="" disabled selected>월</option>
		    <option value="01" ${month=="01"?"selected='selected'":"" }>1월</option>
		    <option value="02" ${month=="02"?"selected='selected'":"" }>2월</option>
		    <option value="03" ${month=="03"?"selected='selected'":"" }>3월</option>
		    <option value="04" ${month=="04"?"selected='selected'":"" }>4월</option>
		    <option value="05" ${month=="05"?"selected='selected'":"" }>5월</option>
		    <option value="06" ${month=="06"?"selected='selected'":"" }>6월</option>
		    <option value="07" ${month=="07"?"selected='selected'":"" }>7월</option>
		    <option value="08" ${month=="08"?"selected='selected'":"" }>8월</option>
		    <option value="09" ${month=="09"?"selected='selected'":"" }>9월</option>
		    <option value="10" ${month=="10"?"selected='selected'":"" }>10월</option>
		    <option value="11" ${month=="11"?"selected='selected'":"" }>11월</option>
		    <option value="12" ${month=="12"?"selected='selected'":"" }>12월</option>
		  </select>
		  <button type="button" class="res-search-btn" onclick="searchDate();">검색</button>
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
   			<button type="button" class="mr-res-cancel-button" onclick="deleteRes(${dto.meroom_res_no});">취소</button>
	    </td>
	  </tr>
	  </c:forEach>
	</table>		
</div>

</body>
</html>
