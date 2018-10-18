<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
#header-color {
	background-color: #350a4e;
	border-color: #350a4e;
	border: 0px solid #350a4e;
}

#dropdown-menu:hover {
	color: red;
}

#dropdown-menu {
	color: #350a4e;
}

#dropdownMenuButton2 {
	color: #350a4e;
}
</style>
</head>
<body>


	<!-- Modal-login -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="/westival/resources/images/titlelogo.png"
						class="modal-title rounded mx-auto d-block" width="80" height="80">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<%@ include file="login.jsp"%>
					<br>
					<div style="text-align: center;">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; background: #350a4e; border: 0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;"
							data-toggle="modal" data-target="#register">register</button>
						<button type="button" data-dismiss="modal" data-toggle="modal"
								data-target="#ipsearch"
								style="width:215px; background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;"
								class="btn btn-secondary">find ID/PASSWORD
								</button>
						<br>
						<br>
						<br>
					</div>


				</div>

			</div>
		</div>
	</div>

	<!-- Modal-register -->
	<div class="modal fade" id="register" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="/westival/resources/images/titlelogo.png"
						class="modal-title rounded mx-auto d-block" width="80" height="80">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"><%@ include file="register.jsp"%></div>
			</div>
		</div>
	</div>


	<!--Modal- id/pw찾기 -->
		<div class="modal fade" id="ipsearch" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
      					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      					<img src="/westival/resources/images/titlelogo.png"	class="modal-title rounded mx-auto d-block" width="80" height="80">      				
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
        				</button>
      				</div>
					
					<div class="modal-body">
						<%@ include	file="ipsearch.jsp"%>
					</div>
				</div>
			</div>
		</div>




	<!-- Header -->


	<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="phone">+ 안될거없조</div>

						<c:if test="${empty sessionScope.member }">

							<div class="user_box ml-auto">
								<div class="user_box_login user_box_link">
									<button id="header-color" data-toggle="modal"
										data-target="#login">
										<a href="#">login</a>
									</button>
								</div>
								<div class="user_box_register user_box_link">
									<button id="header-color" data-toggle="modal"
										data-target="#register">
										<a href="#">register</a>
									</button>
								</div>
							</div>
						</c:if>

						<c:if test="${!empty sessionScope.member }">
							<div class="user_box ml-auto">
								<div class="user_box_login user_box_link">
									<a href="#">${member.user_name }</a>
								</div>
								<div class="user_box_register user_box_link">
									<a href="logout.do">logout</a>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->



		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<c:if
						test="${sessionScope.member.user_id != 'admin' || empty sessionScope.member }">
						<div
							class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<div class="logo">
									<a href="index.jsp"><img src="images/logo.png" alt="">westival</a>
								</div>
							</div>
							<div class="main_nav_container ml-auto">
								<ul class="main_nav_list">
									<li class="main_nav_item"><a href="index.jsp">home
											&nbsp;</a></li>
									<li class="main_nav_item"><a href="#">my surroundings</a></li>
									<li class="main_nav_item">
										<div class="dropdown">
											<a class="dropdown-toggle" href="#" id="dropdownMenuButton"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> my page </a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#" id="dropdown-menu">내정보
													관리</a> <a class="dropdown-item" href="#" id="dropdown-menu">예매
													내역</a> <a class="dropdown-item" href="#" id="dropdown-menu">관심
													축제</a>
											</div>
										</div>
									</li>
									<li class="main_nav_item">
										<div class="dropdown">
											<a class="dropdown-toggle" href="#" id="dropdownMenuButton"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> support page </a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#" id="dropdown-menu">공지사항</a>
												<a class="dropdown-item" href="#" id="dropdown-menu">축제
													등록</a> <a class="dropdown-item" href="#" id="dropdown-menu">동행
													게시판</a> <a class="dropdown-item" href="#" id="dropdown-menu">문의
													게시판</a> <a class="dropdown-item" href="#" id="dropdown-menu">약관
													및 정책</a>
											</div>
										</div>
									</li>
								</ul>
							</div>

							

							<div class="hamburger">

								<div class="dropdown">
									<a class="dropdown-toggle" href="#" id="dropdownMenuButton2"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fa fa-bars trans_200"></i>
									</a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="index.jsp" id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">HOME</a>
										<a class="dropdown-item" href="#" id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">MY
											SURROUNDINGS</a> <a class="dropdown-item" href="#"
											id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">MY
											PAGE</a> <a class="dropdown-item" href="#" id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">SUPPORT
											PAGE</a>
									</div>
								</div>

							</div>
						</div>

					</c:if>

					<c:if
						test="${sessionScope.member.user_id == 'admin' && !empty sessionScope.member}">
						<div
							class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
							<div class="logo_container">
								<div class="logo">
									<a href="index.jsp"><img src="images/logo.png" alt="">westival</a>
								</div>
							</div>
							<div class="main_nav_container ml-auto">
								<ul class="main_nav_list">
									<li class="main_nav_item"><a href="index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
									<li class="main_nav_item"><a href="index.jsp">home</a></li>
									<li class="main_nav_item"><a href="#">festival mgt</a></li>
									<li class="main_nav_item"><a href="#">Reservation mgt</a></li>
									<li class="main_nav_item"><a href="#">Member mgt</a></li>

								</ul>
							</div>


							<div class="hamburger">

								<div class="dropdown">
									<a class="dropdown-toggle" href="#" id="dropdownMenuButton2"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fa fa-bars trans_200"></i>
									</a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="index.jsp" id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">HOME</a>
										<a class="dropdown-item" href="#" id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">festival
											managementS</a> <a class="dropdown-item" href="#"
											id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">Reservation
											management</a> <a class="dropdown-item" href="#"
											id="dropdown-menu"
											style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">Member
											management</a>
									</div>
								</div>

							</div>
						</div>
					</c:if>

				</div>
			</div>

		</nav>



	</header>

	<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
	<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
	<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
	<script
		src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="/westival/resources/plugins/easing/easing.js"></script>
	<script src="/westival/resources/js/custom.js"></script>
</body>
</html>