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

<script type="text/javascript">
function sendOk() {
	const f = document.insaProfileForm;
	let str;
	
	str = f.emp_email.value.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email.focus();
        return;
    }
	
	 str = f.emp_tel.value.trim();
     if(!str) {
         alert("전화번호을 입력하세요. ");
         f.tel.focus();
         return;
     }
     
     f.action = "${pageContext.request.contextPath}/myInsa/profileUpdate";
     f.submit();
}
</script>


<div class="left-side-bar">
    <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="${pageContext.request.contextPath}/myInsa/holidayArticle">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70 || sessionScope.member.dept_no == 1}">
            <!-- dept_no가 60~70 사이일 때만 아래 <li> 태그들이 보이도록 처리하기 -->
            <li>
                <a href="${pageContext.request.contextPath}/insaManage/list">인사관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/list">&nbsp;사원관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/workList">&nbsp;근태관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidayList">&nbsp;휴가관리</a>
                <a href="${pageContext.request.contextPath}/insaManage/holidaySetting">&nbsp;휴가설정</a>
            </li>
        </c:when>
        <c:otherwise>
            <!-- dept_no가 60~ 70 사이가 아닐 때는 두 번째 <li> 태그를 출력하지 않게 -->
        </c:otherwise>
   	 	</c:choose>
	</ul>
</div>

<div class="right-contentbody">
	<div class="div-container">
	
	<div class="div-left3">
		<div class="div-top3">
		<table style="width: 100%; height: 100%;">
			<tr>
				<td>
					<div class="profile-picture border-radius">
						<div style="height: 100%">
							<div class="insa-image">
								<img src="${pageContext.request.contextPath}/uploads/insaManage/${dto.emp_save_filename}" style="width: 100%; height: 85%;">
							</div>
							<div style="width: 100%; margin-bottom: 10px;" align="center">${dto.emp_no}</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		</div>
		
		<div class="div-bottom3">
		<table style="width: 100%;" class="profile-picture border-radius">
				<tr>
					<th class="th-left">부서</th>
					<td>${dto.dept_name}</td>
				</tr>
				<tr>
					<th class="th-left">직급</th>
					<td>${dto.pos_name}</td>
				</tr>
				<tr>
					<th class="th-left">입사일</th>
					<td>${dto.emp_join_date}</td>
				</tr>
				<tr>
					<th class="th-left">사원상태</th>
					<td>${dto.emp_status==0?"재직":(dto.emp_status==1?"휴직":"퇴사")}</td>
				</tr>
		</table>
		</div>
	</div>
	
		<div class="profile-content1 div-right3" style="flex-direction: row;">
		<form name="insaProfileForm" method="post" enctype="multipart/form-data">
		<table class="profile-content1-table">
			<tr>
				<th><h3> | 인적사항 </h3></th>
				<td></td>
			</tr>
			<tr>
				<th class="th-left">이름</th>
				<td>${dto.emp_name}</td>
			</tr>
			<tr>
				<th class="th-left">사번</th>
				<td>${dto.emp_no}</td>
			</tr>
			<tr>
				<th class="th-left">생년월일</th>
				<td>${dto.emp_rrn}</td>
			</tr>
			<tr>
				<th class="th-left">비밀번호</th>
				<td>
					<input type="password" id="emp_pwd" name="emp_pwd" value="${dto.emp_pwd}" placeholder="재 설정할 비밀번호를 입력하세요." style="width: 200px; height : 30px;">
				</td>
			</tr>
			<tr>
				<th class="th-left">사진</th>
				<td>
					<input type="file" id="emp_save_filename" name="selectFile" accept="image/*" 
						value="${dto.emp_save_filename}"
						style="width: 100%; height: 85%;">
				</td>
			</tr>
			<tr>
				<th class="th-left">이메일</th>
				<td>
					<input type="text" id="emp_email"  name="emp_email" value="${dto.emp_email}" placeholder="이메일을 입력하세요.('@'포함)" style="width: 400px; height : 30px;">
				</td>
			</tr>
			<tr>
				<th class="th-left">주소</th>
				<td>
					<label for="zip">우편번호</label>
			        <div>
			        <input type="text" id="emp_zip"  name="emp_zip" placeholder="우편번호" value="${dto.emp_zip}" readonly="readonly" style="width: 200px; height : 30px; margin-bottom:5px;">
			        <button class="btn" type="button" onclick="daumPostcode();" style="margin-left: 3px;">우편번호검색</button>
			        </div>
			        <label for="addr">주소</label>
			        <div>
			        <input type="text" id="emp_addr1" name="emp_addr1" placeholder="기본 주소" value="${dto.emp_addr1}" readonly="readonly" style="width: 400px; height : 30px;">
			        <input type="text" id="emp_addr2" name="emp_addr2" placeholder="상세 주소" value="${dto.emp_addr2}" style="width: 100px; height : 30px;">
			        </div>
				</td>
			</tr>
			<tr>
				<th class="th-left">전화번호</th>
				<td>
					<input type="text" id="emp_tel"  name="emp_tel" value="${dto.emp_tel}" placeholder="번호를 입력하세요.('-'포함)" style="width: 300px; height : 30px;"> 
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width: 100%;" align="right">
					<button type="button" onclick="sendOk();" class="btn">수정완료</button>
					<button type="reset" class="btn">다시 작성하기</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myInsa/profile';" class="btn">수정취소</button>
					<input type="hidden" name="emp_no" value="${dto.emp_no}">
				</td>
			</tr>
			</table>
		</form>
		</div>	
		
	</div>
</div>	

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
