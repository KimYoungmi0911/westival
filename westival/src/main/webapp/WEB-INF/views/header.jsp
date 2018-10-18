<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/responsive.css">

<style type="text/css">
	#header-color{background-color:#350a4e; border-color:#350a4e; border:0px solid #350a4e;}
	#dropdown-menu:hover{color:red;}
	#dropdown-menu {color:#350a4e;}
	#dropdownMenuButton2 {color:#350a4e;}
</style>
</head>
<body>


<!-- Modal-login -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
      <%@ include file="login.jsp" %> <br>
						<div style="text-align: center;">
							 <button type="button" class="btn btn-secondary" 
							 	style="width:100px; background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;"
								 data-toggle="modal" data-target="#register">register</button>
							<button type="button" data-dismiss="modal" data-toggle="modal"
								data-target="#ipsearch"
								style="width:215px; background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;"
								class="btn btn-secondary">find ID/PASSWORD
								</button><br><br><br>
						</div>      	
						
																			        
      </div>
      
    </div>
  </div>
</div>

<!-- Modal-register -->
<div class="modal fade" id="register" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<img src="/westival/resources/images/titlelogo.png"	class="modal-title rounded mx-auto d-block" width="80" height="80">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"><%@ include file="register.jsp" %></div>
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
<div class="super_container">

<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
					    <div class="phone">+ 안될거없조</div>
					    
						<c:if test="${empty sessionScope.member }">
					
						<div class="user_box ml-auto">				
							<div class="user_box_login user_box_link"><button id="header-color" data-toggle="modal" data-target="#login"><a href="#">login</a></button></div>
							<div class="user_box_register user_box_link"><button id="header-color" data-toggle="modal" data-target="#register"><a href="#">register</a></button></div>						
						</div>
						</c:if>
						
						<c:if test="${!empty sessionScope.member }">
						<div class="user_box ml-auto">						
							<div class="user_box_login user_box_link"><a href="#">${member.user_name }</a></div>
							<div class="user_box_register user_box_link"><a href="logout.do">logout</a></div>						
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
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="index.jsp"><img src="images/logo.png" alt="">westival</a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="index.jsp">home &nbsp;</a></li>																							
								<li class="main_nav_item"><a href="#">my surroundings</a></li>
								<li class="main_nav_item">
								  <div class="dropdown">
									<a class="dropdown-toggle"  href="#" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										my page
									</a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    									<a class="dropdown-item" href="memberInfo.do" id="dropdown-menu">내정보 관리</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu">예매 내역</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu">관심 축제</a>
  									</div>
								  </div>
								</li>
								<li class="main_nav_item">
								  <div class="dropdown">
									<a class="dropdown-toggle"  href="#" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										support page
									</a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    									<a class="dropdown-item" href="noticeview.do" id="dropdown-menu">공지사항</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu">축제 등록</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu">동행 게시판</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu">문의 게시판</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu">약관 및 정책</a>
    									<a class="dropdown-item" href="adminticket.do" id="dropdown-menu">관리자 예매관리 테스트</a>
  									</div>
								  </div>
								</li>													
							</ul>
						</div>
						
						<div class="content_search ml-lg-0 ml-auto">
						<a href="index.jsp">
										<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
											width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
											<g>
												<g>
													<g>
														<path class="mag_glass" fill="#FFFFFF" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
														s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
														C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
														M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
														c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z"/>
													</g>
											   </g>
										       <g>
													<g>
														<path class="mag_glass" fill="#FFFFFF" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
														c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
														C-2.019,484.77-2.019,497.865,6.057,505.942z"/>
													</g>
											   </g>
										   </g>
										</svg>
							</a>
							</div>
							
									<div class="hamburger">
									
										 <div class="dropdown">
									<a class="dropdown-toggle"  href="#" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										 <i class="fa fa-bars trans_200"></i>
										</a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    									<a class="dropdown-item" href="index.jsp" id="dropdown-menu" style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">HOME</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu" style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">MY SURROUNDINGS</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu" style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">MY PAGE</a>
    									<a class="dropdown-item" href="#" id="dropdown-menu" style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">SUPPORT PAGE</a>
  									</div>
								  </div>
								
									</div>
									</div>					

					
					</div>
				</div>
			</div>	
		</nav>

	</header>
</div>
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>
</body>
</html>