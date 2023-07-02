<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
 /* 예약 폼 컨테이너 */
.reservation-form {
  width: 400px;
  margin: 0 auto;
}

/* 예약 폼 레이블 */
.reservation-form label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
}

/* 예약 폼 입력 필드 */
.reservation-form input[type="text"],
.reservation-form input[type="date"],
.reservation-form input[type="time"] {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 20px;
}

/* 예약 폼 버튼 */
.reservation-form button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.reservation-form button:hover {
  background-color: #45a049;
}

/* 예약 폼 에러 메시지 */
.reservation-form .error-message {
  color: red;
  margin-bottom: 10px;
}

/* 예약 폼 성공 메시지 */
.reservation-form .success-message {
  color: green;
  margin-bottom: 10px;
}
</style>

<script type="text/javascript">
	function isValidDateFormat(data){
		if(data.length !== 8 && data.length !== 10) return false;
			
		let p = /(\.)|(\-)|(\/)/g;
		data = data.replace(p, "");
		if(data.length !== 8) return false;
		
		let format = /^[12][0-9]{7}$/;
		if(! format.test(data)) return false;
	    
		let y = parseInt(data.substr(0, 4));
		let m = parseInt(data.substr(4, 2));
		let d = parseInt(data.substr(6));
	
		if(m<1 || m>12) return false;
		let lastDay = (new Date(y, m, 0)).getDate();
		if(d<1 || d>lastDay) return false;
		
		return true;
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
	<div class="reservation-form">
		<form name="resForm" method="post" >
		  <label for="meetingroom">회의실</label>
		  <select id="meetingroom" name="meroom_id">
       			<option value="">:: 회의실 선택 ::</option>
	       		<c:forEach var="vo" items="${listMeetingroom}">
	       			<option value="${vo.meroom_id}">
	       				${vo.meroom_name}
	       			</option>
	       		</c:forEach>
          </select>
		
		  <label>예약자</label>
		  <span>${sessionScope.member.emp_name}</span>
		
		  <label for="date">예약 날짜</label>
		  <input type="date" id="meroom_resdate" name="meroom_resdate" value="${dto.meroom_resdate}">
		
		  <label for="start-time">시작 시간</label>
		  <input type="time" id="res_starttime" name="res_starttime" value="${dto.res_starttime}">
		
		  <label for="end-time">종료 시간</label>
		  <input type="time" id="res_endtime" name="res_endtime" value="${dto.res_endtime}">
		
		  <label for="res_content">예약 내용</label>
		  <input type="text" id="res_content" name="res_content" value="${dto.res_content}" placeholder="예약 내용을 입력하세요">
		
		  <button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='write'?'등록하기':'수정완료'}</button>
		  <button type="reset" class="btn">다시입력</button>
		  <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/reservation/main';">${mode=='write'?'등록취소':'수정취소'}</button>
		</form>
		
		  <div class="error-message"></div>
		  <div class="success-message"></div>
	</div>
</div>

<script type="text/javascript">
function sendOk(){
    const f = document.resForm;

	let str = f.meroom_id.value;
    if(!str) {
        alert("회의실을 입력하세요. ");
        f.meroom_id.focus();
        return false;
    }

    str = f.meroom_resdate.value.trim();
	if(! isValidDateFormat(f.meroom_resdate.value)) {
		alert("날짜를 입력하세요.");
		f.meroom_resdate.focus();
		return false;
	}
	
	str = f.res_starttime.value.trim();
	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.res_starttime.value)) {
		alert("시작시간을 입력하세요.");
		f.res_starttime.focus();
		return false;
	}
	
	str = f.res_endtime.value.trim();
	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.res_endtime.value)) {
		alert("시간을 입력하세요.");
		f.res_endtime.focus();
		return false;
	}

	f.action = "${pageContext.request.contextPath}/reservation/${mode}";
	f.submit();
}
</script>

</body>
</html>
