<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>축제 검색 페이지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/westival/resources/js/offers_custom.js"></script>

<link rel="stylesheet" type="text/css" href="/westival/resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/offers_responsive.css">

<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> --> <!-- pagination -->

<style type="text/css">
   #dropdown-menu {
       color: #350a4e;
   }
   
   .pagination {
     display: -webkit-flex;
     display:         flex;
     -webkit-align-items: center;
             align-items: center;
     -webkit-justify-content: center;
             justify-content: center;
     margin: 20px 0px 0px;
     padding : 0px;
   }

   .pagination li a, .pagination li span{
          position: relative;
       float: left;
       padding: 6px 12px;
       margin-left: -1px;
       line-height: 1.42857143;
       color: #428bca;
       text-decoration: none;
       background-color: #fff;
       border: 1px solid #ddd;
   }
   
   .pagination>.active span{
      z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #428bca;
    border-color: #428bca;
   }
   
   .pagination>.disabled span{
      color: #777;
       cursor: not-allowed;
       background-color: #fff;
       border-color: #ddd;
   }
   
   .pagination li a{
      display : block;
   }
   
   .pagination li a:hover{
      background-color: rgb(221, 221, 221);
   }
   
   .pagination>li:first-child {
       border-top-left-radius: 4px;
       border-bottom-left-radius: 4px;
   }
   .pagination>li:last-child {
      border-top-right-radius: 4px;
       border-bottom-right-radius: 4px;
   }
   
</style>

