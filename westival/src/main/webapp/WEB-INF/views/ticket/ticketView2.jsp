<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../../header.jsp" />
<c:set var="import_uid"/> 

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
			var payType = $(".pay_type:checked").val();
			if(payType == "카드"){
				payCard();
			}else{
				payCash();
			}
		});
		
		//취소하기 클릭시

		
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
	//결제 - 가상계좌 API
	function payCash(){
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'vbank',
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
		        msg += '가상계좌 입금계좌번호 : ' + rsp.vbank_num;
		        msg += '가상계좌 은행명 : ' + rsp.vbank_name;
		        msg += '가상계좌 예금주 : ' + rsp.vbank_holder;
		        msg += '가상계좌 입금기한 : ' + rsp.vbank_date;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    if(rsp.success){
		    	$("#import_uid").val(rsp.imp_uid);
		    	$("#state").val("입금대기");
		    	//$("#paid_at").val(rsp.paid_at);
		    	//alert("paid_at : " + rsp.paid_at);
		    	alert("rsp.vbank_num : " + rsp.vbank_num  + ", rsp.vbank_name : " + rsp.vbank_name
		    			+ ", rsp.vbank_holder : " + rsp.vbank_holder + ", rsp.vbank_date : " + rsp.vbank_date);
		    	alert("pay_type : " + $(".pay_type:checked").val());
		    	$("#fsubmit").append(
			    	"<input type='hidden' name='vbank_num' value='" + rsp.vbank_num + "'>" 
			    	+ "<input type='hidden' name='vbank_name' value='" + rsp.vbank_name + "'>"
			    	+ "<input type='hidden' name='vbank_holder' value='" + rsp.vbank_holder + "'>"
			    	+ "<input type='date' name='vbank_date' value='" + rsp.vbank_date +"'>"	
		    	);
		    	
		    	$("#fsubmit").submit();
				
		    	/* $("#vbank_num").val(rsp.vbank_num);
		    	$("#vbank_name").val(rsp.vbank_name);
		    	$("#vbank_holder").val(rsp.vbank_holder);
		    	$("#vbank_date").val(rsp.vbank_date);
		    	$("#fsubmit").submit(); */
		    }
		});
		return false;
	}
	
	//결제완료시
	/* function ticketComplete(result){
		
		if(payType == '카드'){
			
		}else {
			$("#fsubmit").append(
					$("#import_uid").val(rsp.imp_uid);
					$("#state").val("입금대기");
					<input type="hidden" id="vbank_num" name="vbank_num" value="0">
					<input type="hidden" id="vbank_name" name="vbank_name" value="0">
					<input type="hidden" id="vbank_holder" name="vbank_holder" value="0">
					<input type="date" id="vbank_date" name="vbank_date" value="0">		
					$("#fsubmit").submit();
			);
		}
		
		
		if(result == 1){
			
			
			
			
			
			location.replace = ("ticketComplete.do");
			alert("결제완료 페이지로 이동");
		}else {
			alert("결제실패 페이지");
		}
		
		return false;
	}  */
	
	
	
	
	
</script>

