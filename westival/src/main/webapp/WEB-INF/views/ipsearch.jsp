<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
/* .container{
			margin: 0 auto;
		} */
#idsearch {
	width: 320px;
}

#passwordsearch {
	width: 320px;
}

.nav-link:active {
	background-color: #350a4e;
}
</style>

<script type="text/javascript">
	
</script>


<title>search</title>
</head>

<body>


	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"
		style="border: 0px solid;">
		<li class="nav-item"><a class="nav-link active" id="pills-id-tab"
			data-toggle="pill" href="#pills-id" role="tab"
			aria-controls="pills-id" aria-selected="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</li>
		<li class="nav-item"><a class="nav-link" id="pills-password-tab"
			data-toggle="pill" href="#pills-password" role="tab"
			aria-controls="pills-password" aria-selected="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</li>
	</ul>

	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade show active" id="pills-id" role="tabpanel"
			aria-labelledby="pills-id-tab">
			<p style="text-align: center;">
				아이디를 잊어버리셨나요? <br> 가입할 때 입력한 이메일로 아이디를 보내드립니다.
			</p>
			<div>
				<!-- 이메일 쓰는란 -->
				<form action="/hifive/searchid" method="post"
					onsubmit="return false;">
					<div class="form-group row" id="supportMs"
						style="display: none; text-indent: 15px;">
						<label class="col-form-label"> </label>
						<div class="col-sm-10"></div>
					</div>
					<div class="form-group">
						<label for="">Email</label> <input type="email"
							class="form-control" id="searchuseremail" oninput="changeembg()"
							name="searchuseremail" placeholder="Email">

					</div>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary" onclick="searchid()"
						id="idsearch"
						style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border: 0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">FIND
						ID</button>

				</form>
				<br>
				<br>
			</div>
		</div>

		<div class="tab-pane fade" id="pills-password" role="tabpanel"
			aria-labelledby="pills-password-tab">
			<p style="text-align: center;">
				비밀번호를 잊어버리셨나요? <br> 가입할 때 입력한 이메일로 비밀번호를 보내드립니다.
			</p>
			<div>
				<!-- 아이디 & 이메일 치는란 -->
				<form action="/hifive/searchpwd" method="post"
					onsubmit="return false;">
					<div class="form-group row" id="supportDs"
						style="display: none; text-indent: 15px;">
						<label class="col-form-label"></label>
						<div class="col-sm-10"></div>
					</div>
					<div class="form-group">
						<label for="">ID</label> <input type="text" class="form-control"
							id="usereid" oninput="changepwbg()" placeholder="ID">

					</div>
					<div class="form-group">
						<label for="">Email</label> <input type="email"
							class="form-control" id="useremail" oninput="changepwbg1()"
							placeholder="Email">
					</div>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary" onclick="searchpw()"
						id="passwordsearch"
						style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border: 0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">FIND
						PASSWORD</button>

				</form>
				<br>
				<br>
			</div>
		</div>

	</div>



</body>

</html>