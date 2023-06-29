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
		<div>
		<h2>사원 정보 입력</h2>
		
   		<form name="empForm" method="post" enctype="multipart/form-data">
   		<br><br>
   		
   		<label for="name">이름:</label>
        <input type="text" id="name"  name="emp_name" value="${dto.emp_name}">
        <br><br>

        <label for="email">이메일:</label>
        <input type="email" id="email"  name="emp_email" value="${dto.emp_email}">
        <br><br>
        
        <label for="rrn">주민번호:</label>
        <input type="text" id="rrn"  name="emp_rrn" value="${dto.emp_rrn}">
        <br><br>

        <label for="phone">핸드폰번호:</label>
        <input type="text" id="phone"  name="emp_tel" value="${dto.emp_tel}">
        <br><br>

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
        <br><br>
        
        
        <label for="startDate">입사일:</label>
        <input type="date" id="startDate"  name="emp_join_date" value="${dto.emp_join_date}">
        <br><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" name="selectFile" accept="image/*" value="${dto.emp_picture}">
        <br><br>

        <label for="positionCode">직위:</label>
        <div>
        	<select name="pos_no">
        		<option value="">:: 직위 선택 ::</option>
        		<c:forEach var="vo" items="${listPosCategory}">
        			<option value="${vo.pos_no}" ${dto.top_pos_no == vo.pos_no ? "selected = 'selected' " : ""}>
        				${vo.pos_name}
        			</option>
        		</c:forEach>
        	</select>
        </div>
        <br><br>

        <label for="positionStartDate">직위시작날짜:</label>
        <input type="date" id="positionStartDate"  name="pos_startdate" value="${dto.pos_startdate}">
        <br><br>

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
		 
		 
        <label for="departmentCode">부서:</label>
        <div>
        	<select name="dept_no">
        		<option value="">:: 부서 선택 ::</option>
        		<c:forEach var="vo" items="${listDeptCategory}">
        			<option value="${vo.dept_no}" ${dto.top_dept_no == vo.dept_no ? "selected = 'selected' " : ""}>
        				${vo.dept_name}
        			</option>
        		</c:forEach>
        	</select>
        </div>
        <br><br>
		 
		 
		 
        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate"  name="dept_startdate" value="${dto.dept_startdate}">
        <br><br>

        <button type="button" onclick="sendOk();">등록하기</button>
        <button type="reset">다시입력</button>
        <input type="hidden" name="imageFilename" value="${dto.emp_picture}">
   		</form>   		
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