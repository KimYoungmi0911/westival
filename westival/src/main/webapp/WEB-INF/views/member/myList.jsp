<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_responsive.css">
</head>
<style type="text/css">
	#home {
		height: 90%;
		display: block;
	}
	 
	.home_background {
		position: relative;
	}
	
	#select_month {
		margin: 2% 0 2% 0;
		border-radius: 20px;
		padding: 10px;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa;
	}
	
	#select_month > button {
		margin: 0 0.2% 0 0.2%;
		background-color: #bebebe;
		border-radius: 10px;
		color: #ffffff;
	}
	
	#select_month > button:hover {
		background-color: #350a4e;
	}
	
	#search_month {
		display: inline;
		float: right;
		width: 39%;
	}
	
	#search_month > button {
		margin: 0 0 0 2%;
		background-color: #350a4e;
		border-radius: 10px;
		color: #ffffff;
	}
	
	#search_month > input {
		border-width: 0 0 2.5px 0;
		border-color: #350a4e;
		background-color: #fffcfc;
		text-align: center;
		font-size: 15px;
	}
	
	#search_month > span {
		margin: 0 2% 0 2%;
		color: #3504ae;
		font-size: 17px;
		font-weight: bold;
	}
	
	.festa_summary {
		width: 90%;
		height: 27vh;
		padding: 2%;
		border-radius: 20px;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa;
		margin: 0 0 2% 5%;
	}
	
	.festa_summary:hover {
		background-color: #efeaea;
	}
	
 	.media-object {
		width: 18vw;
		height: 22vh;
	}
	
	.media-body {
		width: 40vw;
		margin: 0 0 0 2%;
		color: #350a4e;
	}
	
	.media-body > input {
		display: none;
	}
	
	.ticket_no:before { content: '티켓번호 : '; font-weight: bold; }
	.ticket_date:before { content: '예매날짜 : '; font-weight: bold; }
	.ticket_name:before { content: '축제명 : '; font-weight: bold; }
	.company_name:before { content: '주최사 : '; font-weight: bold; }
	.ticket_count:before { content: '수량 : '; font-weight: bold; }
	.ticket_credit:before { content: '가격 : '; font-weight: bold; }
	
	.ticket_name {
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 95%;
		word-wrap: normal;
		overflow: hidden;
	}
	
	#delete_container {
		margin: 2% 0 2% 0;
		padding: 0;
	}
	
	#delete_button {
		margin: 0 0 0 90%;
		background-color: #bebebe;
		color: #ffffff;
		font-size: 15px;
		width: 10%;
	}
	
	#delete_button:hover {
		background-color: #350a4e;
	}

	@media only screen and (max-width: 1200px) {
		#search_month {
			width: 45%;
		}
	}
	
	@media only screen and (max-width: 1024px) {
 		.media-object {
			width: 22vw;
		}		
	}
	
	@media only screen and (max-width: 994px) {
		#search_month {
			width: 65%;
		}
	}
	
	@media only screen and (max-width: 890px) {
 		.media-object {
			width: 26vw;
		}		
	}
	
	@media only screen and (max-width: 768px) {
		#select_month {
			height: 13vh;
		}
		
		#select_month > button {
			width: 32%;
		}
		
		#search_month {
			width: 100%;
			text-align: center;
			margin: 1% 0 0 0;
		}
		
		#delete_button {
			margin-left: 85%;
			width: 15%;
		}
		
		.ticket_no, .ticket_date, .ticket_name,
		.company_name, .ticket_count, .ticket_credit
		{
			width: 78%; 
		}
	}
	
	@media only screen and (max-width: 726px) {
 		.media-object {
			width: 30vw;
		}		
	}
	
	@media only screen and (max-width: 600px) {
 		.media-object {
			width: 34vw;
		}
		
		.ticket_no, .ticket_date, .ticket_name,
		.company_name, .ticket_count, .ticket_credit
		{
			width: 95%; 
		}	
	}
	
	@media only screen and (max-width: 485px) {
		.festa_summary {
			height: 50vh;
		}
		
		.media-object {
			width: 70vw;
			margin: 0 0 0 5%;
		}
		
		.media-body {
			margin: 23vh 0 0 2%;
			position: absolute;
			height: 22vh;
			width: 70vw;
		}
	}
	
	@media only screen and (max-width: 470px) {
		#select_month {
			height: 30vh;
		}
		
		#select_month > button {
			width: 100%;
			margin: 0 0 1% 0;
		}
		
		#search_month > button {
			width: 100%;
			text-align: center;
			margin: 1% 0 0 0;
		}
	}
	
	@media only screen and (max-width: 395px) {
		#select_month {
			height: 32vh;
		}
		
		#delete_button {
			margin-left: 80%;
			width: 20%;
		}
	}
