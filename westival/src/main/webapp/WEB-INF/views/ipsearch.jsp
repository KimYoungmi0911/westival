<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- Daum API -->

<style type="text/css">
   
   /* .form-area
   {
      width: 100%;
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
    */
   h3, div{
      color:black;
   }
   
   .ggg
   {
   width: 100%;
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

<script type="text/javascript">

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

   function searchId(){
      
      if($("#i_user_name").val().length==0 || $("#i_user_email").val().length==0 ){
         alert("빈칸을 확인해주세요.");
         return false;
      } else if(!email_check($("#i_user_email").val())){
         alert("이메일을 확인해주세요.");
           return false;
       } else{
         var user_name = $("#i_user_name").val();
         var user_email = $("#i_user_email").val();
         
         $.ajax({
            url : "searchId.do",
            type : "post",
            data : { "user_name" : user_name, "user_email" : user_email },
            dataType : "json",
            success : function(result){
               console.log(result);
               if(result.user_id=="0"){
                  alert("입력하신 회원정보로 가입된 아이디가 존재하지 않습니다.");
               } else{
                  alert("회원님의 아이디는 " + result.user_id + " 입니다.");
               }         
            },
            error : function(request, status, errorData){
               alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                     + "\n" + "error : " + errorData);
            }             
         });
       }
   }
   
   function searchPwd(){
      if($("#p_user_id").val().length==0 || $("#p_user_email").val().length==0 || $("#p_user_phone").val().length==0 ){
         alert("빈칸을 확인해주세요.");
         return false;
      } else if($("#p_user_id").val().length < 4){
         alert("아이디를 확인해주세요.");
         return false;
      } else if(!email_check($("#p_user_email").val())){
         alert("이메일을 확인해주세요.");
           return false;
       } else if( !(isCellPhone($("#p_user_phone").val())) ){
          alert("연락처를 확인해주세요");
           return false;
       }
      
      else{
         var user_id= $("#p_user_id").val();
         var user_email = $("#p_user_email").val();
         var user_phone = $("#p_user_phone").val();
         
         $.ajax({
            url : "searchPwd.do",
            type : "post",
            data : { "user_id" : user_id, "user_email" : user_email, "user_phone" : user_phone },
            dataType : "json",
            success : function(result){               
               if(result.result== "1"){
                  document.getElementById("searchPwdForm").submit();
               } else{
                  alert("입력하신 회원정보로 가입된 아이디가 존재하지 않습니다.");
               }
            
            },
            error : function(request, status, errorData){
               alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                     + "\n" + "error : " + errorData);
            }             
         });
       }
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
      <div class="container ggg">
      <h3 style="margin-bottom: 25px; text-align: center;"><img src="/westival/resources/images/titlelogo.png" style="width:10%"></h3>
         <div class="row">
         
            <div class="col">
               <div class="container" align="center">
                  <div class="form-area" >
                     <form action="" style="border:0px;">
                        <div class="form-group" align="center"> 
                           <h3 style="font-weight:bold">ID를 잃어버리셨나요?</h3><br>
                           <p>이름과 이메일을 입력하세요.</p>
                           <br>
                           <div class="form-inline form group">                  
                                   <label style="width:120px; font-weight:bold">NAME</label>&nbsp;
                                   <input type="text" class="form-1" id="i_user_name"  required style="width:300px">
                                </div><br>
                                <div class="form-inline form group">                  
                                   <label style="width:120px; font-weight:bold">EMAIL</label>&nbsp;
                                   <input type="email" class="form-1" id="i_user_email"  required style="width:300px">
                               </div>
                           </div><br>
                           <input type="submit" class="btn btn-primary pull-center" value="SEARCH ID" onclick="searchId(); return false;"
                           style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase; width:50%">
                        </form>                                                               
                     </div>
                </div>
            </div>


            <div class="col">   
               <div class="container" align="center">
                  <div class="form-area" >
                     <form action="changePwdPage.do" method="post" id="searchPwdForm" style="border:0px;">
                        <div class="form-group" align="center">
                           <h3 style="font-weight:bold">Password를 잃어버리셨나요?</h3><br>
                           <p>아이디와 이메일 그리고 핸드폰 번호를 입력하세요.</p>
                           <br>
                           <div class="form-inline form group">
                              <label style="width:120px; font-weight:bold">ID</label>&nbsp;
                              <input type="text" class="form-1" name="p_user_id" id="p_user_id" required style="width:300px">
                           </div><br>
                           <div class="form-inline form group">                  
                                   <label style="width:120px; font-weight:bold">EMAIL</label>&nbsp;
                                   <input type="email" class="form-1" name="p_user_email" id="p_user_email" required style="width:300px">
                                </div><br>
                                <div class="form-inline form group">                  
                                   <label style="width:120px; font-weight:bold">PHONE</label>&nbsp;
                                   <input type="text" class="form-1" name="p_user_phone" id="p_user_phone" required style="width:300px">
                                </div><br>
                            </div>
                            <input type="submit" class="btn btn-primary pull-center" value="SEARCH PWD" onclick="searchPwd(); return false;"
                        style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase; width:50%">
                      </form>
                  </div>
              </div>
             </div>
         </div>
         <br><br><br>
      </div>
   </div>
</div>






               
   
<!-- Footer -->
<c:import url="/WEB-INF/views/footer.jsp" />



</body>
</html>