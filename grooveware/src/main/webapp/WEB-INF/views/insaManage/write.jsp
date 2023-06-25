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
	     

	     str = f.emp_address.value.trim();
	     if(!str) {
	         alert("주소을 입력하세요. ");
	         f.address.focus();
	         return;
	     }

	     
	     str = f.emp_join_date.value.trim();
	     if(!str) {
	         alert("입사일을 입력하세요. ");
	         f.startDate.focus();
	         return;
	     }
	     
	     if(! f.top_pos_no.value) {
	 		alert("직위를 선택하세요.");
	 		f.top_pos_no.focus();
	 		return false;
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
	     
	     if(! f.top_dept_no.value) {
	 		alert("부서를 선택하세요.");
	 		f.top_dept_no.focus();
	 		return false;
		 }
		     
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

$(function(){
	$("form select[name=top_pos_no]").change(function(){
		let top_pos_no = $(this).val();
		
		$("form select[name=pos_no]").find('option').remove().end()
			.append("<option value=''>:: 직위 선택 ::</option>");	
		
		if(! top_pos_no) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/insaManage/list/listPosSubCategory";
		let query = "top_pos_no="+top_pos_no;
		
		const fn = function(data) {
			$.each(data.listPosSubCategory, function(index, item){
				let pos_no = item.pos_no;
				let pos_name = item.pos_name;
				let s = "<option value='"+pos_no+"'>"+pos_name+"</option>";
				$("form select[name=pos_no]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});

$(function(){
	$("form select[name=top_dept_no]").change(function(){
		let top_dept_no = $(this).val();
		
		$("form select[name=dept_no]").find('option').remove().end()
			.append("<option value=''>:: 부서 선택 ::</option>");	
		
		if(! top_dept_no) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/insaManage/list/listDeptSubCategory";
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

</script>

<div class="left-side-bar">
    <ul>
		<li>
			<a href="#">나의 인사정보</a> 
			<a href="#">&nbsp;인사정보</a> 
			<a href="#">&nbsp;인사기록카드</a> 
			<a href="#">&nbsp;내 출근 기록</a> 
			<a href="#">&nbsp;내 휴가 기록</a></li>
		<li class="insateam">
			<a href="#">인사관리</a> 
			<a href="#">&nbsp;근태관리</a>
			<a href="#">&nbsp;휴가관리</a> 
			<a href="#">&nbsp;휴가설정</a> 
			<a href="#">&nbsp;조직도</a></li>
	</ul>
</div>
   <div class="right-contentbody">
		<div>
		<h2>사원 정보 입력</h2>
		
   		<form name="empForm" method="post">
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

        <label for="address">주소:</label>
        <input type="text" id="address"  name="emp_address" value="${dto.emp_address}" style="width: 300px;">
        <br><br>
        
        
        <label for="startDate">입사일:</label>
        <input type="date" id="startDate"  name="emp_join_date" value="${dto.emp_join_date}">
        <br><br>

        <label for="photo">사진:</label>
        <input type="file" id="photo" accept="image/*" value="${dto.emp_picture}">
        <br><br>

        <label for="positionCode">직위코드:</label>
        <div>
        	<select name="top_pos_no">
        		<option value="">:: 상위 직위 선택 ::</option>
        		<c:forEach var="vo" items="${listPosCategory}">
        			<option value="${vo.pos_no}" ${top_pos_no == vo.pos_no ? "selected = 'selected' " : ""}>
        				${vo.pos_name}
        			</option>
        		</c:forEach>
        	</select>
        	<select name="pos_no">
        		<option value="">:: 직위 선택 ::</option>
        		<c:forEach var="vo" items="${listPosSubCategory}">
        			<option value="${vo.pos_no}" ${dto.pos_no==vo.pos_no?"selected='selected'":""}>
        				${vo.pos_name}
        			</option>
        		</c:forEach>
        	</select>
        </div>
        <br><br>

        <label for="positionStartDate">직위시작날짜:</label>
        <input type="date" id="positionStartDate"  name="pos_startdate" value="${dto.pos_startdate}">
        <br><br>

        <label for="departmentCode">부서</label>
        <div>
        	<select name="top_dept_no">
        		<option value="">:: 상위 부서 선택 ::</option>
        		<c:forEach var="vo" items="${listDeptCategory}">
        			<option value="${vo.top_dept_no}" ${top_dept_no==vo.dept_no?"selected='selected'":""}>
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

        <label for="departmentStartDate">부서발령날짜:</label>
        <input type="date" id="departmentStartDate"  name="dept_startdate" value="${dto.dept_startdate}">
        <br><br>

        <button type="button" onclick="sendOk()">등록하기</button>
        <button type="reset">다시입력</button>
   		</form>   		
   		</div>
   	</div>