</style>
<body>
<div class="super_container">
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/header.jsp" />

	<!-- Home -->
	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/blog_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">내 게시글</div>
		</div>
	</div>
	
	<div class="container">
		<c:import url="tabHeader.jsp" />
		
		<!-- search bar -->
		<div id="select_month">
			<button type="button" class="btn" id="1month_button">1개월</button>
			<button type="button" class="btn" id="3month_button">3개월</button>
			<button type="button" class="btn" id="6month_button">6개월</button>
			<div id="search_month">
				<input type="date" class="YY-MM-dd">
				<span>~</span>
				<input type="date" class="YY-MM-dd">
				<button type="button" class="btn">검색</button>
			</div>
		</div>
		
		<!-- information -->
		<div class="festa_summary">
			<ul class="media-list">
			  <li class="media">
			    <div class="media-left">
			    <img class="media-object" src="/westival/resources/images/listing_hotel.jpg" alt="...">
			    </div>
			    <div class="media-body">
			      <input type="checkbox" name="select-item">
			      <h4 class="ticket_no">T000001</h4>
			      <h4 class="ticket_date">2018-10-12</h4>
			      <h4 class="ticket_name">티켓11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</h4>
			      <h4 class="company_name">대림미술관</h4>
			      <h4 class="ticket_count">1EA</h4>
			      <h4 class="ticket_credit">50000원</h4>
			    </div>
			  </li>
			</ul>
		</div>
		
		<div class="festa_summary">
			<ul class="media-list">
			  <li class="media">
			    <div class="media-left">
			    <img class="media-object" src="/westival/resources/images/listing_hotel.jpg" alt="...">
			    </div>
			    <div class="media-body">
			      <input type="checkbox" name="select-item">
			      <h4 class="ticket_no">T000001</h4>
			      <h4 class="ticket_date">2018-10-12</h4>
			      <h4 class="ticket_name">티켓11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</h4>
			      <h4 class="company_name">대림미술관</h4>
			      <h4 class="ticket_count">1EA</h4>
			      <h4 class="ticket_credit">50000원</h4>
			    </div>
			  </li>
			</ul>
		</div>
		 
		<div class="festa_summary">
			<ul class="media-list">
			  <li class="media">
			    <div class="media-left">
			    <img class="media-object" src="/westival/resources/images/listing_hotel.jpg" alt="...">
			    </div>
			    <div class="media-body">
			      <input type="checkbox" name="select-item">
			      <h4 class="ticket_no">T000001</h4>
			      <h4 class="ticket_date">2018-10-12</h4>
			      <h4 class="ticket_name">티켓11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</h4>
			      <h4 class="company_name">대림미술관</h4>
			      <h4 class="ticket_count">1EA</h4>
			      <h4 class="ticket_credit">50000원</h4>
			    </div>
			  </li>
			</ul>
		</div>
		
		<!--  delete button -->
		<div id="delete_container" class="container">
			<button id="delete_button" type="button" class="btn">삭제</button>
		</div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/footer.jsp" />

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/westival/resources/js/contact_custom.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>

</html>