<script type="text/javascript">
   
   function locationSearch(page){
      
      if($("#address").val()==0 || $("#start_date").val().length==0 
            || $("#end_date").val().length==0 || $(":checkbox[name='theme']:checked").length==0){
         alert("빈칸을 확인해주세요");
         return;
      }
      
      if($("#start_date").val()>$("#end_date").val()){
         alert("날짜를 확인해주세요");
         return;
      }
      
      var themeArr = document.getElementsByName("theme");
      var theme = '';
      
      for(var i=0; i<themeArr.length; i++){         
         if(themeArr[i].checked)
            theme += themeArr[i].value+",";
      }   
      
      var address = $("#address").val();
      var startDate = $("#start_date").val();
      var endDate = $("#end_date").val();
      var page = page;
      
      $.ajax({
         url : "locationSearch.do",
         data : { address : address, start_date : startDate, end_date : endDate, theme : theme, page : page },
         type : "post",
         dataType : "json",
         success : function(result){   
            // 1. 리턴된 객체를 문자열로 바꿈
            var objStr = JSON.stringify(result);
            // 2. 문자열을 json 객체로 바꿈
            var jsonObj = JSON.parse(objStr);      
            
            var resultList='';
            var scrap='';            
            var paging = '';
            var maxPage = jsonObj.maxPage;
            var startPage = jsonObj.startPage;
            var endPage = jsonObj.endPage;
            var currentPage = jsonObj.currentPage;
            
            if(jsonObj.list.length==0){
               alert("검색 결과가 없습니다.");
            } else {
               for(var i in jsonObj.list){ 
                  if(jsonObj.list[i].scrap==0)
                     scrap="<img src='/westival/resources/images/jjim1.png'>";
                  else if(jsonObj.list[i].scrap==1){
                     scrap="<img src='/westival/resources/images/jjim2.png'>";
                  }
                  
                  resultList += "<div class='offers_item'><div class='row'><div class='col-lg-3 col-1680-4'><div class='offers_image_container'>"
                     + "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name
                     + "'></div></div></div><div class='col-lg-8'><div class='offers_content'><div class='offers_price'>" + jsonObj.list[i].name + "</div><p class='offers_text'>" 
                     + "<font color='black' size='4px'>" + jsonObj.list[i].start_date + "일 부터 " + jsonObj.list[i].end_date + "일 까지</font><br>" +jsonObj.list[i].content +"<br><br><br>" 
                     + "</p><div class='button book_button'><a href='Info.do?no=" + jsonObj.list[i].no + "'>상세보기<span></span><span></span><span></span></a></div>" 
                     + "<div class='offer_reviews'><div class='offer_reviews_content'><div class='offer_reviews_subtitle'>" + jsonObj.list[i].recommend 
                     + " 명의 추천을 받았습니다.</div></div>" ;
                  
                  if(jsonObj.list[i].scrap!=2){
                     resultList += "<div class='offer_reviews_rating text-center' style='background-color:#ffffff;'><a href='#' id='scrapCheck' onclick='scrap(" + jsonObj.list[i].no +"); return false;'>"
                     + scrap + "</a></div>";
                  }   
                  
                  resultList += "</div></div></div></div></div>";
                  /* console.log("축제번호 : " + jsonObj.list[i].no + ", 축제명 : " + jsonObj.list[i].name +
                        ", 이미지 : " + jsonObj.list[i].new_img_name + ", 주소 : " + jsonObj.list[i].address +
                        ", 시작날짜 : " + jsonObj.list[i].start_date + ", 종료날짜 : " + jsonObj.list[i].end_date +
                        ", 테마 : " + jsonObj.list[i].theme + ", 태그 : " + jsonObj.list[i].tag + ", 추천수 : " + jsonObj.list[i].recommend); */
               }
               
               if(currentPage <= 1){
                      //paging += "[맨처음]&nbsp";
                      paging += "<li class='disabled'><span>맨처음</span></li>";
                   } else {
                      //paging += "<a href='javascript:paging(1);'>[맨처음]</a>";
                      paging += "<li><a href='javascript:locationSearch(1);'>맨처음</a></li>";
                   }
               
                  if( ((currentPage-10) >= 1)){
                     var page = startPage-10;
                     //paging += "<a href='javascript:paging(" + page + ");'>[이전]</a>";
                     paging += "<li><a href='javascript:locationSearch(" + page + ");'>이전</a></li>";
                  } else{
                     //paging += "[이전]&nbsp";
                     paging += "<li class='disabled'><span>이전</span></li>";
                  }
                  
                  for(var i=startPage ; i<=endPage ; i++){
                     if(i==currentPage){
                        //paging += "<font color='red'>[" + i + "]</font>";
                        paging += "<li class='active'><span>" + i + "</span></li>";
                     } else{
                        //paging += "<a href='javascript:paging(" + i + ");'>[" + i +"]</a>";
                        paging += "<li><a href='javascript:locationSearch(" + i + ");'>" + i +"</a></li>";
                     }
                  }
                  
                  if( ( (startPage+10) <= maxPage ) ){
                     var page = startPage+10;
                     //paging += "<a href='javascript:paging(" + page + ");'>[다음]</a>";
                     paging += "<li><a href='javascript:locationSearch(" + page + ");'>다음</a></li>";
                  } else{
                     //paging += "[다음]&nbsp";
                     paging += "<li class='disabled'><span>다음</span></li>";
                  }
                  
                  if( currentPage >= maxPage){
                     //paging += "[맨끝]&nbsp";
                     paging += "<li class='disabled'><span>맨끝</span></li>";
                  } else{
                     var page = maxPage;
                     //paging += "<a href='javascript:paging(" + page + ");'>[맨끝]</a>";
                     paging += "<li><a href='javascript:locationSearch(" + page + ");'>맨끝</a></li>";
                  }

               //$("#searchList").html("<div class='offers_grid'>" + resultList + "<div align='center'>" + paging + "</div></div>");
                  $("#searchList").html("<div class='offers_grid'>" + resultList + "</div>" + "<div class='page-nation'><ul class='pagination pagination-large' id='pagination'>" + paging + "</ul></div>");
               
            }
         },
         error : function(request, status, errorData){
            alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                  + "\n" + "error : " + errorData);
         } 
      });
      
   }

   function tagSearch(page){
      
      if($("#tag").val().length==0){
         console.log("태그를 반드시 입력해주세요.");
         return false;
      } else{
         
         var tag = $("#tag").val();
         var page = page;
         
         $.ajax({
            url : "tagSearch.do",
            data : { tag : tag, page : page },
            type : "post",
            dataType : "json",
            success : function(result){   
               // 1. 리턴된 객체를 문자열로 바꿈
               var objStr = JSON.stringify(result);
               // 2. 문자열을 json 객체로 바꿈
               var jsonObj = JSON.parse(objStr);   
               
               var resultList="";
               var scrap='';
               var paging = '';
               var maxPage = jsonObj.maxPage;
               var startPage = jsonObj.startPage;
               var endPage = jsonObj.endPage;
               var currentPage = jsonObj.currentPage;

               if(jsonObj.list.length==0){
                  alert("검색 결과가 없습니다.");
               } else {
                  for(var i in jsonObj.list){ 
                     if(jsonObj.list[i].scrap==0)
                        scrap="<img src='/westival/resources/images/jjim1.png'>";
                     else if(jsonObj.list[i].scrap==1){
                        scrap="<img src='/westival/resources/images/jjim2.png'>";
                     }
                     
                     resultList += "<div class='offers_item'><div class='row'><div class='col-lg-3 col-1680-4'><div class='offers_image_container'>"
                        + "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name
                        + "'></div></div></div><div class='col-lg-8'><div class='offers_content'><div class='offers_price'>" + jsonObj.list[i].name + "</div><p class='offers_text'>" 
                        + "<font color='black' size='4px'>" + jsonObj.list[i].start_date + "일 부터 " + jsonObj.list[i].end_date + "일 까지</font><br>" +jsonObj.list[i].content +"<br><br><br>" 
                        + "</p><div class='button book_button'><a href='Info.do?no=" + jsonObj.list[i].no + "'>상세보기<span></span><span></span><span></span></a></div>" 
                        + "<div class='offer_reviews'><div class='offer_reviews_content'><div class='offer_reviews_subtitle'>" + jsonObj.list[i].recommend 
                        + " 명의 추천을 받았습니다.</div></div>" ;
                     
                     if(jsonObj.list[i].scrap!=2){
                        resultList += "<div class='offer_reviews_rating text-center' style='background-color:#ffffff;'><a href='#' id='scrapCheck' onclick='scrap(" + jsonObj.list[i].no +"); return false;'>"
                        + scrap + "</a></div>";
                     }   
                     
                     resultList += "</div></div></div></div></div>";
                     /* console.log("축제번호 : " + jsonObj.list[i].no + ", 축제명 : " + jsonObj.list[i].name +
                           ", 이미지 : " + jsonObj.list[i].new_img_name + ", 주소 : " + jsonObj.list[i].address +
                           ", 시작날짜 : " + jsonObj.list[i].start_date + ", 종료날짜 : " + jsonObj.list[i].end_date +
                           ", 테마 : " + jsonObj.list[i].theme + ", 태그 : " + jsonObj.list[i].tag + ", 추천수 : " + jsonObj.list[i].recommend); */
                  }         
                  if(currentPage <= 1){
                         //paging += "[맨처음]&nbsp";
                         paging += "<li class='disabled'><span>맨처음</span></li>";
                      } else {
                         //paging += "<a href='javascript:paging(1);'>[맨처음]</a>";
                         paging += "<li><a href='javascript:tagSearch(1);'>맨처음</a></li>";
                      }
                  
                     if( ((currentPage-10) >= 1)){
                        var page = startPage-10;
                        //paging += "<a href='javascript:paging(" + page + ");'>[이전]</a>";
                        paging += "<li><a href='javascript:tagSearch(" + page + ");'>이전</a></li>";
                     } else{
                        //paging += "[이전]&nbsp";
                        paging += "<li class='disabled'><span>이전</span></li>";
                     }
                     
                     for(var i=startPage ; i<=endPage ; i++){
                        if(i==currentPage){
                           //paging += "<font color='red'>[" + i + "]</font>";
                           paging += "<li class='active'><span>" + i + "</span></li>";
                        } else{
                           //paging += "<a href='javascript:paging(" + i + ");'>[" + i +"]</a>";
                           paging += "<li><a href='javascript:tagSearch(" + i + ");'>" + i +"</a></li>";
                        }
                     }
                     
                     if( ( (startPage+10) <= maxPage ) ){
                        var page = startPage+10;
                        //paging += "<a href='javascript:paging(" + page + ");'>[다음]</a>";
                        paging += "<li><a href='javascript:tagSearch(" + page + ");'>다음</a></li>";
                     } else{
                        //paging += "[다음]&nbsp";
                        paging += "<li class='disabled'><span>다음</span></li>";
                     }
                     
                     if( currentPage >= maxPage){
                        //paging += "[맨끝]&nbsp";
                        paging += "<li class='disabled'><span>맨끝</span></li>";
                     } else{
                        var page = maxPage;
                        //paging += "<a href='javascript:paging(" + page + ");'>[맨끝]</a>";
                        paging += "<li><a href='javascript:tagSearch(" + page + ");'>맨끝</a></li>";
                     }

                     $("#searchList").html("<div class='offers_grid'>" + resultList + "</div>" + "<div class='page-nation'><ul class='pagination pagination-large' id='pagination'>" + paging + "</ul></div>");

               }
            },
            error : function(request, status, errorData){
               alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                     + "\n" + "error : " + errorData);
            } 
         });   
      }
   }
   
   function scrap(no){
      
      console.log("스크랩버튼");
      $.ajax({
         url : "scrapCheck.do",
         data : { no : no },
         type : "post",
         success : function(result){   
            if(result == "insert"){
               alert("스크랩을 등록하였습니다.");
               location.reload();
            } else{
               alert("스크랩을 삭제하였습니다.")
               location.reload();
            }
         }         
      }); 
   }

