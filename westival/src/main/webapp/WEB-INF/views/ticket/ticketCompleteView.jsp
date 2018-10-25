<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/header.jsp" />
<c:set var="import_uid"/> 
<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css"></style>
<style type="text/css">
#home {
      height: 90%;
      display: block;
   }
    
   .home_background {
      position: relative;
   }
   [type='button'] { cursor:pointer; }
</style>
<script>
	
	
	$(function(){
		
		//css
		$("input:text").prop("readonly", true);
		$("input").css("border", "none");
		$("input:text").css("width", "100%");
	
	});

</script>

</head>

<body>

<div class="super_container">
	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">예매완료</div>
		</div>
	</div>
	<!-- Intro -->
	<div class="intro" style="background:white;">
	<h2 class="home_title" style="text-align:center;color:black;">예매가 완료되었습니다!</h2><br><br><br><br>
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
					  <img class="img-thumbnail" style="width:550px;height:550px;" src="/westival/resources/uploadFiles/festivalImg/${festival.original_img_name }" alt="">
					</div>  
				</div>
				<div class="col-lg-5">
				<div class="intro_content">
				<form id="fsubmit" action="ticketComplete.do" method="post">
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col" colspan="2" class="section_title" style='text-align:center;vertical-align:middle'>예매정보</th>    
					    </tr>
					  </thead>
					  <tbody>
					  	<tr>
					      <th scope="row">예매번호</th>
					      <td><input value="${ticket.ticket_no }"></td>
					    </tr>
					    <tr>
					      <th scope="row">축제명</th>
					      <td><input value="${festival.name }"></td>
					    </tr>
					    <tr>
					      <th scope="row">축제번호</th>
					      <td><input name="no" value="${festival.no }"></td>
					    </tr>
					    <tr>
					      <th scope="row">테마</th>
					      <td><input value="${festival.theme }"></td>
					    </tr>
					    <tr>
					      <th scope="row">주최/주관</th>
					      <td><input value="${festival.manage }"></td>
					    </tr>
					    <tr>
					      <th scope="row">진행일정</th>
					      <td><input value="${festival.start_date } ~ ${festival.end_date }"></td>
					    </tr>
					    <tr>
					      <th scope="row">예매날짜</th>
					      <td><input id="ticket_date" name="ticket_date" value="${ticket.ticket_date }"></td>
					    </tr>
					    <tr>
					      <th scope="row">예매수량</th>
					      <td><input id="ticket_count" name="ticket_count" value="${ticket.ticket_count }"></td>
					    </tr>
					    <tr>
					      <th scope="row">결제방식</th>
					      <td><input value="${ticket.pay_type }"></td>
					    </tr>
					    <tr>
					      <th scope="row">결제일시</th>
					      <td><input value="${ticket.pay_date }"></td>
					    </tr>
					    <tr>
					      <th scope="row">결제금액</th>
					      <td><input id="price" name="price" value="${ticket.price }"></td>
					    </tr>						    				  
					  </tbody>
					</table>
					<input type="hidden" name="user_id" value="test">
					<!-- <div style="float:right;width:800px;"> -->
					<div style="float: right;">
						<button id="okBtn" type="button" class="btn btn-danger" onclick="location.href='main.do'">메인으로</button>
						<button id="myInfoBtn" type="button" class="btn btn-outline-danger" onclick="location.href='recommendList.do'">예매내역 보기</button>
					</div>
					<!-- </div> -->
				</form>
					</div>					
				</div>
			</div>
		</div>
	</div>

	<div class="milestones">
		<div class="container">
			<div class="row">
				
				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="/westival/resources/images/milestone_1.png" alt=""></div>
						<div class="milestone_counter" data-end-value="255">0</div>
						<div class="milestone_text">Clients</div>
					</div>
				</div>

				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="/westival/resources/images/milestone_2.png" alt=""></div>
						<div class="milestone_counter" data-end-value="1176">0</div>
						<div class="milestone_text">Projects</div>
					</div>
				</div>

				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="/westival/resources/images/milestone_3.png" alt=""></div>
						<div class="milestone_counter" data-end-value="39">0</div>
						<div class="milestone_text">Countries</div>
					</div>
				</div>

				<!-- Milestone -->
				<div class="col-lg-3 milestone_col">
					<div class="milestone text-center">
						<div class="milestone_icon"><img src="/westival/resources/images/milestone_4.png" alt=""></div>
						<div class="milestone_counter" data-end-value="127">0</div>
						<div class="milestone_text">Coffees</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
<script src="/westival/resources/plugins/greensock/TweenMax.min.js"></script>
<script src="/westival/resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="/westival/resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/westival/resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="/westival/resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/westival/resources/js/about_custom.js"></script>

</body>
<c:import url="/WEB-INF/views/footer.jsp" />
</html>