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
	.container {
		margin-bottom: 2%;
	}
	
	#home {
		height: 90%;
		display: block;
	}
	
	.home_background {
		position: relative;
	}

	.contact_form_container {
		padding: 5px !important;
		background: #ffffff !important;
	}
	
	.input_field::-webkit-input-placeholder
	{
    	color: #350a4e !important;
		opacity: 0.3;
		font-size: 15px !important;
	}
	.input_field:-moz-placeholder
	{
	  	color: #350a4e !important;
		opacity: 0.3;
		font-size: 15px !important;
	}
	.input_field::-moz-placeholder
	{
	    color: #350a4e !important;
		opacity: 0.3;
		font-size: 15px !important;
	}
	.input_field:-ms-input-placeholder
	{ 
	    color: #350a4e !important;
		opacity: 0.3;
		font-size: 15px !important;
	}
	.input_field::input-placeholder
	{
	    color: #350a4e !important;
		opacity: 0.3;
		font-size: 15px !important;
	}
	
 	#contact_form {
		width: 75%;
		margin: 2% 0 0 12.5%;
		border-radius: 20px;
		padding: 30px;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa; 
	}
	
	#contact_form > div {
		text-align: left;
	}
	
	#contact_form > div > h5 {
		margin: 4% 0 0.5% 0;
		color: #350a4e;
	}
	
	#contact_form > div > p {
		border-bottom: 1.5px solid #c8d7fb;
		font-size: 17px;
		color: #350a4e;
	}
	
	#contact_form > div >  input {
		color: #350a4e;
		width: 100%;
		border-bottom: 1.5px solid #c8d7fb;
		margin: 0 0 1% 0;
		font-size: 17px;
	}
	
 	#form_address_button {
		width: 100%;
		background-color: #bebebe;
		margin: 0 0 2% 0;
		font-size: 13px;
		border: none;
		border-radius: 3px;
	}
	
	#form_edit_button {
		width: 20%;
		font-size: 15px;
		margin: 0;
		border: none;
	}
	
	#form_retirement_button {
		width: 20%;
		background-color: #bebebe;
		margin: 0 0 0 2%;
		font-size: 15px;
		border: none;
	}
	
	@media only screen and (max-width: 994px) {
		#form_edit_button, #form_retirement_button {
			width: 30%;
		}
	}
	 
	@media only screen and (max-width: 988px) {
		#contact_form_password {
			width: 63% !important;
		}
		
		#form_password_button {
			width: 30%;
			margin: 0 0 0 3%;
		}
	}
	
	@media only screen and (max-width: 770px) {
		#contact_form_password {
			width: 100% !important;
		}
		
		#form_password_button {
			width: 100%;
			margin: 0 0 2% 0;
		}
	}
	
	@media only screen and (max-width: 754px) {
		#form_edit_button, #form_retirement_button {
			width: 40%;
		}
	}
	
	@media only screen and (max-width: 485px) {
		#form_edit_button {
			width: 100%;
		}
		
		#form_retirement_button {
			width: 100%;
			margin: 2% 0 0 0;
		}
	}
	
	@media only screen and (max-width: 460px) {
		 #form_address_button {
			margin-bottom: 10%;
		}
	}
	
/* 	#sticky {
	    position: fixed;
	    width: 100%;
	    height: 5%;
	    top: 95%;
	    background-color: #bebebe;
	    color: #000;
	    padding: 0;
	    font-size: 20px;
	    text-align: center;
	    z-index: 1;
	    opacity: 0.8;
	} */
</style>
<script type="text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById('sample6_address2').focus();
            }
        }).open();
        
        $("#form_edit_button").on("click", function() {
        	alert("회원정보가 수정 되었습니다.");
        });
    }
</script>
<body>
<div class="super_container">
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/header.jsp" />

	<!-- Home -->
	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">회원정보 관리</div>
		</div>
	</div>
	
	<div class="container">
		<c:import url="tabHeader.jsp" />
		<c:url var="deleteMemberInfo" value="deleteMemberInfo.do">
			<c:param name="user_id" value="${sessionScope.member.user_id }" />
		</c:url>
		<div class="contact_form_container">
			<c:if test="${sessionScope.member.user_id != null }">
			<form action="updateMemberInfo.do" id="contact_form" class="contact_form text-center" method="post">
				<div>
					<h5>아이디</h5>
					<p>${sessionScope.member.user_id }</p>
				</div>
				<div>
					<h5>비밀번호</h5>
					<input type="text" id="contact_form_password" name="user_pwd" class="contact_form_email input_field" placeholder="비밀번호" required="required" data-error="Email is required." value="${sessionScope.member.user_pwd }">
				</div>
				<div>
					<h5>이메일</h5>
					<input type="text" id="contact_form_email" name="user_email" class="contact_form_email input_field" placeholder="비밀번호" required="required" data-error="Email is required." value="${sessionScope.member.user_email }">
				</div>
				<div>
					<h5>이름</h5>
					<p>${sessionScope.member.user_name }</p>
				</div>
				<div>
					<h5>전화번호</h5>
					<input type="text" id="contact_form_phone" name="user_phone" class="contact_form_subject input_field" placeholder="전화번호" required="required" data-error="phone is required."  value="${sessionScope.member.user_phone }">
				</div>
				<div>
					<h5>주소</h5>
					<input type="text" id="sample6_address" name="user_address" class="contact_form_subject input_field" placeholder="주소" required="required" data-error="Subject is required."  value="${sessionScope.member.user_address }">
					<button type="button" id="form_address_button" class="form_submit_button button trans_200" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
					<input type="hidden" id="sample6_postcode" class="contact_form_subject input_field" placeholder="우편번호">
				</div>
				<div>
					<h5>생년월일</h5>
					<p>${sessionScope.member.user_birth }</p>
				</div>
				<div>
					<h5>성별</h5>
					<p>${sessionScope.member.user_gender }</p>
				</div>
				<button type="submit" id="form_edit_button" class="form_submit_button button trans_200" onclick="confirm('회원정보를 수정하시겠습니까?')">수정<span></span><span></span><span></span></button>
				<button type="button" id="form_retirement_button" class="form_submit_button button trans_200" onclick="deleteMemberInfo();">탈퇴<span></span><span></span><span></span></button>
			</form>
			<script type="text/javascript">
				function deleteMemberInfo() {
					if(confirm('탈퇴하시겠습니까?') == true) {
						location.href="${deleteMemberInfo }";
					} else {
						return;
					}
				}
			</script>	
			</c:if>
			<c:if test="${sessionScope.member.user_id == null }">
				<div align="center" style="margin-top: 5%;"><img src="resources/images/logo1.PNG" alt="logo" width="20%" height="10%"></div>
				<h3 style="text-align: center; margin-top: 5%; margin-bottom: 5%;">로그인이 필요한 서비스 입니다.</h3>	
			</c:if>
		</div>
	</div>
	<!-- <div id="sticky">회원정보가 수정되었습니다.</div> -->
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/footer.jsp" />

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/westival/resources/js/contact_custom.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</body>

</html>