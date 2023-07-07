<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	function sendOk() {
	     const f = document.empForm;
	 	 let str;
	 	str = f.emp_name.value.trim();
	     if(!str) {
	         alert("이름을 입력하세요. ");
	         f.name.focus();
	         return;
	     }

	     str = f.emp_email.value.trim();
	     if(!str) {
	         alert("이메일을 입력하세요. ");
	         f.email.focus();
	         return;
	     }
	     
	     str = f.emp_rrn.value.trim();
	     if(!str) {
	         alert("주민번호을 입력하세요. ");
	         f.rrn.focus();
	         return;
	     }
	     
	     str = f.emp_tel.value.trim();
	     if(!str) {
	         alert("전화번호을 입력하세요. ");
	         f.tel.focus();
	         return;
	     }	     
	     
	     str = f.emp_join_date.value.trim();
	     if(!str) {
	         alert("입사일을 입력하세요. ");
	         f.startDate.focus();
	         return;
	     }
	     
	     if(! f.pos_no.value) {
		 		alert("직위를 선택하세요.");
		 		f.pos_no.focus();
		 		return false;
		 }
	     
	     
	     str = f.pos_startdate.value.trim();
	     if(!str) {
	         alert("직위 시작일을 입력하세요. ");
	         f.positionStartDate.focus();
	         return;
	     }
	     
	     /*
	     if(! f.top_dept_no.value) {
	 		alert("부서를 선택하세요.");
	 		f.top_dept_no.focus();
	 		return false;
		 }
		    */

	     if(! f.dept_no.value) {
		 	alert("부서를 선택하세요.");
		 	f.dept_no.focus();
			return false;
		 }

	
	     str = f.dept_startdate.value.trim();
	     if(!str) {
	         alert("부서발령일을 입력하세요. ");
	         f.departmentStartDate.focus();
	         return;
	     }

	     f.action = "${pageContext.request.contextPath}/insaManage/write";
	     f.submit();
	}
</script>

<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}




/*
$(function(){
	$("form select[name=top_dept_no]").change(function(){
		let top_dept_no = $(this).val();
		
		$("form select[name=dept_no]").find('option').remove().end()
			.append("<option value=''>:: 부서 선택 ::</option>");	
		
		if(! top_dept_no) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/insaManage/listDeptSubCategory";
		let query = "top_dept_no="+top_dept_no;
		
		const fn = function(data) {
			$.each(data.listDeptSubCategory, function(index, item){
				let dept_no = item.dept_no;
				let dept_name = item.dept_name;
				let s = "<option value='"+dept_no+"'>"+dept_name+"</option>";
				$("form select[name=dept_no]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});
*/
</script>