<div class="super_container">
	
	<!-- Header -->

	<header class="header">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="phone">+45 345 3324 56789</div>
						<div class="social">
							<ul class="social_list">
								<li class="social_list_item"><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="user_box ml-auto">
							<div class="user_box_login user_box_link"><a href="#">login</a></div>
							<div class="user_box_register user_box_link"><a href="#">register</a></div>
						</div>
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
							<div class="logo"><a href="#"><img src="/westival/resources/images/logo.png" alt="">travelix</a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="index.html">home</a></li>
								<li class="main_nav_item"><a href="#">about us</a></li>
								<li class="main_nav_item"><a href="offers.html">offers</a></li>
								<li class="main_nav_item"><a href="blog.html">news</a></li>
								<li class="main_nav_item"><a href="contact.html">contact</a></li>
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
				<li class="menu_item"><a href="index.html">home</a></li>
				<li class="menu_item"><a href="#">about us</a></li>
				<li class="menu_item"><a href="offers.html">offers</a></li>
				<li class="menu_item"><a href="blog.html">news</a></li>
				<li class="menu_item"><a href="contact.html">contact</a></li>
			</ul>
		</div>
	</div>

	<!-- Home -->

	<div class="home">
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
					  <img class="img-thumbnail" style="width:550px;height:550px;" src="/westival/resources/images/2561914_image2_1.jpg" alt="">
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
					      	  <input type="radio" class="pay_type" name="pay_type" value="가상계좌">가상계좌
					      </td>
					    </tr>				  
					  </tbody>
					</table>
					<input type="hidden" name="user_id" value="test">
					<input type="hidden" name="state" value="결제완료">
					<input type="hidden" id="import_uid" name="import_uid">
					<input type="hidden" id="paid_at" name="paid_at">
					
					
					
					<!-- <div style="float:right;width:800px;"> -->
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

	<!-- Footer -->

	<footer class="footer">
		<div class="container">
			<div class="row">

				<!-- Footer Column -->
				<div class="col-lg-3 footer_column">
					<div class="footer_col">
						<div class="footer_content footer_about">
							<div class="logo_container footer_logo">
								<div class="logo"><a href="#"><img src="/westival/resources/images/logo.png" alt="">travelix</a></div>
							</div>
							<p class="footer_about_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis vu lputate eros, iaculis consequat nisl. Nunc et suscipit urna. Integer eleme ntum orci eu vehicula pretium.</p>
							<ul class="footer_social_list">
								<li class="footer_social_item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
								<li class="footer_social_item"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
								<li class="footer_social_item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="footer_social_item"><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li class="footer_social_item"><a href="#"><i class="fa fa-behance"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Footer Column -->
				<div class="col-lg-3 footer_column">
					<div class="footer_col">
						<div class="footer_title">blog posts</div>
						<div class="footer_content footer_blog">
							
							<!-- Footer blog item -->
							<div class="footer_blog_item clearfix">
								<div class="footer_blog_image"><img src="/westival/resources/images/footer_blog_1.jpg" alt="https://unsplash.com/@avidenov"></div>
								<div class="footer_blog_content">
									<div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
									<div class="footer_blog_date">Nov 29, 2017</div>
								</div>
							</div>
							
							<!-- Footer blog item -->
							<div class="footer_blog_item clearfix">
								<div class="footer_blog_image"><img src="/westival/resources/images/footer_blog_2.jpg" alt="https://unsplash.com/@deannaritchie"></div>
								<div class="footer_blog_content">
									<div class="footer_blog_title"><a href="blog.html">New destinations for you</a></div>
									<div class="footer_blog_date">Nov 29, 2017</div>
								</div>
							</div>

							<!-- Footer blog item -->
							<div class="footer_blog_item clearfix">
								<div class="footer_blog_image"><img src="/westival/resources/images/footer_blog_3.jpg" alt="https://unsplash.com/@bergeryap87"></div>
								<div class="footer_blog_content">
									<div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
									<div class="footer_blog_date">Nov 29, 2017</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!-- Footer Column -->
				<div class="col-lg-3 footer_column">
					<div class="footer_col">
						<div class="footer_title">tags</div>
						<div class="footer_content footer_tags">
							<ul class="tags_list clearfix">
								<li class="tag_item"><a href="#">design</a></li>
								<li class="tag_item"><a href="#">fashion</a></li>
								<li class="tag_item"><a href="#">music</a></li>
								<li class="tag_item"><a href="#">video</a></li>
								<li class="tag_item"><a href="#">party</a></li>
								<li class="tag_item"><a href="#">photography</a></li>
								<li class="tag_item"><a href="#">adventure</a></li>
								<li class="tag_item"><a href="#">travel</a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Footer Column -->
				<div class="col-lg-3 footer_column">
					<div class="footer_col">
						<div class="footer_title">contact info</div>
						<div class="footer_content footer_contact">
							<ul class="contact_info_list">
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="/westival/resources/images/placeholder.svg" alt=""></div></div>
									<div class="contact_info_text">4127 Raoul Wallenber 45b-c Gibraltar</div>
								</li>
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="/westival/resources/images/phone-call.svg" alt=""></div></div>
									<div class="contact_info_text">2556-808-8613</div>
								</li>
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="/westival/resources/images/message.svg" alt=""></div></div>
									<div class="contact_info_text"><a href="mailto:contactme@gmail.com?Subject=Hello" target="_top">contactme@gmail.com</a></div>
								</li>
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="/westival/resources/images/planet-earth.svg" alt=""></div></div>
									<div class="contact_info_text"><a href="https://colorlib.com">www.colorlib.com</a></div>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</footer>

	<!-- Copyright -->

	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 order-lg-1 order-2  ">
					<div class="copyright_content d-flex flex-row align-items-center">
						<div><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
					</div>
				</div>
				<div class="col-lg-9 order-lg-2 order-1">
					<div class="footer_nav_container d-flex flex-row align-items-center justify-content-lg-end">
						<div class="footer_nav">
							<ul class="footer_nav_list">
								<li class="footer_nav_item"><a href="index.html">home</a></li>
								<li class="footer_nav_item"><a href="#">about us</a></li>
								<li class="footer_nav_item"><a href="offers.html">offers</a></li>
								<li class="footer_nav_item"><a href="blog.html">news</a></li>
								<li class="footer_nav_item"><a href="contact.html">contact</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<c:import url="../../footer.jsp" />