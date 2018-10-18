<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입 페이지</title>
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

	
</style>

<script type="text/javascript" >

var getPhone = RegExp(/ [0-9]/);

function checkId(){	
	$.ajax({
		url : "checkid.do",
		type : "post",
		data : {user_id : $("#cId").val()},
		success : function(data){
			if(data == 1){
				$("#cId").css("background-color", "#FFCECE");
				alert("이미 사용중인 아이디 입니다.");
			}else {
				$("#cId").css("background-color", "#FFFFF0");
				alert("사용해도 좋은 아이디 입니다.")
			}
			
		}
	});	
}


function changePWDbg1(){	
	$("#cPwd1").css("background-color", "#fffff0");
}

function changePWDbg2(){
	if($("#cPwd1").val() != $("#cPwd2").val()){
		$("#cPwd2").css("background-color", "#FFCECE");
	}else {
	$("#cPwd2").css("background-color", "#fffff0");
	}
}

function changeNamebg(){	
	$("#cName").css("background-color", "#fffff0");
}

function changeBirthbg(){	
	$("#cBirth").css("background-color", "#fffff0");
}

function addressApi(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
          /*   document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr; */
            document.getElementById('cAddress').value = data.jibunAddress;
            $("#cAddress").css("background-color", "#fffff0");
            
        }
    }).open();
}


</script>

</head>
<body>

  				
  		<div> 
			<form action="" method="post" onsubmit = "return false;">
				<label for="">ID</label>
				<div class="form-group form-inline">
    				<input type="text" class="form-control" name="user_id" id="cId" style="width: 380px;"
    				placeholder="ID" oninput = "" autocomplete="off" >
    				<input type="button" class="btn btn-secondary"  value="Confirm" id="checkidbtn" onclick="checkId();" 
    				style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif;">   									   				
  				</div>
  				<div class="form-group">
    				<label for="">Password</label>
    				<input type="password" class="form-control" name="user_pwd" id="cPwd1"
    				 placeholder="Password" oninput = "changePWDbg1()" autocomplete="off">   		
  				</div>
  				<div class="form-group">
    				<label for="">Confirm Password</label>
    				<input type="password" class="form-control" name="user_pwd" id="cPwd2"
    				 placeholder="Password" oninput = "changePWDbg2()" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Name</label>
    				<input type="text" class="form-control" name="user_name" id="cName"
    				 placeholder="Name" oninput = "changeNamebg()" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Birth</label>
    				<input type="date" class="form-control" name="user_birth" id="cBirth"
    				 placeholder="Birth" oninput = "changeBirthbg()" value="2018-01-01" autocomplete="off">
  				</div>
  				<label for="">Address</label>
  				<div class="form-group form-inline">
    				<input type="text" class="form-control" name="user_address" id="cAddress" style="width: 380px;"
    				 placeholder="Address" oninput = "" autocomplete="off">
    				 <button type="submit" class="btn btn-secondary" style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif;" onclick="addressApi()">
    					Address
    				</button>
  				</div>
  			
  				
  				<div class="form-group">
    				<label for="">Phone</label>
    				<input type="tel" class="form-control" name="user_phone" id="user_phone"
    				 placeholder="Phone" oninput = "" autocomplete="off">
  				</div>
  				<label for="">Email</label>
  				<div class="form-group form-inline">
    				<input type="email" class="form-control" name="user_email" id="user_email" style="width: 380px;"
    				 placeholder="Email" oninput = "" autocomplete="off">
    				 <button type="submit" class="btn btn-secondary" style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif;">
    					Certified
    				</button>
  				</div>  								  				  				
  				<div class="form-group">
    				<label for="">Authentication number</label>
    				<input type="text" class="form-control" name="" id=""
    				 placeholder="Authentication number" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
  					<label for="">Gender</label><br>
  					<div class="btn-group btn-group-toggle" data-toggle="buttons">
    				 <label class="btn btn-secondary active" style="width:235px;">
    				 	<input type="radio"  name="user_gender" id="user_gender" autocomplete="off" value="m" checked> Man
    				 </label>
    				 <label class="btn btn-secondary" style="width:235px;">
    					<input type="radio"  name="user_gender" id="user_gender" autocomplete="off" value="w"> Woman
    				 </label>
    				 </div>
  				</div>
  					
  				
				<br>
 				<div class = "input-group-append" style="text-align:center;">
  				<input type="submit" class="btn btn-primary" value = "refister" id ="loginbtn" onclick = "checkidpw()" 
  				style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">
  				</div>
  				<br><br>
			</form>
		</div>
		
</body>
</html>