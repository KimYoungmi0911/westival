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
	
	#recommend_table {
		margin: 2% 0 2% 0;
		padding: 10px;
		border-radius: 20px;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa;
	}
	
	#recommend_table > div {
		margin: 0;
	}
	
	.thead {
		width: 100%;
		border-bottom: 1.5px solid #350a4e;
	}
	
	.tbody {
		width: 100%;
	}
	
	.tbody_tr:hover {
		background-color: #efeaea;
	}
	
	.recommend_no_head, .recommend_no { width: 10%; display: inline-block; }
	.recommend_date_head, .recommend_date { width: 10%; display: inline-block; }
	.recommend_name_head, .recommend_name { width: 45%; display: inline-block; }
	.recommend_count_head, .recommend_count { width: 5%; display: inline-block; }
	.recommend_credit_head, .recommend_credit { width: 15%; display: inline-block; }
	.recommend_refund_head, .recommend_refund { width: 10%; display: inline-block; }
	
	.recommend_no_head > p, .recommend_no > p,
	.recommend_date_head > p, .recommend_date > p,
	.recommend_name_head > p, .recommend_name > p,
	.recommend_count_head > p, .recommend_count > p,
	.recommend_credit_head > p, .recommend_credit > p,
	.recommend_refund_head > p, .recommend_refund > p
	{
		font-size: 15px;
		font-weight: 500;
		color: #350a4e;
		margin: 1% 0 1% 0;
		text-align: center;
	}
	
	.recommend_name > p {
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 95%;
		height: 100%;
		line-height: 100%;
		word-wrap: normal;
		overflow: hidden;
		margin: 0;
	}
	
	.recommend_refund > button {
		width: 100%;
		padding: 5%;
		margin: 1% 0 1% 0;
		font-size: 13px;
		color: #ffffff;
		background-color: #bebebe;
		border-radius: 10px;
	}
	
	#modal_recommend_name > p {
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 95%;
		height: 100%;
		line-height: 100%;
		word-wrap: normal;
		overflow: hidden;
		margin: 3% 0 0 0;
		color: #350a4e;
	}
	
	.modal_recommend_no { width: 15%; display:inline-block; text-align: center; }
	.modal_recommend_date { width: 15%; display:inline-block; text-align: center; }
	.modal_recommend_name { width: 38%; display:inline-block; text-align: center; }
	.modal_recommend_count { width: 10%; display:inline-block; text-align: center; }
	.modal_recommend_credit { width: 15%; display:inline-block; text-align: center; }
	
	@media only screen and (max-width: 1200px) {
		#search_month {
			width: 45%;
		}
	}
	
	@media only screen and (max-width: 994px) {
		#search_month {
			width: 65%;
		}
		
		.recommend_date_head, .recommend_date { width: 20%; }
		.recommend_name_head, .recommend_name { width: 35%; }
		
		.recommend_refund > button { font-size: 9px; }
		
		.modal_recommend_date { width: 20%; }
		.modal_recommend_name { width: 28%; }
		.modal_recommend_credit { width: 20%; }
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
		
		.recommend_no_head, .recommend_no { width: 15%; }
		.recommend_date_head, .recommend_date { width: 20%; }
		.recommend_name_head, .recommend_name { width: 25%; }
		.recommend_count_head, .recommend_count { width: 10%; }
	}
	
	@media only screen and (max-width: 485px) {
		.thead { display: none; }
		
		#recommend_table {
			margin: 0;
			padding: 0;
			border: o;
			background: #ffffff;
			box-shadow: none;
		}
		.tbody_tr {
			margin: 2% 0 2% 0;
			padding: 10px;
			border-radius: 20px;
			background-color: #fffcfc;
			box-shadow: 1.5px 1.5px 3px #aaaaaa;
		}
		
		.recommend_no, .recommend_date, .recommend_name,
		.recommend_count, .recommend_credit, .recommend_refund
		{
			width: 100%;
		}
		
		.recommend_no > p, .recommend_date > p, .recommend_name > p,
		 .recommend_count > p, .recommend_credit > p, .recommend_refund > p
		{
			text-align: left;
		}
		
		.recommend_no > p:before { content: '예매번호 : '; font-weight: bold; }
		.recommend_date > p:before { content: '예매날짜 : '; font-weight: bold; }
		.recommend_name > p:before { content: '축제명 : '; font-weight: bold; }
		.recommend_count > p:before { content: '수량 : '; font-weight: bold; }
		.recommend_credit > p:before { content: '가격 : '; font-weight: bold; }
		
		.recommend_name > p {
			margin: 3.3% 0 3.3% 0;
		}
		
		.recommend_refund > button {
			font-size: 15px;
			padding: 1% 0 1% 0;
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
	}
</style>
<script type="text/javascript">
	function refund() {
		alert("test");	
	}
