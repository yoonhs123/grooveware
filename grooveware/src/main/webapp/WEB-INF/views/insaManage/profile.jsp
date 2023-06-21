<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="myModal" class="modal-profile">
    <div class="modal-content-profile">
      <span class="close-profile">&times;</span>
      <h2>사용자 정보 입력</h2>
      <form id="userForm">
        <label for="name">이름:</label>
        <input type="text" id="name" required><br>

        <label for="ssn">주민번호:</label>
        <input type="text" id="ssn" required><br>

        <label for="phone">핸드폰번호:</label>
        <input type="text" id="phone" required><br>

        <label for="address">주소:</label>
        <input type="text" id="address" required><br>

        <label for="email">이메일:</label>
        <input type="email" id="email" required><br>

        <label for="startDate">입사일:</label>
        <input type="date" id="startDate" required><br>

        <label for="accountStatus">계정상태:</label>
        <input type="text" id="accountStatus" required><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" accept="image/*"><br>

        <label for="positionCode">직위코드:</label>
        <input type="text" id="positionCode" required><br>

        <label for="positionStartDate">직위시작날짜:</label>
        <input type="date" id="positionStartDate" required><br>

        <label for="departmentCode">부서코드:</label>
        <input type="text" id="departmentCode" required><br>

        <label for="departmentStartDate">부서시작날짜:</label>
        <input type="date" id="departmentStartDate" required><br>

        <input type="button" value="등록">
      </form>
    </div>
  </div>
