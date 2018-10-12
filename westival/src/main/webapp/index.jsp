<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Westival</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/responsive.css">

<script type="text/javascript">
	
	$(function(){ 		
		// 오늘의 축제
		$.ajax({
			url : "todayFestival.do",
			type : "post",
			dataType : "json",
			success : function(result){					
				var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈				
				var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈	
				
				if(jsonObj.list.length==0)
					console.log("검색 결과가 없습니다.");
				
				var todayFestival = '';
				
				for(var i in jsonObj.list){ 					
					todayFestival += "<div class='col-lg-6 offers_col'><div class='offers_item'><div class='row'><div class='col-lg-6'><div class='offers_image_container'>"
						+ "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name 
						+ "); width:250px; height:280px;'></div></div></div><div class='col-lg-6'><div class='offers_content'><div class='offers_price'>" + jsonObj.list[i].name
						+ "<span><br><br>" + jsonObj.list[i].end_date + "일 까지</span></div><p class='offers_text' style='width:200px; height:150px;'>"
						+ "테마 : " + jsonObj.list[i].theme + "<br>태그 : " + jsonObj.list[i].tag + "<br></p><div class='offers_link'><a href='#'>자세히 보기</a></div>"
						+ "</div></div></div></div></div>";
							
					console.log("축제번호 : " + jsonObj.list[i].no + ", 축제명 : " + jsonObj.list[i].name +
							", 이미지 : " + jsonObj.list[i].new_img_name + ", 주소 : " + jsonObj.list[i].address +
							", 시작날짜 : " + jsonObj.list[i].start_date + ", 종료날짜 : " + jsonObj.list[i].end_date +
							", 테마 : " + jsonObj.list[i].theme + ", 태그 : " + jsonObj.list[i].tag);
				}	
				
				$("#todayFestival").html(todayFestival);				
			},
			error : function(request, status, errorData){
				alert("error code : " + request.status + "\n" + "message : " + request.responseText 
						+ "\n" + "error : " + errorData);
			} 
		});
		
		// 이달의 축제
		$.ajax({
			url : "top3Festival.do",
			type : "post",
			dataType : "json",
			success : function(result){					
				var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈				
				var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈		
				
				//console.log("이달의 축제 top3");
				
				if(jsonObj.list.length==0)
					console.log("검색 결과가 없습니다.");
				
				var top3='';
				
				for(var i in jsonObj.list){					
					top3 += "<div class='col-lg-4 intro_col'><div class='intro_item'><div class='intro_item_overlay'></div>" 
						+ "<div class='intro_item_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" 
						+ jsonObj.list[i].new_img_name + ")'></div><div class='intro_item_content d-flex flex-column align-items-center justify-content-center'>"
						+ "<div class='intro_date'>" + jsonObj.list[i].start_date + " ~ " + jsonObj.list[i].end_date + "</div><div class='button intro_button'>"
						+ "<div class='button_bcg'></div><a href='#'>더보기</a></div><div class='intro_center text-center'><h1>" + jsonObj.list[i].name
						+ "</h1><div class='intro_price'>" + jsonObj.list[i].address + "</div></div></div></div></div>"; 
					/* console.log("축제번호 : " + jsonObj.list[i].no + ", 축제명 : " + jsonObj.list[i].name +
							", 이미지 : " + jsonObj.list[i].new_img_name + ", 주소 : " + jsonObj.list[i].address +
							", 시작날짜 : " + jsonObj.list[i].start_date + ", 종료날짜 : " + jsonObj.list[i].end_date +
							", 테마 : " + jsonObj.list[i].theme + ", 태그 : " + jsonObj.list[i].tag); */
				}
				$("#top3").html(top3);
			},
			error : function(request, status, errorData){
				alert("error code : " + request.status + "\n" + "message : " + request.responseText 
						+ "\n" + "error : " + errorData);
			} 
		});
  
	});
	
</script>

</head>

<body>


