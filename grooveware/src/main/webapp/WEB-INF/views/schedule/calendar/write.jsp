<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.club-write{
  width: 100%;
  padding: 10px;
  margin : 10px 0;
  border-spacing: 0;
}

.club-write td{
  padding: 15px 15px;
  border-top: 1.6px solid #c1c1c1;
}

.club-write-left{
  width: 17%;
  text-align: center;
  background: #f6f6f6;
}

.club-write input, 
.club-write textarea
{
  width: 50%;
  padding: 10px;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
}

.club-write textarea{
  height: 150px;
}

.write-form tr>td:first-child {
	text-align: center;
	font-weight : bold;
}

.form-check-input {
	
     display: inline;
}

</style>

<script type="text/javascript">
function sendOk() {
    const f = document.scheduleForm;
	let str;
	
	if( ! f.subject.value.trim() ) {
		f.subject.focus();
		return;
	}
	
	if(! f.category_num.value ) {
		f.category_num.focus();
		return;
	}
	
	if( ! f.sday.value ) {
		f.sday.focus();
		return;
	}
	
	if( f.eday.value ) {
		let s1 = f.sday.value.replace(/-/g, "");
		let s2 = f.eday.value.replace(/-/g, "");
		if(s1 > s2) {
			f.sday.focus();
			return;
		}
	}

	if( f.etime.value ) {
		let s1 = f.stime.value.replace(/:/g, "");
		let s2 = f.etime.value.replace(/:/g, "");
		if(s1 > s2) {
			f.stime.focus();
			return;
		}
	}
	
	if( ! f.repeat_cycle.value ) {
		f.repeat_cycle.value = "0";
	}
	
	if( f.repeat.value !=  "0" && ! /^(\d){1,2}$/g.test(f.repeat_cycle.value) ) {
		f.repeat_cycle.focus();
		return;
	}
	
	if( f.repeat.value !=  "0" && f.repeat_cycle.value < 1 ) {
		f.repeat_cycle.focus();
		return;
	}	

	// 종일일정의 경우 종료일자는 종료일자+1로 저장해서 불러와야 함
	if($("#form-eday").val() && $("#form-all_day").is(":checked")) {
		$("#form-eday").val(daysLater($("#form-eday").val(), 2));
	}
	
    f.action = "${pageContext.request.contextPath}/schedule/calendar/${mode}";
    f.submit();
}

$(function(){
	$("#form-all_day").click(function(){
		if(this.checked === true) {
			$("#form-stime").val("").hide();
			$("#form-etime").val("").hide();
		} else if(this.checked === false && $("#form-repeat").val() === "0"){
			$("#form-stime").val("00:00").show();
			$("#form-etime").val("00:00").show();
		}
	});

	$("#form-sday").change(function(){
		$("#form-eday").val($("#form-sday").val());
	});
	
	let repeat_cycle = "${dto.repeat_cycle}";
	if(repeat_cycle && repeat_cycle != "0") {
		$("#form-all_day").prop("checked", true);
		$("#form-all_day").prop("disabled", true);

		$("#form-stime").val("").hide();
		$("#form-etime").val("").hide();
		$("#form-eday").val("");
		$("#form-etime").val("");
		$("#form-eday").closest("tr").hide();
	}
	
	$("#form-repeat").change(function(){
		if($(this).val() === "0") {
			$("#form-repeat_cycle").val("0").hide();
			
			$("#form-all_day").prop("checked", true);
			$("#form-all_day").prop("disabled", false);
			
			$("#form-eday").val($("#form-sday").val());
			$("#form-eday").closest("tr").show();
		} else {
			$("#form-repeat_cycle").show();
			
			$("#form-all_day").prop("checked", true);
			$("#form-all_day").prop("disabled", true);

			$("#form-stime").val("").hide();
			$("#form-etime").val("").hide();
			$("#form-eday").val("");
			$("#form-etime").val("");
			$("#form-eday").closest("tr").hide();
		}
	});
});

