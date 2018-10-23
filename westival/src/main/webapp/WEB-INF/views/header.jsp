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

 
<style type="text/css">
   #header-color{background-color:#350a4e; border-color:#350a4e; border:0px solid #350a4e;}
   #dropdown-menu:hover{color:red;}
   #dropdown-menu {color:#350a4e;}
   #dropdownMenuButton2 {color:#350a4e;}
</style>


</head>

<body>


<!-- Modal-login -->
<%-- <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
         <div class="modal-header">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <img src="/westival/resources/images/logo.png"   class="modal-title rounded mx-auto d-block" width="80" height="80">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
           </div>
           
            <div class="modal-body">
            <%@ include file="login.jsp" %> <br>
            <div style="text-align: center;">
               <button type="button" class="btn btn-secondary" 
                         style="width:100px; background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;"
                         data-toggle="modal" data-target="#register">회원가입</button>
               <button type="button" data-dismiss="modal" data-toggle="modal"
                        data-target="#ipsearch"
                        style="width:215px; background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;"
                        class="btn btn-secondary">아이디 / 비밀번호 찾기
               </button><br><br><br>
            </div>         
         </div>
      </div>
   </div>
</div> --%>

<!-- Modal-register -->
<%-- <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
         <div class="modal-header">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <img src="/westival/resources/images/logo.png" class="modal-title rounded mx-auto d-block" width="80" height="80">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body"><%@ include file="register.jsp" %></div>
      </div>
   </div>
</div> --%>


<!--Modal- id/pw찾기 -->
<%-- <div class="modal fade" id="ipsearch" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
         <div class="modal-header">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <img src="/westival/resources/images/logo.png"   class="modal-title rounded mx-auto d-block" width="80" height="80">                 
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
              </button>
            </div>
         <div class="modal-body">
            <%@ include   file="ipsearch.jsp"%>
         </div>
      </div>
   </div>
</div> --%>
      
      
   

<!-- Header -->
<div class="super_container">

<header class="header">

      <!-- Top Bar -->

      <%-- <div class="top_bar">
         <div class="container">
            <div class="row">
               <div class="col d-flex flex-row">
                   <div class="phone">+ 안될거없조</div>
                   
                  <c:if test="${empty sessionScope.member }">
               
                  <div class="user_box ml-auto">            
                     <div class="user_box_login user_box_link"><button id="header-color" data-toggle="modal" data-target="#login"><a href="#">login</a></button></div>
                     <div class="user_box_register user_box_link"><button id="header-color" data-toggle="modal" data-target="#register"><a href="#" >register</a></button></div>                  
                  </div>
                  </c:if>
                  
                  <c:if test="${!empty sessionScope.member }">
                  <div class="user_box ml-auto">                  
                     <div class="user_box_login user_box_link"><a href="#">${member.user_name }</a></div>
                     <div class="user_box_register user_box_link"><a href="logout.do">logout</a></div>                  
                  </div>
                  </c:if>
               </div>
            </div>
         </div>      
      </div> --%>

      <!-- Main Navigation -->

      <nav class="main_nav">
         <div class="container">
            <div class="row">
               <div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
                  <div class="logo_container">
                     <div class="logo"><a href="index.jsp">westival</a></div>
                  </div>
                  
                  <div class="main_nav_container ml-auto">
                     <ul class="main_nav_list">
                        <li class="main_nav_item"><a href="index.jsp">home &nbsp;</a></li>   
                                                                                          
                        <li class="main_nav_item"><a href="#">my surroundings</a></li>
                        
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
                               <a class="dropdown-item" href="#" id="dropdown-menu">약관 및 정책</a>
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

               </div>
            </div>
         </div>   
      </nav>

</header>
</div>

</body>
</html>