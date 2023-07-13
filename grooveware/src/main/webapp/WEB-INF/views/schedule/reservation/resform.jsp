<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.resForm-table{
  margin-bottom: 30px;
}

.resForm{
  width: 100%;
  padding: 10px;
  margin : 10px 0;
  border-spacing: 0;
}
.res-write-table{
  padding: 15px 15px;
  border-top: 2px solid #c1c1c1;
  
}

.res-write-table label{
  width: 30%;
  text-align: center;
  margin-left : 30px;
  margin-right : 20px;

}

.meetingroom,
.res-write-table input, 
.res-write-table textarea{
  width: 80%;
  padding: 10px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
  margin-left : 20px;
  margin-right : 30px;
}

.res-write-btn,
.res-reset-btn,
.res-cancel-btn{
	height: 36px;
	width : 80px;
	border-radius: 5px;
    padding: 5px 10px;
    background-color: #eaeaea; 
    color: #404040;
    border: none;
    cursor: pointer;
    font-weight: 550;
    margin: 0 10px;
}

.res-btn{
	margin-top: 30px;
	text-align: center;
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
          	  <a href="${pageContext.request.contextPath}/reservation/myres">&nbsp;내 예약현황</a>
          <li>
      </ul>
</div>

<div class="right-contentbody">
	<div class="title_container">
		<div class="resForm-table">
			<div>
				<h2><span><i class="fa-solid fa-pen-to-square"></i></span>&nbsp;회의실 예약</h2>
			</div>
		</div>
	</div>	
	<div class="reservation-form">
		<form name="resForm" method="post" >
			<div class="res-write-table">
				  <label class="res-write-option" for="meetingroom">회&nbsp;&nbsp;&nbsp;의&nbsp;&nbsp;&nbsp;실</label>
				  <select id="meetingroom" name="meroom_id" class="meetingroom">
		       			<option value="">:: 회의실 선택 ::</option>
			       		<c:forEach var="vo" items="${listMeetingroom}">
			       			<option value="${vo.meroom_id}">
			       				${vo.meroom_name}
			       			</option>
			       		</c:forEach>
		          </select>
			</div>
			
			<div class="res-write-table">	
			  <label class="res-write-option" >예&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;자</label>
			  <span style="margin-left : 20px;">${sessionScope.member.emp_name}</span>
			</div>
			
			<div class="res-write-table">
			  <label class="res-write-option" for="date">예&nbsp;약&nbsp;날&nbsp;짜</label>
			  <input type="date" id="meroom_resdate" name="meroom_resdate" value="${dto.meroom_resdate}">
			</div>
			
			<div class="res-write-table">
			  <label class="res-write-option" for="start-time">시&nbsp;작&nbsp;시&nbsp;간</label>
			  <input type="time" id="res_starttime" name="res_starttime" value="${dto.res_starttime}">
			</div>
			
			<div class="res-write-table">
			  <label class="res-write-option"  for="end-time">종&nbsp;료&nbsp;시&nbsp;간</label>
			  <input type="time" id="res_endtime" name="res_endtime" value="${dto.res_endtime}">
			</div>
			
			<div class="res-write-table" style="border-bottom: 2px solid #c1c1c1;">
			  <label class="res-write-option"  for="res_content">예&nbsp;약&nbsp;내&nbsp;용</label>
			  <input type="text" id="res_content" name="res_content" value="${dto.res_content}" placeholder="예약 내용을 입력하세요">
			</div>
			
			<div class="res-btn">
			  <button type="button" class="res-write-btn" onclick="sendOk();">${mode=='write'?'예약하기':'수정완료'}</button>
			  <button type="reset" class="res-reset-btn">다시입력</button>
			  <button type="button" class="res-cancel-btn" onclick="location.href='${pageContext.request.contextPath}/reservation/main';">${mode=='write'?'취소하기':'수정취소'}</button>
			</div>
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
