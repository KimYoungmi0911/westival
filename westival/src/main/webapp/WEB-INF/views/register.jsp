<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- Daum API -->

<style type="text/css">
   
   .form-area
   {
      width: 50%;
      align: center;
       background-color: #E8D9FF;
      padding: 10px 40px 60px;
      margin: 10px 0px 60px;
      border: 0px solid GREY;
      box-shadow : inset 0px 0px 80px #fff,
         inset 0px 0px 80px #fff,
         inset 0px 0px 80px #fff,
         inset 0px 0px 80px #fff
      
   }
   
   h3, div{
      color:black;
   }


   .form-1 {
       display: block;
       padding: .375rem .75rem;
       font-size: 1rem;
       line-height: 1.5;
       color: #495017;
       background-color: #fff;
       background-image: none;
       background-clip: padding-box;
       border: 1px solid #ced4da;
       border-radius: .25rem;
       transition: border-color cubic-bezier(0.4, 0, 1, 1) .15s,box-shadow ease-in-out .15s;
   }
   
   
   #home{
      height:90%;
      display:block;
   }
   
   .home_background {
      position:relative;
   }
   


</style>

<script type="text/javascript" >
   function checkId(){   
      var id = $("#cId").val();
      
      if(id.length==0){
         alert("아이디를 입력해주세요.");
         return false;
      }      
      if((id.length < 4) || (id.length > 12)){
         alert("아이디는 4~12자 사이의 영문 소문자 또는 숫자로 이루어져야 합니다.");
         return false;
      }   
      for(var i=0; i<id.length; i++){
         var ch = id.charAt(i);
         if( (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) || ch==' '){
            alert("아이디는 4~12자 사이의 영문 소문자 또는 숫자로 이루어져야 합니다.")
            return false;
         }
      }
         
      $.ajax({
         url : "checkid.do",
         type : "post",
         data : {user_id : id},
         success : function(data){
            if(data == 1){
               $("#cId").css("background-color", "#FFCECE");
               alert("이미 사용중인 아이디 입니다.");
            }else {
               $("#cId").css("background-color", "#FFFFF0");
               if(confirm("사용해도 좋은 아이디입니다. 아이디를 사용하시겠습니까?")){
            	   $("#cId").attr("readonly", true);
               }
            }
         }
      });   
   }
   
   
   function changePWDbg1(){   
      $("#cPwd1").css("background-color", "#fffff0");
   }
   
   function change1(){   
	      $("#cAddress2").css("background-color", "#fffff0");
	   }
   function change2(){   
	      $("#cPhone").css("background-color", "#fffff0");
	   }
   function change3(){   
	      $("#cEmail").css("background-color", "#fffff0");
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

   // 이메일 유효성 검사
   function email_check( email ) {       
       var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
       return (email != '' && email != 'undefined' && regex.test(email));
    
   }
   // 전화번호 유효성 검사
   function isCellPhone(p) {   
      p = p.split('-').join('');
      var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
      return regPhone.test(p);
   }

   function validate(){
      var id = $("#cId").val();

      if(id.length==0){
         alert("아이디를 입력해주세요.");
         return false;
      }      
      if((id.length < 4) || (id.length > 12)){
         alert("아이디는 4~12자 사이의 영문 소문자 또는 숫자로 이루어져야 합니다.");
         return false;
      }      
      for(var i=0; i<id.length; i++){
         var ch = id.charAt(i);
         if( (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) || ch==' '){
            alert("아이디는 4~12자 사이의 영문 소문자 또는 숫자로 이루어져야 합니다.")
            return false;
         }
      }
      
      if($("#cPwd1").val() != $("#cPwd2").val()){
         alert("비밀번호가 일치하지 않습니다.");
         return false;
      }
      if($("#cPwd1").val().length < 4){
         alert("비밀번호를 4자리 이상 입력해주세요.");
         return false;
      }
      
      if($("#cName").val().length <2){
         alert("이름을 2글자 이상 입력해주세요.");
         return false;
      }
      
      if($("#cAddress").val().length == 0 || $("#cAddress2").val().length == 0 ){
         alert("주소를 확인해주세요.");
         return false;
      }   
      
      if(!email_check($("#cEmail").val())){
         alert("이메일을 확인해주세요.");
         return false;
      }
      
      if( !(isCellPhone($("#cPhone").val())) ){
         alert("연락처를 확인해주세요");
         return false;
      }
      alert("회원 가입이 완료되었습니다.");
      document.registerForm.submit(); // 폼태그 전송

   }


</script>

</head>
<body>

<c:import url="/WEB-INF/views/header.jsp" />

<div class="super_container">
   
   
   <!-- Home -->
   <div class="home" id="home">
      <div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/contact_background.jpg"></div>
      <div class="home_content">
         <div class="home_title"></div>
      </div>
   </div>
   
   <div class="contact_form_section">
      <div class="container">
         <div class="row">
            <div class="col">   
               <div class="container" align="center">
                   <div class="form-area" >  
                   
                       <form action="register.do" method="post" id="registerForm">
                       <h3 style="margin-bottom: 25px; text-align: center;"><img src="/westival/resources/images/titlelogo.png" style="width:20%"></h3>
                        <label style="font-weight:bold"" for="">ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <div class="form-group form-inline">
                            <input type="text" class="form-control" name="user_id" id="cId" style="width: 80%;"
                            placeholder="ID (4~12글자 사이의 영문 소문자,숫자만 입력)" oninput = "" autocomplete="off" required>
                            <input type="button" class="btn btn-secondary"  value="Confirm" id="checkidbtn" onclick="checkId();"
                            style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; width:20%">                                             
                          </div>
                          <div class="form-group">
                            <label  style="font-weight:bold" for="">Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="password" class="form-control" name="user_pwd" id="cPwd1" 
                             placeholder="비밀번호" oninput = "changePWDbg1()" autocomplete="off" required>         
                          </div>
                          <div class="form-group">
                            <label style="font-weight:bold" for="">Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                            <input type="password" class="form-control" name="user_pwd2" id="cPwd2"
                             placeholder="비밀번호 확인" oninput = "changePWDbg2()" autocomplete="off" required>
                          </div>
                          <div class="form-group">
                            <label style="font-weight:bold" for="">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="text" class="form-control" name="user_name" id="cName"
                             placeholder="이름" oninput = "changeNamebg()" autocomplete="off" required>
                          </div>
                          <div class="form-group">
                            <label style="font-weight:bold" for="">Birth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="date" class="form-control" name="user_birth" id="cBirth"
                             placeholder="생년월일" oninput = "changeBirthbg()" value="1990-01-01" autocomplete="off" required>
                          </div>
                          <label style="font-weight:bold" for="">Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                          <div class="form-group form-inline">
                            <input type="text" class="form-control" name="user_address" id="cAddress" style="width: 80%;"
                             placeholder="주소" oninput = "" autocomplete="off" readonly required>
                             <button type="button" class="btn btn-secondary" style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; width:20%" onclick="addressApi()">
                               Address
                            </button><br>
                            <input type="text" class="form-control" name="user_address" id="cAddress2" style="width: 100%;"
                             placeholder="상세주소" oninput = "change1()" autocomplete="off" required>
                          </div>
                       
                          <div class="form-group">
                            <label style="font-weight:bold" for="">Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input type="tel" class="form-control" name="user_phone" id="cPhone"
                             placeholder="연락처" oninput = "change2()" autocomplete="off" required>
                          </div>
                          <label style="font-weight:bold" for="">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                          <div class="form-group">
                            <input type="email" class="form-control" name="user_email" id="cEmail"
                             placeholder="이메일" oninput = "change3()" autocomplete="off" required>
                          </div>                                                      
                          <div class="form-group">
                             <label style="font-weight:bold" for="">Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><br>
                             <div class="btn-group btn-group-toggle" data-toggle="buttons" style="width:460px">
                             <label class="btn btn-secondary active" style="width:50%;">
                                <input type="radio"  name="user_gender" id="cGender" autocomplete="off" value="M" checked> 남성
                             </label>
                             <label class="btn btn-secondary" style="width:50%;">
                               <input type="radio"  name="user_gender" id="cGender" autocomplete="off" value="W"> 여성
                             </label>
                             </div>
                          </div>
            
                        <br>
                         <div class = "input-group-append" style="text-align:center;">
                          <input type="submit" class="btn btn-primary" value = "refister" id ="loginbtn"  onclick="javascript:validate(); return false;"
                          style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase; width:50%">
                          </div>
                          <br><br>
                     </form>
                     
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>
</div>





               
   
<!-- Footer -->
<c:import url="/WEB-INF/views/footer.jsp" />



</body>
</html>