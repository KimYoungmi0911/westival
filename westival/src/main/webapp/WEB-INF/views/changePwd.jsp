<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
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

<script type="text/javascript">
function changePWDbg10(){   
    $("#changePwd1").css("background-color", "#fffff0");
 }


function changePWDbg20(){
    if($("#changePwd1").val() != $("#changePwd2").val()){
       $("#changePwd2").css("background-color", "#FFCECE");
    }else {
    $("#changePwd2").css("background-color", "#fffff0");
    }
 }



   function changePwd(){
      if($("#changePwd1").val()!=$("#changePwd2").val()){
    	  alert("비밀번호가 일치하지 않습니다.");
    	  return false;
      } else{
    	  var id = "${user_id}";
    	  var pwd = $("#changePwd1").val();
    	  
          $.ajax({
              url : "changePwd.do",
              type : "post",
              data : { user_id : id, user_pwd : pwd },
              dataType : "json",
              success : function(result){
                 if(result.result=="1"){
                	 alert("비밀번호가 변경되었습니다.");
                	 location.href="main.do";
                 } else{
                	 alert("비밀번호가 변경되지 않았습니다.");
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
      <div class="container">
         <div class="row">
            <div class="col">   
               <div class="container" align="center">
                   <div class="form-area" >  
                   
                       <form action="" method="post" id="changePwd" style="border:0px;">
                          <!-- <br style="clear:both"> -->
                          <img src="/westival/resources/images/titlelogo.png" style="width:20%">
                          <br><br>
                          <h6 style="margin-bottom: 25px; text-align: center;">새로 사용 할 비밀번호를 입력해주세요!</h6>
                         <br>
                           <div class="form-group" align="center">      
                              <div class="form-inline form group">                  
                               <label style="width:120px; font-weight:bold">비밀번호</label>&nbsp;
                               <input type="password" class="form-1" id="changePwd1" name="changePwd1" required oninput = "changePWDbg10()" style="width:300px">
                            </div><br>
                              <div class="form-inline form group">                  
                                <label style="width:120px; font-weight:bold">확인</label>&nbsp;
                                <input type="password" class="form-1" id="changePwd2" name="changePwd2" required oninput = "changePWDbg20()" style="width:300px">
                             </div>
                            </div>
                            <br>                                                               
                        <input type="submit" class="btn btn-primary pull-center" value="LOGIN" onclick="changePwd(); return false;"
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