<div class="super_container">
	
	<!-- Header -->

	<header class="header">

		<!-- Top Bar -->

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="#"><img src="/westival/resources/images/logo.png" alt="">travelix</a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="#">home</a></li>
								<li class="main_nav_item"><a href="about.html">about us</a></li>
								<li class="main_nav_item"><a href="offers.html">offers</a></li>
								
								<c:url var="fInsert" value="insertFestivalPage.do">
									<c:param name="userid" value="user01" /> <!-- 임의의 아이디값 넣고 테스트 -->
								</c:url>
								<li class="main_nav_item"><a href="${ fInsert }">축제 등록 테스트</a></li>

								<c:url var="fSearch" value="searchFestivalPage.do"></c:url>
								<li class="main_nav_item"><a href="${ fSearch }">축제 서치 테스트</a></li>


							</ul>
						</div>
						<div class="content_search ml-lg-0 ml-auto">
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
						</div>

						<form id="search_form" class="search_form bez_1">
							<input type="search" class="search_content_input bez_1">
						</form>

						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>
	</header>

	<div class="menu trans_500">
		<div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
			<div class="menu_close_container"><div class="menu_close"></div></div>
			<div class="logo menu_logo"><a href="#"><img src="/westival/resources/images/logo.png" alt=""></a></div>
			<ul>
				<li class="menu_item"><a href="#">home</a></li>
				<li class="menu_item"><a href="about.html">about us</a></li>
				<li class="menu_item"><a href="offers.html">offers</a></li>
				<li class="menu_item"><a href="blog.html">news</a></li>
				<li class="menu_item"><a href="contact.html">contact</a></li>
			</ul>
		</div>
	</div>
	

	<!-- 메인 사진 -->
	<div class="home">		
		<!-- Home Slider -->
		<div class="home_slider_container">			
			<div class="owl-carousel owl-theme home_slider" >
			
				<!-- Slider Item -->
				<div class="owl-item home_slider_item">
					<div class="home_slider_background" style="background-image:url(/westival/resources/images/home_slider.jpg)"></div>
					<div class="home_slider_content text-center">
						<div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
							<h1>discover</h1>
							<h1>the world</h1>
							<div class="button home_slider_button">
								<div class="button_bcg"></div>
								<a href="#"">축제 페이지로 이동</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Slider Item -->
				<div class="owl-item home_slider_item">
					<div class="home_slider_background" style="background-image:url(/westival/resources/images/home_slider.jpg)"></div>

					<div class="home_slider_content text-center">
						<div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
							<h1>discover</h1>
							<h1>the world</h1>
							<div class="button home_slider_button"><div class="button_bcg"></div><a href="#"">축제 페이지로 이동<span></span><span></span><span></span></a></div>
						</div>
					</div>
				</div>

				<!-- Slider Item -->
				<div class="owl-item home_slider_item">
					<div class="home_slider_background" style="background-image:url(/westival/resources/images/home_slider.jpg)"></div>

					<div class="home_slider_content text-center">
						<div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
							<h1>discover</h1>
							<h1>the world</h1>
							<div class="button home_slider_button"><div class="button_bcg"></div><a href="#"">축제 페이지로 이동<span></span><span></span><span></span></a></div>
						</div>
					</div>
				</div>

			</div>
			
			<!-- Home Slider Nav - Prev -->
			<div class="home_slider_nav home_slider_prev">
				<svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
					<defs>
						<linearGradient id='home_grad_prev'>
							<stop offset='0%' stop-color='#fa9e1b'/>
							<stop offset='100%' stop-color='#8d4fff'/>
						</linearGradient>
					</defs>
					<path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
					M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
					C22.545,2,26,5.541,26,9.909V23.091z"/>
					<polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
					11.042,18.219 "/>
				</svg>
			</div>
			
			<!-- Home Slider Nav - Next -->
			<div class="home_slider_nav home_slider_next">
				<svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
					<defs>
						<linearGradient id='home_grad_next'>
							<stop offset='0%' stop-color='#fa9e1b'/>
							<stop offset='100%' stop-color='#8d4fff'/>
						</linearGradient>
					</defs>
				<path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
				M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
				C22.545,2,26,5.541,26,9.909V23.091z"/>
				<polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
				17.046,15.554 "/>
				</svg>
			</div>

			<!-- Home Slider Dots -->

			<div class="home_slider_dots">
				<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
					<li class="home_slider_custom_dot active"><div></div>01.</li>
					<li class="home_slider_custom_dot"><div></div>02.</li>
					<li class="home_slider_custom_dot"><div></div>03.</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 오늘의 축제 -->
	<div class="offers" style="background:#007bff29;">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h2 class="section_title">오늘의 축제</h2>
				</div>
			</div>
			<div class="row offers_items" id="todayFestival"></div>
		</div>
	</div>

	<!-- Intro -->
	
	<div class="intro" id="intro" style="background:#bd729840;">
		<div class="container">
			<div class="row">
				<div class="col">
					<h2 class="intro_title text-center">이달의 축제 Top3</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="intro_text text-center">
						<p>이달의 축제 설명 </p>
					</div>
				</div>
			</div>
			<div class="row intro_items" id="top3"></div>
		</div>
	</div>

	<!-- 관리자 추천 축제 -->
	<div class="testimonials">
		<div class="test_border"></div>
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h2 class="section_title">관리자의 추천 축제</h2>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="test_slider_container">
						<div class="owl-carousel owl-theme test_slider">	
						
							<div class="owl-item">
								<div class="test_item">
									<div class="test_image"><img src="/westival/resources/images/test_1.jpg" ></div>
									<div class="test_content_container">
										<div class="test_content">
											<div class="test_quote_title">제목</div>
											<p class="test_quote_text">내용</p>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="test_item">
									<div class="test_image"><img src="/westival/resources/images/test_2.jpg" ></div>
									<div class="test_content_container">
										<div class="test_content">
											<div class="test_quote_title">제목</div>
											<p class="test_quote_text">내용</p>
										</div>
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="test_item">
									<div class="test_image"><img src="/westival/resources/images/test_3.jpg" ></div>
									<div class="test_content_container">
										<div class="test_content">
											<div class="test_quote_title">제목</div>
											<p class="test_quote_text">내용</p>
										</div>
									</div>
								</div>
							</div>
							
						</div>

						<!-- Slider Nav - Prev -->
						<div class="test_slider_nav test_slider_prev">
							<svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
								<defs>
									<linearGradient id='test_grad_prev'>
										<stop offset='0%' stop-color='#fa9e1b'/>
										<stop offset='100%' stop-color='#8d4fff'/>
									</linearGradient>
								</defs>
								<path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
								M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
								C22.545,2,26,5.541,26,9.909V23.091z"/>
								<polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
								11.042,18.219 "/>
							</svg>
						</div>
						
						<!-- Slider Nav - Next -->
						<div class="test_slider_nav test_slider_next">
							<svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
								<defs>
									<linearGradient id='test_grad_next'>
										<stop offset='0%' stop-color='#fa9e1b'/>
										<stop offset='100%' stop-color='#8d4fff'/>
									</linearGradient>
								</defs>
							<path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
							M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
							C22.545,2,26,5.541,26,9.909V23.091z"/>
							<polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
							17.046,15.554 "/>
							</svg>
						</div>

					</div>
					
				</div>
			</div>

		</div>
	</div>	

</div>


<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>

</body>

</html>