<div class="left-side-bar">
    <ul>
		<li>
			<a href="${pageContext.request.contextPath}/myInsa/profile">나의 인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/profile">&nbsp;인사정보</a> 
			<a href="${pageContext.request.contextPath}/myInsa/insaCard">&nbsp;인사기록카드</a> 
			<a href="${pageContext.request.contextPath}/myInsa/workRecord">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a>
			<a href="${pageContext.request.contextPath}/myInsa/organization">&nbsp;조직도</a>
		</li>
		<c:choose>
        <c:when test="${sessionScope.member.dept_no >= 60 && sessionScope.member.dept_no <= 70}">
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
		<div>
		<h2 style="padding-left: 50px;"> | 사원 정보 입력</h2>
		
   		<form name="empForm" method="post" enctype="multipart/form-data">
   		<br><br>
   		
   		<div class="profile-content1 border-radius">
			<table class="profile-content1-table">
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input type="text" id="name"  name="emp_name" value="${dto.emp_name}" placeholder="이름을 입력하세요." style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td>
						<input type="email" id="email"  name="emp_email" value="${dto.emp_email}" placeholder="이메일을 입력하세요.('@'포함)" style="width: 400px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="rrn">주민번호</label></th>
					<td>
						<input type="text" id="rrn"  name="emp_rrn" value="${dto.emp_rrn}" placeholder="주민번호를 입력하세요.('-'포함)" style="width: 400px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="tel">핸드폰</label></th>
					<td>
						<input type="text" id="phone"  name="emp_tel" value="${dto.emp_tel}" placeholder="번호를 입력하세요.('-'포함)" style="width: 300px; height : 30px;"> 
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<label for="zip">우편번호</label>
				        <div>
				        <input type="text" id="emp_zip"  name="emp_zip" placeholder="우편번호" value="${dto.emp_zip}" readonly="readonly" style="width: 200px; height : 30px; margin-bottom:5px;">
				        <button class="btn" type="button" onclick="daumPostcode();" style="margin-left: 3px;">우편번호검색</button>
				        </div>
				        <label for="addr">주소</label>
				        <div>
				        <input type="text" id="emp_addr1" name="emp_addr1" placeholder="기본 주소" value="${dto.emp_addr1}" readonly="readonly" style="width: 300px; height : 30px;">
				        <input type="text" id="emp_addr2" name="emp_addr2" placeholder="상세 주소" value="${dto.emp_addr2}" style="width: 200px; height : 30px;">
				        </div>
					</td>
				</tr>
				<tr>
					<th><label for="photo">사진</label></th>
					<td>
						<input type="file" id="photo" name="selectFile" accept="image/*" value="${dto.emp_picture}" style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="startDate">입사일</label></th>
					<td>
						<input type="date" id="startDate"  name="emp_join_date" value="${dto.emp_join_date}" placeholder="입사일을 입력하세요." style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="positionCode">직위</label></th>
					<td>
						<select name="pos_no" style="width: 200px; height : 30px;">
			        		<option value="">:: 직위 선택 ::</option>
			        		<c:forEach var="vo" items="${listPosCategory}">
			        			<option value="${vo.pos_no}" ${dto.top_pos_no == vo.pos_no ? "selected = 'selected' " : ""}>
			        				${vo.pos_name}
			        			</option>
			        		</c:forEach>
			        	</select>
					</td>
				</tr>
				<tr>
					<th><label for="positionStartDate">직위시작일</label></th>
					<td>
						<input type="date" id="positionStartDate"  name="pos_startdate" value="${dto.pos_startdate}" style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th><label for="departmentCode">부서</label></th>
					<td>
						<select name="dept_no" style="width: 200px; height : 30px;">
			        		<option value="">:: 부서 선택 ::</option>
			        		<c:forEach var="vo" items="${listDeptCategory}">
			        			<option value="${vo.dept_no}" ${dto.top_dept_no == vo.dept_no ? "selected = 'selected' " : ""}>
			        				${vo.dept_name}
			        			</option>
			        		</c:forEach>
			        	</select>
					</td>
				</tr>
				<tr>
					<th><label for="departmentStartDate">부서발령일</label></th>
					<td>
						<input type="date" id="departmentStartDate"  name="dept_startdate" value="${dto.dept_startdate}" style="width: 200px; height : 30px;">
					</td>
				</tr>
				<tr>
					<th></th>
					<td align="right">
						<button type="button" onclick="sendOk();" class="btn">등록하기</button>
	        			<button type="reset" class="btn">다시입력</button>
        			</td>
				</tr>
			</table>
		</div>

		<!-- 
        <label for="departmentCode">부서</label>
        <div>
        	<select name="top_dept_no">
        		<option value="">:: 상위 부서 선택 ::</option>
        		<c:forEach var="vo" items="${listDeptCategory}">
        			<option value="${vo.dept_no}" ${dto.top_dept_no==vo.dept_no?"selected='selected'":""}>
        				${vo.dept_name}
        			</option>
        		</c:forEach>
        	</select>
        	
        	<select name="dept_no">
        		<option value="">:: 부서 선택 ::</option>
        		<c:forEach var="vo" items="${listDeptSubCategory}">
        			<option value="${vo.dept_no}" ${dto.dept_no==vo.dept_no?"selected='selected'":""}>
        				${vo.dept_name}
        			</option>
        		</c:forEach>
        	</select>
        </div>
        <br><br>
		 -->
   		</form>   		
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