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
		  <label for="room">회의실:</label>
		  <input type="text" id="room" name="room" placeholder="회의실을 입력하세요">
		
		  <label for="booker">예약자:</label>
		  <input type="text" id="booker" name="booker" placeholder="예약자를 입력하세요">
		
		  <label for="date">예약 날짜:</label>
		  <input type="date" id="date" name="date">
		
		  <label for="start-time">시작 시간:</label>
		  <input type="time" id="start-time" name="start-time">
		
		  <label for="end-time">종료 시간:</label>
		  <input type="time" id="end-time" name="end-time">
		
		  <label for="content">예약 내용:</label>
		  <input type="text" id="content" name="content" placeholder="예약 내용을 입력하세요">
		
		  <button type="submit">예약하기</button>
		
		  <div class="error-message"></div>
		  <div class="success-message"></div>
	</div>
</div>

</body>
</html>
