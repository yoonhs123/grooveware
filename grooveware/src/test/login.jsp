<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>spring</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.3.0/css/all.css">

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
@charset "UTF-8";

* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 16px;
	background-color: #efefef;
}

.members-form .btn {
	color: #ffffff;;
	border: 1px solid #999999;
	background-color: #4048a8;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	line-height: 30px;
	width: 100%;
}

.members-form {
	margin: 0 auto;
	background: #fefeff;
	padding: 30px 25px;
	box-shadow: 0 0 15px 0 rgb(2 59 109/ 10%);
	border-radius: 25px;
	height: 700px;
	width: 500px;
}

.members-form .row {
	margin-bottom: 1.5rem;
}

.members-form label {
	display: block;
	font-weight: 500;
	margin-bottom: 0.5rem;
	font-family: Verdana, sans-serif;
	font-size: 14px;
	font-weight: bold;
}

.members-form .form-control {
	display: block;
	width: 100%;
	padding: 7px 5px;
	
}

.members-form input {
	display: block;
	width: 100%;
	padding: 7px 5px;
	
}

.text-center {
	text-align: center;
}

input[name=myCheck] {
	position: relative;
    top: 2.5px;
    margin-right: 10px;
}

tr.noticelist td {
	padding: 10px 0px 10px;
	margin-bottom: 5px;
	border-bottom: 1px solid #efefef;
	font-size: 12px;
	color: #999999;
	width: 300px;
}

.borderLine {
	border-bottom: 1px solid black;
	padding-bottom: 10px;	
	display: flex; 
	justify-content: space-between;
	font-size: 14px; 
}

.textBox {
	max-width: 310px;
	margin : auto;
	margin-top: 50px;
}

.loginForm{
margin-top: 120px;
}

.box{
	color: #999999;
	text-align: center;
}

.fontColor{color: #4048a8; }
.bold{font-weight: bold;}

</style>

<script type="text/javascript">
	function sendLogin() {
		const f = document.loginForm;

		let str = f.userEmail.value;
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.userEmail.focus();
			return;
		}

		str = f.userPwd.value;
		if (!str) {
			alert("패스워드를 입력하세요. ");
			f.userPwd.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/member/login_ok.do";
		f.submit();
	}
</script>

</head>
<body>

	<main>
		<div class="container">
			<form name="loginForm" method="post" class="loginForm">
				<div class="members-form">
					<div class="textBox">
						<div class="row text-center fontColor">
							<h1>GrooveWare</h1>
						</div>
						<div class="row">
							<label for="login-userId" >이메일</label> <input name="userEmail"
								type="text" class="form-control" id="login-userId"
								placeholder="이메일">
						</div>
						<div class="row">
							<label for="login-password">비밀번호</label> <input name="userPwd"
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
		</div>
	</main>
</body>
</html>