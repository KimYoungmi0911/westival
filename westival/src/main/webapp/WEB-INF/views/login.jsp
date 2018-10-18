<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>login</title>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script
	src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link
	href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/responsive.css">

<style type="text/css">
#loginbtn {
	width: 320px;
}
</style>

<script type="text/javascript">
	//아이디 입력하면 배경 색 변경
	function changeIDbg() {
		$("#user_id").css("background-color", "#fffff0");
	}

	//비밀번호 입력하면 배경 색 변경
	function changePWDbg() {
		$("#user_pwd").css("background-color", "#fffff0");
	}

	function checkIDPW() {
		var userid = $("#user_id").val();
		var userpw = $("#user_pwd").val();

		//아이디 비밀번호 공백 확인과 테이블상에 있는 아이디인지 
		if ($("#user_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#user_id").focus();
			$("#user_id").css("background-color", "#FFCECE");
			return false;
		} else if ($("#user_pwd").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#user_pwd").focus();
			$("#user_pwd").css("background-color", "#FFCECE");
		} else if ($("#user_id").val() != "" && $("#user_pwd").val() != "") {

			$.ajax({
				url : "login.do",
				type : "post",
				data : {
					user_id : userid,
					user_pwd : userpw
				},
				success : function(data) {
					if (data == 1) {
						alert("로그인에 성공하셨습니다.");
						$("#loginForm").submit();

					} else {
						alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
					}
				}

			});
		}

	}
</script>
</head>
<body>


	<div>
		<form id="loginForm" action="loginSuc.do" method="post">
			<div class="form-group">
				<label for="">ID</label> <input type="text" class="form-control"
					name="user_id" id="user_id" placeholder="ID" oninput="changeIDbg()">

			</div>
			<div class="form-group">
				<label for="">Password</label> <input type="password"
					class="form-control" name="user_pwd" id="user_pwd"
					placeholder="Password" oninput="changePWDbg()">
			</div>
			<br>
			<div class="input-group-append" style="text-align: center;">
				<input type="button" class="btn btn-primary" value="login"
					id="loginbtn" onclick="checkIDPW()"
					style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border: 0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">
			</div>
		</form>
	</div>


</body>
</html>