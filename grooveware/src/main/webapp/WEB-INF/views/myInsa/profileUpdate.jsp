<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.profile-name {
	width: 10%;
	height: 50px;
	padding-top: 10px;
	text-align: center;
}
</style>


<div class="left-side-bar">
    <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="#">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
		</li>
		<!-- <li class="insateam">  -->
		<li>
			<a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a> 
			<a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">&nbsp;조직도</a>
		</li>
	</ul>
</div>


<div class="right-contentbody">
	<div style="display: flex; width: 100%; height: 100%;">
		<table style="width: 100%;">
			<tr>
				<td>
					<div class="profile-picture border-radius">
						<div>
							<div style="width: 100%; margin-bottom: 10px;" align="center">
								<input type="text" value="${dto.emp_no}"> 
								${dto.emp_no}
							</div>
							<div style="width: 100%; height: 180px; border: 1px solid red;">
								<input type="file" value="${dto.emp_picture}">
								<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_picture}">
							</div>
							<div style="width: 100%; margin-top: 10px;" align="center">
								<input type="text" value="${dto.emp_email}">
								${dto.emp_email}
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>

		<div class="profile-content1 border-radius">
			<table class="profile-content1-table">
				<tr>
					<td>이름</td>
					<td>
						${dto.emp_name}
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						${dto.emp_rrn}
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>${dto.dept_name}</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>${dto.pos_name}</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td>${dto.emp_join_date}</td>
				</tr>
				<tr>
					<td>사원상태</td>
					<td>${dto.emp_status==0?"재직":(dto.emp_status==1?"휴직":"퇴사")}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<label for="zip">우편번호:</label>
				        <div>
				        <input type="text" id="emp_zip"  name="emp_zip" placeholder="우편번호" value="${dto.emp_zip}" disabled="disabled" readonly="readonly" style="width: 200px; height : 30px; margin-bottom:5px;">
				        <button class="btn" type="button" onclick="daumPostcode();" style="margin-left: 3px;">우편번호검색</button>
				        </div>
				        <label for="addr">주소:</label>
				        <div>
				        <input type="text" id="emp_addr1" name="emp_addr1" placeholder="기본 주소" value="${dto.emp_addr1}" readonly="readonly">
				        <input type="text" id="emp_addr2" name="emp_addr2" placeholder="상세 주소" value="${dto.emp_addr2}" readonly="readonly">
				        </div>
        						${dto.emp_address}
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" value="${dto.emp_tel}">
						${dto.emp_tel}
					</td>
				</tr>
			</table>
			<div>
				<button type="button" onclick="" class="btn">수정완료</button>
				<button type="reset" class="btn">다시 작성하기</button>
				<button type="button" onclick="" class="btn">수정취소</button>
			</div>

		</div>
	</div>
</div>

<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('emp_zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('emp_addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('emp_addr2').focus();
        }
    }).open();
}   	
</script>