</script>
<body>
<div class="super_container">
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/header.jsp" />

	<!-- Home -->
	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/contact_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">예매내역</div>
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
		
	<div class="container">
		<div id="recommend_table">
			<div class="thead">
				<div class="thead_tr">
					<div class="recommend_no_head"><p>예매번호</p></div>
					<div class="recommend_date_head"><p>예매날짜</p></div>
					<div class="recommend_name_head"><p>축제명</p></div>
					<div class="recommend_count_head"><p>수량</p></div>
					<div class="recommend_credit_head"><p>금액</p></div>
					<div class="recommend_refund_head"><p>환불</p></div>
				</div>
			</div>
			<div class="tbody">
				<div class="tbody_tr">
					<div class="recommend_no"><p>A000001</p></div>
					<div class="recommend_date"><p>2018-10-12</p></div>
					<div class="recommend_name"><p>축제명1111111111111111111111111111111111111111111111111111111111111111111111111</p></div>
					<div class="recommend_count"><p>1</p></div>
					<div class="recommend_credit"><p>50000</p></div>
					<div class="recommend_refund"><button class="btn"  data-toggle="modal" data-target="#myModal">환불요청</button></div>
				</div>	
				<div class="tbody_tr">
					<div class="recommend_no"><p>A000002</p></div>
					<div class="recommend_date"><p>2018-10-02</p></div>
					<div class="recommend_name"><p>축제명22222222222222222222222222222222</p></div>
					<div class="recommend_count"><p>900</p></div>
					<div class="recommend_credit"><p>105000</p></div>
					<div class="recommend_refund"><button class="btn"  data-toggle="modal" data-target="#myModal">환불요청</button></div>
				</div>
				<div class="tbody_tr">
					<div class="recommend_no"><p>A000003</p></div>
					<div class="recommend_date"><p>2018-10-13</p></div>
					<div class="recommend_name"><p>축제명333333333333333333333333333333</p></div>
					<div class="recommend_count"><p>10</p></div>
					<div class="recommend_credit"><p>500000</p></div>
					<div class="recommend_refund"><button class="btn"  data-toggle="modal" data-target="#myModal">환불요청</button></div>
				</div>	
			</div>
		</div>
	</div>
</div>

<!-- refund_Modal -->
 <div class="modal" id="myModal" role="dialog">
    <div class="modal-dialog  modal-lg" style="color: #350a4e;">
    
      <!-- Modal content-->
      <div class="modal-content" style="font-size: 15px;">
        <div class="modal-header" style="background-color: #350a4e;">
        	<h2 class="modal-title" style="color: #ffffff;">환불</h2>
<!--           	<button type="button" class="close" data-dismiss="modal" style="color: #ffffff;">&times;</button> -->
        </div>
        <div class="modal-body">
        	<div style="padding: 5px;">
	       		<h4 style="border-bottom: 1.5px solid #350a4e; margin-top: 3%;">예매내역</h4>
	        	<div style="width: 100%; font-size: 13px;">
	        		<div>
	        			<div style="border-bottom: 1.5px solid #350a4e;">
	        				<div class="modal_recommend_no">예매번호</div>
	        				<div class="modal_recommend_date">예매날짜</div>
	        				<div class="modal_recommend_name">축제명</div>
	        				<div class="modal_recommend_count">수량</div>
	        				<div class="modal_recommend_credit">금액</div>
	        			</div>
	        		</div>
	        		<div>
	        			<div>
	        				<div class="modal_recommend_no">A000001</div>
	        				<div class="modal_recommend_date">2018-10-21</div>
	        				<div class="modal_recommend_name" id="modal_recommend_name"><p>축제명!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1</p></div>
	        				<div class="modal_recommend_count">100</div>
	        				<div class="modal_recommend_credit">5000000</div></div>
	        			</div>
	        		</div>	
	        	</div>
	        	<div style="padding: 5px;">
		        	<h4 style="border-bottom: 1.5px solid #350a4e; margin-top: 3%;">환불사유</h4>
		        	<textarea rows="3" style="width: 100%;"></textarea>
		        </div>
		        <div style="padding: 5px;">
		        	<h4 style="border-bottom: 1.5px solid #350a4e; margin-top: 3%;">환불규정</h4>
			        	<div style="border="1.5px solid #efeaea; padding: 5px;">
				        	<p style="font-size: 13px; color: #000;">
				        		다음 어느 하나에 해당하는 경우에는 인터넷쇼핑몰 사업자의 의사에 반(反)해서 주문 취소나 환불을 할 수 없습니다
				        		(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 본문 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조).
				        	</p>
				        	<p style="font-size: 13px; color: #000;">1. 소비자의 잘못으로 티켓의 데이터가 변형(티켓의 본래의 기능을 되돌릴 수 없는 상태)되거나 복구할 수 없는 경우(다만, 해킹으로 인해 티켓의 데이터가 훼손된 경우에는 취소나 환불이 가능)</p>
							<p style="font-size: 13px; color: #000;">2. 소비자가 사용해서 티켓의 가치가 뚜렷하게 떨어진 경우</p>
							<p style="font-size: 13px; color: #000;">3. 입장 시간이 지나 다시 판매하기 곤란할 정도로 티켓의 가치가 뚜렷하게 떨어진 경우</p>
							<p style="font-size: 13px; color: #000;">4. 티켓을 무단으로 복제한 경우</p>
						</div>
					<div align="center"><input type="checkbox"> 위의 약관의 동의합니다.</div>
		        </div>
	        </div>
	       <div class="modal-footer" style="background-color: #350a4e;">
	         <button type="button" class="btn btn-primary" style="border-radius: 10px;" disabled>환불</button>
	         <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 10px;">취소</button>
	       </div>
      </div>
      
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