$(function(){
	$("#form-color").css("background-color", $("#form-color").val());
	$("#form-color").css("color", "#fff");
	$("#form-color").change(function(){
		$(this).css("background-color", $(this).val());
	});
});
</script>

<div class="left-side-bar">
      
        <ul> 
            <li>
                <a href="${pageContext.request.contextPath}/schedule/calendar/main">캘린더</a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/reservation/main">자원 예약</a>
                <a href="${pageContext.request.contextPath}/reservation/main">&nbsp;회의실 예약</a>
            <li>
        </ul>
</div>

<div class="right-contentbody">
			<div class="container">	
		<div class="body-title">
			<h2> 일정관리 </h2>
		</div>
		
		<div class="body-main">
		
			<form name="scheduleForm" method="post">
				<table class="club-write  write-form">
					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">제 목</td>
						<td>
								
									<input type="text" name="subject" id="form-subject" class="form-control" value="${dto.subject}">
									<small class="form-control-plaintext">&nbsp;* 제목은 필수 입니다.</small>
								
						</td>
					</tr>

					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">일정분류</td>
						<td>
							
								
									<select name="category_num" id="form-categoryNum" class="form-select">
										<%-- <option value="0">설정하지 않음</option> --%>
										<c:forEach var="ct" items="${listCategory}">
											<c:if test="${ ((sessionScope.member.dept_no == '61' || sessionScope.member.dept_no == '62') && ct.category_num == 0) 
														|| 	ct.category_num == 1 
														|| sessionScope.member.dept_no == ct.category_num}">
												<option value="${ct.category_num}" ${dto.category_num == ct.category_num ? "selected='selected'":""}>${ct.category}</option>
											</c:if>
										</c:forEach>
									</select>
								
						</td>
					</tr>

					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">종일일정</td>
						<td class="">
							
							<input type="checkbox" style="width: 2%;" name="all_day" id="form-all_day" class="form-check-input" 
								 value="1" ${dto.all_day == 1 ? "checked='checked' ":"" } >
							<label class="form-check-label" for="form-all_day"> 하루종일</label>
								
						</td>
					</tr>

 					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">시작일자</td>
						<td>
							
									<input type="date" name="sday" id="form-sday" class="form-control" value="${dto.sday}">
								
								
									<input type="time" name="stime" id="form-stime" class="form-control" value="${dto.stime}"
										style="display: ${dto.all_day == 1 ? 'none;':'inline-block;'}">
									<small class="form-control-plaintext">&nbsp;* 시작날짜는 필수입니다.</small>
								
							
						</td>
					</tr>

 					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">종료일자</td>
						<td>
							
									<input type="date" name="eday" id="form-eday" class="form-control" value="${dto.eday}">
								
							
									<input type="time" name="etime" id="form-etime" class="form-control" value="${dto.etime}"
										style="display: ${dto.all_day==1 ? 'none;':'inline-block;'}">
									<small class="form-control-plaintext">&nbsp;* 종료일자는 선택사항이며, 시작일자보다 작을 수 없습니다.</small>
								
						</td>
					</tr>
					
					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">일정반복</td>
						<td>
							
									<select name="repeat" id="form-repeat" class="form-select">
										<option value="0" ${dto.repeat=="0"?"selected='selected'":""}>반복안함</option>
										<option value="1" ${dto.repeat=="1"?"selected='selected'":""}>년반복</option>
									</select>
								
								
									<input type="text" name="repeat_cycle" id="form-repeat_cycle" maxlength="2" class="form-control"
										style="display: ${dto.repeat==0 ? 'none;':'inline-block;'}"
										value="${dto.repeat_cycle}"
										placeholder="반복주기">
								
						</td>
					</tr>

					<tr class="club-write-table">
						<td class="club-write-left col-2" scope="row">메 모</td>
						<td>
							<textarea name="memo" id="form-memo" class="form-control" style="height: 90px; width : 100%">${dto.memo}</textarea>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'일정등록'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/schedule/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
		
	</div>
</div>