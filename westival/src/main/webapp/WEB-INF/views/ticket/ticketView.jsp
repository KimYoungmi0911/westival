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
		$("input").not("#ticket_count").not("#ticket_date").css("border", "none");
		$("input:text").css("width", "100%");
		$("#ticket_count").prop("min", "1");
		$("#ticket_count").css("height", "30px").css("width", "60px");
		$("#ticket_date").css("height", "30px").css("width", "180px");
		
		//예매수량 제한
		if('${ticketOption.ticket_quantity}' > 0){
			$("#ticket_count").val(1).prop("min", 1).prop("max", '${ticketOption.ticket_quantity}');
		}else {
			alert("매진된 축제입니다.");
		}

		//예매수량 변경시
		$("#ticket_count").on("change", function(){
			var resultPrice = '${ticketOption.ticket_price}' * $("#ticket_count").val();
			$("#price").val(resultPrice);
		});
		
		//예매날짜 범위 제한 
		var minDate = new Date('${festival.start_date}');
		var maxDate = new Date('${festival.end_date}');
		minDate = changeDate(minDate);
		maxDate = changeDate(maxDate);
		$("#ticket_date").prop("min", minDate);
		$("#ticket_date").prop("max", maxDate);
		
		//결제하기 클릭시
		$("#payBtn").on("click", function(){
			if('${member.user_id}' != ""){
				var payType = $(".pay_type:checked").val();
				if(payType == "카드"){
					payCard();
				}else{
					payCash();
				}
			}else{
				alert("로그인 후 이용 가능합니다. 로그인 후 다시 시도해주세요.");
			}
		});
		
		//취소하기 클릭시
		$("#cancleBtn").on("click", function(){
			alert("확인을 누르면 이전 페이지로 이동합니다.");
			location.href="Info.do?no=${festival.no}";
		});
		
	});
	
	//Date Format
	function changeDate(date){
	    function pad(num) {
	        num = num + '';
	        return num.length < 2 ? '0' + num : num;
	    }
	    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
	}
	
	//결제 API
	var IMP = window.IMP; // 생략가능
	IMP.init('imp69614733'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	function payCard(){
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${festival.name}',
		    amount : $("#price").val(),
		    buyer_email : '${member.user_email}', //${member.user_email}
		    buyer_name : '${member.user_id}',
		    buyer_tel : '${member.user_phone}', //
		    buyer_addr : '${member.user_address}', //
		    //buyer_postcode : '123-456',
		    company : 'Westival',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'    
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        /* msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    if(rsp.success){
		    	$("#import_uid").val(rsp.imp_uid);
		    	//$("#paid_at").val(rsp.paid_at);
		    	//alert(rsp.paid_at);
		    	$("#fsubmit").submit();
		    }
		});
		return false;
	} 
	
	//결제 - 실시간 계좌이체 API
	function payCash(){
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'trans',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${festival.name}',
		    amount : $("#price").val(),
		    buyer_email : '${member.user_email}', //${member.user_email}
		    buyer_name : '${member.user_name}',
		    buyer_tel : '${member.user_phone}', //
		    buyer_addr : '${member.user_address}', //
		    //buyer_postcode : '123-456',
		    company : 'Westival',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'    
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        /* msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    if(rsp.success){
		    	$("#import_uid").val(rsp.imp_uid);
		    	$("#fsubmit").submit();
		    }
		});
		return false;
	}
	
</script>

</head>

<body>

<div class="super_container">
	<!-- Home -->

	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">예매하기</div>
		</div>
	</div>
	<!-- Intro -->
	<div class="intro" style="background:white;">
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
					      <td><input id="ticket_date" name="ticket_date" type="date" class="form-control" placeholder="date input"></td>
					    </tr>
					    <tr>
					      <th scope="row">예매수량</th>
					      <td><input id="ticket_count" name="ticket_count" type="number" class="form-control" placeholder="number input"></td>
					    </tr>
					    <tr>
					      <th scope="row">가격 (1매기준)</th>
					      <td><input value="${ticketOption.ticket_price }"></td>
					    </tr>	
					    <tr>
					      <th scope="row">합계</th>
					      <td><input id="price" name="price" value="${ticketOption.ticket_price }"></td>
					    </tr>	
					    <tr>
					      <th scope="row">결제방식</th>
					      <td>
					      	  <input type="radio" class="pay_type" name="pay_type" value="카드" checked>카드
					      	  <input type="radio" class="pay_type" name="pay_type" value="실시간계좌이체">실시간계좌이체
					      </td>
					    </tr>				  
					  </tbody>
					</table>
					<input type="hidden" name="user_id" value="${member.user_id }">
					<input type="hidden" name="state" value="결제완료">
					<input type="hidden" id="import_uid" name="import_uid">
					<div style="float: right;">
						<button id="payBtn" type="button" class="btn btn-danger">결제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="cancleBtn" type="button" class="btn btn-outline-danger">취소하기</button>
					</div>
					<!-- </div> -->
				</form>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>


<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script> -->
<!-- <script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
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