</script>


<body>

<!-- header -->
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
<!-- header -->

<div class="super_container">


   
   <!-- Home -->
   <div class="home">
      <div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg"></div>
      <div class="home_content">
         <div class="home_title">축제 검색 페이지</div>
      </div>
   </div>

   <!-- Offers -->

   <div class="offers" style="height:2000px;" >

      <!-- Search -->

      <div class="search" >
         <div class="search_inner">

            <!-- Search Contents -->
            
            <div class="container fill_height no-padding" >
               <div class="row fill_height no-margin">
                  <div class="col fill_height no-padding">

                     <!-- Search Tabs -->

                     <div class="search_tabs_container">
                        <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><span>지역 별 축제</span></div>
                           <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">태그 별 축제</div>
                        </div>      
                     </div>

                     <!-- Search Panel -->

                     <div class="search_panel active">
                        <form action="#" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_item">
                              <div>* 지역명</div>
                              <select name="address" id="address" class="destination search_input">
                                  <option value="">지역을 선택해주세요.</option>
                                  <option value="강원">강원도</option>
                                  <option value="경기">경기도</option>
                                  <option value="경남">경상남도</option>
                                  <option value="경북">경상북도</option>
                                  <option value="광주">광주광역시</option>
                                  <option value="대구">대구광역시</option>
                                  <option value="대전">대전광역시</option>
                                  <option value="부산">부산광역시</option>
                                  <option value="서울">서울특별시</option>
                                  <option value="세종">세종특별자치시</option>
                                  <option value="울산">울산광역시</option>
                                  <option value="인천">인천광역시</option>
                                  <option value="전남">전라남도</option>
                                  <option value="전북">전라북도</option>
                                  <option value="제주">제주특별자치도</option>
                                  <option value="충남">충청북도</option>
                                  <option value="충북">충청남도</option>
                              </select>
                           </div>
                           <div class="search_item">
                              <div>* 축제 시작일</div>
                              <input type="date" name="start_date" id="start_date" class="check_in search_input" >
                           </div>
                           <div class="search_item">
                              <div>* 축제 종료일</div>
                              <input type="date" name="end_date" id="end_date" class="check_out search_input" >
                           </div>
                           
                           <div class="extras">
                              <ul class="search_extras clearfix">
                                 <li class="search_extras_item">
                                    <div class="clearfix">
                                       <input type="checkbox" name="theme" id="search_extras_1" class="search_extras_cb" value="축제">
                                       <label for="search_extras_1">축제</label>
                                    </div>   
                                 </li>
                                 <li class="search_extras_item">
                                    <div class="clearfix">
                                       <input type="checkbox" name="theme" id="search_extras_2" class="search_extras_cb" value="파티">
                                       <label for="search_extras_2">파티</label>
                                    </div>
                                 </li>
                                 <li class="search_extras_item">
                                    <div class="clearfix">
                                       <input type="checkbox" name="theme" id="search_extras_3" class="search_extras_cb" value="전시회">
                                       <label for="search_extras_3">전시회</label>
                                    </div>
                                 </li>
                                 <li class="search_extras_item">
                                    <div class="clearfix">
                                       <input type="checkbox" name="theme" id="search_extras_4" class="search_extras_cb" value="공연">
                                       <label for="search_extras_4">공연</label>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                           <input type="submit" class="button search_button" value="검색하기" onclick="locationSearch(1); return false;" >
                        </form>
                     </div>

                     <!-- Search Panel -->

                     <div class="search_panel">
                        <form action="#" id="search_form_2" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                           <div class="search_item">
                              <div>* 태그</div>
                              <input type="text" id="tag" name="tag" class="destination search_input" >
                           </div>
                           <input type="submit" class="button search_button" value="검색하기" onclick="tagSearch(1); return false;" >
                        </form>
                     </div>


                  </div>
               </div>
            </div>   
         </div>   
      </div>

      <!-- Offers -->

      <div class="container" >
         <div class="row">
            <div class="col-lg-1 temp_col"></div>

            <div class="col-lg-12">

               <div class="offers_grid" id="searchList" >
               
                  
               </div>
                                
            </div>

         </div>
      </div>
      
         
   </div>

</div>

</body>

</html>