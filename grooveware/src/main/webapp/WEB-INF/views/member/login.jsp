<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function sendLogin() {
		const f = document.loginForm;

		let str = f.emp_no.value;
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.emp_no.focus();
			return;
		}

		str = f.emp_pwd.value;
		if (!str) {
			alert("패스워드를 입력하세요. ");
			f.emp_pwd.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/member/login";
		f.submit();
	}
</script>

			<form name="loginForm" method="post" class="loginForm">
				<div class="members-form">
					<div class="textBox">
						<div class="row text-center fontColor">
							<h1>GrooveWare</h1>
						</div>
						<div class="row">
							<label for="login-userId" >사원번호</label> <input name="emp_no"
								type="text" class="form-control" id="login-userId"
								placeholder="사원번호">
						</div>
						<div class="row">
							<label for="login-password">비밀번호</label> <input name="emp_pwd"
								type="password" class="form-control" id="login-password"
								autocomplete="off" placeholder="패스워드">
						</div>
						<div class="row text-center">
							<button type="button" class="btn" onclick="sendLogin();">로그인</button>
						</div>
						<div class="row" style="display: flex;">
							<span><input name="myCheck" type="checkbox"></span> <span style="font-size: 13px;">내
								계정 기억하기</span>
						</div>

						<div class="row">
							<div class="borderLine">
								<span style="font-weight: bold;">공지사항</span> <a href=""><i class="fa-solid fa-plus" style="margin-right: 5px;"></i>더보기</a>
							</div>
							<table  class="row"  >
							<tbody class="row bold" >
									<tr class="noticelist">
										<td>공지 리스트 1</td>
									</tr>
									<tr class="noticelist">
										<td>공지 리스트 2</td>
									</tr>
									<tr class="noticelist">
										<td>공지 리스트 3</td>
									</tr>
							</tbody>
							</table>
						</div>
						<div class="row box" style="font-size: 13px;">
							<div>
								<span>고객센터: 1577-6000</span> | <span>고객지원</span>
							</div>
							© GrooveWare Corp.All rights reserved.
						</div>
					</div>
				</div>
			</form>