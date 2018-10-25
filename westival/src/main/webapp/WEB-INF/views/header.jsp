<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="stylesheet" type="text/css"
   href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
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
   #header-color{background-color:#350a4e; border-color:#350a4e; border:0px solid #350a4e;}
   #dropdown-menu:hover{color:red;}
   #dropdown-menu {color:#350a4e;}
   #dropdownMenuButton2 {color:#350a4e;}
   
   #dropdownMenuButton2 {
   color: #350a4e;
}
</style>


</head>

<body>      

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
 <!--   <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
   <script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
   <script
      src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
   <script src="/westival/resources/plugins/easing/easing.js"></script>
   <script src="/westival/resources/js/custom.js"></script>
   

<!-- Header -->
<div class="super_container">

<header class="header">


   <div class="top_bar">
         <div class="container">
            <div class="row">
               <div class="col d-flex flex-row">
                   <div class="phone">+ 안될거없조</div>
                   
                   <div class="user_box ml-auto">            
                     <div class=" user_box_link"><a href="index.jsp">westival에 오신 것을 환영합니다!</a></button></div>
                                    
                  </div>
                  
               </div>
            </div>
         </div>      
      </div>

      

      <!-- Main Navigation -->

      <nav class="main_nav">
         <div class="container">
            <div class="row">
            <c:if test="${sessionScope.member.user_id != 'admin' || empty sessionScope.member }">
               <div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
                  <div class="logo_container">
                     <div class="logo"><a href="index.jsp">westival</a></div>
                  </div>
                  
                  <div class="main_nav_container ml-auto">
                     <ul class="main_nav_list">
                     
                        <li class="main_nav_item"><a href="index.jsp">home &nbsp;</a></li>   
                                                                                          
                        
                        
                        <li class="main_nav_item">
                          <div class="dropdown">
                           <a class="dropdown-toggle"  href="#" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              my page
                           </a>
                           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                               <a class="dropdown-item" href="memberInfo.do" id="dropdown-menu">내정보 관리</a>
                               <a class="dropdown-item" href="recommendList.do" id="dropdown-menu">예매 내역</a>
                               <a class="dropdown-item" href="likeFesta.do" id="dropdown-menu">관심 축제</a>
                             </div>
                          </div>
                        </li>
                        
                        <li class="main_nav_item">
                          <div class="dropdown">
                           <a class="dropdown-toggle"  href="#" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              support page
                           </a>
                           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                               <a class="dropdown-item" href="noticeview.do" id="dropdown-menu">공지사항</a>                           
                               <a class="dropdown-item" href="insertFestivalPage.do" id="dropdown-menu">축제 등록</a>
                               <a class="dropdown-item" href="commuPage.do" id="dropdown-menu">동행 게시판</a>
                               <a class="dropdown-item" href="qnaBoard.do" id="dropdown-menu">문의 게시판</a>
                             </div>
                          </div>
                        </li>
                        
                        <c:if test="${empty sessionScope.member }">
                           <li class="main_nav_item" style="color:white;">
                              <a href="loginPage.do" style="color:white;">로그인</a>
                           </li>
                           <li class="main_nav_item" style="color:white;">
                              <a href="registerPage.do" style="color:white;">회원가입</a>
                           </li>
                        </c:if>                           
                        <c:if test="${!empty sessionScope.member }">
                           <li class="main_nav_item" style="color:white;">
                              ${ member.user_name }님 &nbsp;&nbsp; <a href="logout.do" style="color:red;">로그아웃</a>
                           </li>
                        </c:if>                        
                     </ul>
                  </div>
                  <div class="hamburger">

                        <div class="dropdown">
                           <a class="dropdown-toggle" href="#" id="dropdownMenuButton2"
                              data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false"> <i class="fa fa-bars trans_200"></i>
                           </a>
                           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" href="index.jsp" id="dropdown-menu"
                                 style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">HOME</a>
                              <a class="dropdown-item" href="memberInfo.do" id="dropdown-menu"
                                 style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">MY PAGE</a> 
                              <a class="dropdown-item" href="noticeview.do" id="dropdown-menu"
                                 style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">SUPPORT PAGE</a> 
                                  
                                
                           </div>
                        </div>

                     </div>

               </div>
               </c:if>
               <c:if
                  test="${sessionScope.member.user_id == 'admin' && !empty sessionScope.member}">
                  
                  <div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
                  <div class="logo_container">
                     <div class="logo"><a href="index.jsp">westival</a></div>
                  </div>
                  
                  <div class="main_nav_container ml-auto">
                     <ul class="main_nav_list">
                     <li class="main_nav_item"><a href="index.jsp">home</a></li>
                     
                     <li class="main_nav_item">
                          <div class="dropdown">
                           <a class="dropdown-toggle"  href="#" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Management page
                           </a>
                           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                               <a class="dropdown-item" href="adminfestival.do" id="dropdown-menu">축제 관리</a>                           
                               <a class="dropdown-item" href="adminticket.do" id="dropdown-menu">예약 관리</a>
                               <a class="dropdown-item" href="adminmember.do" id="dropdown-menu">회원 관리</a>
                               <a class="dropdown-item" href="noticeview.do" id="dropdown-menu">공지 관리</a>
                               <a class="dropdown-item" href="qnaBoard.do" id="dropdown-menu">문의 관리</a>
                               
                             </div>
                          </div>
                        </li>    
                        
                              
                           
                        <c:if test="${empty sessionScope.member }">
                           <li class="main_nav_item" style="color:white;">
                              <a href="loginPage.do" style="color:white;">로그인</a>
                           </li>
                           <li class="main_nav_item" style="color:white;">
                              <a href="registerPage.do" style="color:white;">회원가입</a>
                           </li>
                        </c:if>                           
                        <c:if test="${!empty sessionScope.member }">
                           <li class="main_nav_item" style="color:white;">
                              ${ member.user_name }님 &nbsp;&nbsp; <a href="logout.do" style="color:red;">로그아웃</a>
                           </li>
                        </c:if>                        
                     </ul>
                  </div>
                    <div class="hamburger">

                        <div class="dropdown">
                           <a class="dropdown-toggle" href="#" id="dropdownMenuButton2"
                              data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false"> <i class="fa fa-bars trans_200"></i>
                           </a>
                           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" href="index.jsp" id="dropdown-menu"
                                 style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">HOME</a>
                              <a class="dropdown-item" href="adminfestival.do" id="dropdown-menu"
                                 style="font-family: 'Open Sans', sans-serif; text-transform: uppercase;">MANAGEMENT PAGE</a> 
                                
                           </div>
                        </div>

                     </div> 

               </div>
               
                  
               </c:if>
            </div>
         </div>   
      </nav>

</header>
</div>

</body>
</html>