<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Westival</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>

<!-- <script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>
 -->
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/responsive.css">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> <!-- pagination -->

<style type="text/css">
   .intro_center h2{
      font-size: 32px;
         font-weight: 700;
       color: #FFFFFF;
       letter-spacing: -0.05em;
   }
   
   .pagination {
	  display: -webkit-flex;
	  display:         flex;
	  -webkit-align-items: center;
	          align-items: center;
	  -webkit-justify-content: center;
	          justify-content: center;
	}
</style>

<script type="text/javascript">
   
   $(function(){
      // 오늘의 축제
      $.ajax({
         url : "todayFestival.do",
         type : "get",
         dataType : "json",
         success : function(result){
            var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈            
            var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈   
           
            var todayFestival = '';
            
             
            if(jsonObj.list.length==0){
            	
            } else {
            	//var paging = '';
                var todayPaging="";
                
                var maxPage = jsonObj.maxPage;
                var startPage = jsonObj.startPage;
                var endPage = jsonObj.endPage;
                var currentPage = jsonObj.currentPage;
                
                // 페이징 정보
                console.log("maxPage : " + maxPage + ", startPage : " + startPage + ", endPage : " + endPage + ", currentPage : " + currentPage);

                for(var i in jsonObj.list){ 
                	
                	var tag = "";
                    if(jsonObj.list[i].tag!=null){
                        var tagArr = jsonObj.list[i].tag.split('#');

                    	for(var j=1; j<tagArr.length; j++){
                            tag += "<a href='tagClick.do?tag=" + tagArr[j] + "'>#" + tagArr[j] + "</a>&nbsp;"
                         }
                    }                

                   todayFestival += "<div class='col-lg-6 offers_col'><div class='offers_item'><div class='row'><div class='col-lg-6'><div class='offers_image_container'>"
                      + "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name 
                      + "); width:250px; height:280px;'></div></div></div><div class='col-lg-6'><div class='offers_content'><div class='offers_price' style='font-size:24px;'>" + jsonObj.list[i].name
                      + "<span><br><br><p style='font-weight:bold'>" + jsonObj.list[i].end_date + "일 까지</p></span></div><p class='offers_text' style='width:200px; height:50px; font-weight:bold;'>" + "테마 : " 
                      + jsonObj.list[i].theme + "<br>태그 : " + tag + "<br></p><div class='offers_link'><a href='Info.do?no=" + jsonObj.list[i].no 
                      + "'>자세히 보기</a></div></div></div></div></div></div>";
                }
                if(currentPage <= 1){
                    //paging += "[맨처음]&nbsp";
                    todayPaging += "<li class='disabled'><span>맨처음</span></li>";
                 } else {
                    //paging += "<a href='javascript:todayPaging(1);'>[맨처음]</a>";
                	 todayPaging += "<li><a href='javascript:todayPaging(1);'>맨처음</a></li>";
                 }
             
    	         if( ((currentPage-10) >= 1)){
    	            var page = startPage-10;
    	            //paging += "<a href='javascript:todayPaging(" + page + ");'>[이전]</a>";
    	            todayPaging += "<li><a href='javascript:todayPaging(" + page + ");'>이전</a></li>";
    	         } else{
    	            //paging += "[이전]&nbsp";
    	            todayPaging += "<li class='disabled'><span>이전</span></li>";
    	         }
    	         
    	         for(var i=startPage ; i<=endPage ; i++){
    	            if(i==currentPage){
    	               //paging += "<font color='red'>[" + i + "]</font>";
    	               todayPaging += "<li class='active'><span>" + i + "</span></li>";
    	            } else{
    	               //paging += "<a href='javascript:todayPaging(" + i + ");'>[" + i +"]</a>";
    	               todayPaging += "<li><a href='javascript:todayPaging(" + i + ");'>" + i +"</a></li>";
    	            }
    	         }
    	         
    	         if( ( (startPage+10) <= maxPage ) ){
    	            var page = startPage+10;
    	            //paging += "<a href='javascript:todayPaging(" + page + ");'>[다음]</a>";
    	            todayPaging += "<li><a href='javascript:todayPaging(" + page + ");'>다음</a></li>";
    	         } else{
    	            //paging += "[다음]&nbsp";
    	            todayPaging += "<li class='disabled'><span>다음</span></li>";
    	         }
    	         
    	         if( currentPage >= maxPage){
    	            //paging += "[맨끝]&nbsp";
    	            todayPaging += "<li class='disabled'><span>맨끝</span></li>";
    	         } else{
    	            var page = maxPage;
    	            //paging += "<a href='javascript:todayPaging(" + page + ");'>[맨끝]</a>";
    	            todayPaging += "<li><a href='javascript:todayPaging(" + page + ");'>맨끝</a></li>";
    	         }
                
                $("#todayFestival").html(todayFestival);   
                //$("#todayFestivalPaging").html(paging); 
                $("#todayPagination").html(todayPaging);
            }
         },
         error : function(request, status, errorData){
            alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                  + "\n" + "error : " + errorData);
         } 
      });
      
      // 이달의 축제
      $.ajax({
         url : "top3Festival.do",
         type : "post",
         dataType : "json",
         success : function(result){               
            var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈            
            var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈      
            
            var top3='';
            
            if(jsonObj.list.length==0){
            	
            } else{
                for(var i in jsonObj.list){   
                    
                    var addressArr = jsonObj.list[i].address.split('#');
                    var address = addressArr[0]+ "<br>" + addressArr[1] ;
                    
                    top3 += "<div class='col-lg-4 intro_col'><div class='intro_item'><div class='intro_item_overlay'></div>" 
                       + "<div class='intro_item_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" 
                       + jsonObj.list[i].new_img_name + ")'></div><div class='intro_item_content d-flex flex-column align-items-center justify-content-center'>"
                       + "<div class='intro_date'>" + jsonObj.list[i].start_date + " ~ " + jsonObj.list[i].end_date + "</div><div class='button intro_button'>"
                       + "<div class='button_bcg'></div><a href='Info.do?no=" + jsonObj.list[i].no + "'>더보기</a></div><div class='intro_center text-center'><h2>" 
                       + jsonObj.list[i].name + "</h2><div class='intro_price'>" + address + "</div></div></div></div></div>"; 
                 }
                 $("#top3").html(top3);
            }

         },
         error : function(request, status, errorData){
            alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                  + "\n" + "error : " + errorData);
         } 
      });
  
   });
   
   function todayPaging(page){
      var page = page;
      console.log(page);
      $.ajax({
         url : "todayFestival.do",
         type : "get",
         data : {page : page},
         dataType : "json",
         success : function(result){
            var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈            
            var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈   
            
            if(jsonObj.list.length==0)
               console.log("검색 결과가 없습니다.");
            
            var todayFestival = '';
            //var paging = '';
            var todayPaging ='';
            
            var maxPage = jsonObj.maxPage;
            var startPage = jsonObj.startPage;
            var endPage = jsonObj.endPage;
            var currentPage = jsonObj.currentPage;
            
            // 페이징 정보
            console.log("maxPage : " + maxPage + ", startPage : " + startPage + ", endPage : " + endPage + ", currentPage : " + currentPage);

            for(var i in jsonObj.list){ 
            	var tag = "";
                if(jsonObj.list[i].tag!=null){
                    var tagArr = jsonObj.list[i].tag.split('#');

                	for(var j=1; j<tagArr.length; j++){
                        tag += "<a href='tagClick.do?tag=" + tagArr[j] + "'>#" + tagArr[j] + "</a>&nbsp;"
                     }
                }
               
               todayFestival += "<div class='col-lg-6 offers_col'><div class='offers_item'><div class='row'><div class='col-lg-6'><div class='offers_image_container'>"
                  + "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name 
                  + "); width:250px; height:280px;'></div></div></div><div class='col-lg-6'><div class='offers_content'><div class='offers_price' style='font-size:24px;'>" + jsonObj.list[i].name
                  + "<span><br><br>" + jsonObj.list[i].end_date + "일 까지</span></div><p class='offers_text' style='width:200px; height:50px;'>" + "테마 : " 
                  + jsonObj.list[i].theme + "<br>태그 : " + tag + "<br></p><div class='offers_link'><a href='Info.do?no=" + jsonObj.list[i].no 
                  + "'>자세히 보기</a></div></div></div></div></div></div>";
            }
            
           	if(currentPage <= 1){
                //paging += "[맨처음]&nbsp";
                todayPaging += "<li class='disabled'><span>맨처음</span></li>";
             } else {
                //paging += "<a href='javascript:todayPaging(1);'>[맨처음]</a>";
            	 todayPaging += "<li><a href='javascript:todayPaging(1);'>맨처음</a></li>";
             }
         
	         if(  ((currentPage-10) >= 1) ){
	            var page = startPage-10;
	            //paging += "<a href='javascript:todayPaging(" + page + ");'>[이전]</a>";
	            todayPaging += "<li><a href='javascript:todayPaging(" + page + ");'>이전</a></li>";
	         } else{
	            //paging += "[이전]&nbsp";
	            todayPaging += "<li class='disabled'><span>이전</span></li>";
	         }
	         
	         for(var i=startPage ; i<=endPage ; i++){
	            if(i==currentPage){
	               //paging += "<font color='red'>[" + i + "]</font>";
	               todayPaging += "<li class='active'><span>" + i + "</span></li>";
	            } else{
	               //paging += "<a href='javascript:todayPaging(" + i + ");'>[" + i +"]</a>";
	               todayPaging += "<li><a href='javascript:todayPaging(" + i + ");'>" + i +"</a></li>";
	            }
	         }
	         
	         if( ( (startPage+10) <= maxPage ) ){
	            var page = startPage+10;
	            //paging += "<a href='javascript:todayPaging(" + page + ");'>[다음]</a>";
	            todayPaging += "<li><a href='javascript:todayPaging(" + page + ");'>다음</a></li>";
	         } else{
	            //paging += "[다음]&nbsp";
	            todayPaging += "<li class='disabled'><span>다음</span></li>";
	         }
	         
	         if( currentPage >= maxPage){
	            //paging += "[맨끝]&nbsp";
	            todayPaging += "<li class='disabled'><span>맨끝</span></li>";
	         } else{
	            var page = maxPage;
	            //paging += "<a href='javascript:todayPaging(" + page + ");'>[맨끝]</a>";
	            todayPaging += "<li><a href='javascript:todayPaging(" + page + ");'>맨끝</a></li>";
	         }

            
            $("#todayFestival").html(todayFestival);   
            //$("#todayFestivalPaging").html(paging);   
            $("#todayPagination").html(todayPaging);
            
         },
         error : function(request, status, errorData){
            alert("error code : " + request.status + "\n" + "message : " + request.responseText 
                  + "\n" + "error : " + errorData);
         } 
      });
   }
   
   
</script>


</head>

<body>

<!-- header -->
<c:import url="header.jsp" />

<div class="super_container">
   <!-- 메인 사진 -->
   <div class="home">      
      <!-- Home Slider -->
      <div class="home_slider_container">         
         <div class="owl-carousel owl-theme home_slider" >
         
            <!-- Slider Item -->
            <div class="owl-item home_slider_item">
               <div class="home_slider_background" style="background-image:url(/westival/resources/images/festmain1.jpg)"></div>
               <div class="home_slider_content text-center">
                  <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                     <h1>WESTIVAL</h1>
                     <h1>search</h1>
                     <div class="button home_slider_button">
                        <div class="button_bcg"></div>
                        <a href="searchFestivalPage.do">축제 검색하기!</a>
                     </div>
                  </div>
               </div>
            </div>

            <!-- Slider Item -->
            <div class="owl-item home_slider_item">
               <div class="home_slider_background" style="background-image:url(/westival/resources/images/festmain2.jpg)"></div>

               <div class="home_slider_content text-center">
                  <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                     <h1>WESTIVAL</h1>
                     <h1>registration</h1>
                     <div class="button home_slider_button">
                     <div class="button_bcg"></div>
                     <a href="#"">축제 등록하기!</a></div>
                  </div>
               </div>
            </div>

            <!-- Slider Item -->
            <div class="owl-item home_slider_item">
               <div class="home_slider_background" style="background-image:url(/westival/resources/images/festmain3.jpg"></div>

               <div class="home_slider_content text-center">
                  <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                     <h1>WESTIVAL</h1>
                     <h1>accompany</h1>
                     <div class="button home_slider_button">
                     <div class="button_bcg"></div>
                     <a href="#"">동행 게시판으로 이동!</a></div>
                  </div>
               </div>
            </div>

         </div>
         
         <!-- Home Slider Nav - Prev -->
         <div class="home_slider_nav home_slider_prev">
            <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
               width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
               <defs>
                  <linearGradient id='home_grad_prev'>
                     <stop offset='0%' stop-color='#fa9e1b'/>
                     <stop offset='100%' stop-color='#8d4fff'/>
                  </linearGradient>
               </defs>
               <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
               M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
               C22.545,2,26,5.541,26,9.909V23.091z"/>
               <polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
               11.042,18.219 "/>
            </svg>
         </div>
         
         <!-- Home Slider Nav - Next -->
         <div class="home_slider_nav home_slider_next">
            <svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
            width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
               <defs>
                  <linearGradient id='home_grad_next'>
                     <stop offset='0%' stop-color='#fa9e1b'/>
                     <stop offset='100%' stop-color='#8d4fff'/>
                  </linearGradient>
               </defs>
            <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
            M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
            C22.545,2,26,5.541,26,9.909V23.091z"/>
            <polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
            17.046,15.554 "/>
            </svg>
         </div>

         <!-- Home Slider Dots -->

         <div class="home_slider_dots">
            <ul id="home_slider_custom_dots" class="home_slider_custom_dots">
               <li class="home_slider_custom_dot active"><div></div>01.</li>
               <li class="home_slider_custom_dot"><div></div>02.</li>
               <li class="home_slider_custom_dot"><div></div>03.</li>
            </ul>
         </div>
      </div>
   </div>

   <!-- 오늘의 축제 -->
   <div class="offers" >
      <div class="container">
         <div class="row">
            <div class="col text-center">
               <h2 style="font-weight:bold; color:black;">Today's Festivals</h2>
            </div>
         </div>
         <div class="row offers_items" id="todayFestival"></div>
         <div align="center" id="todayFestivalPaging"></div>
         
         <div class="page-nation" >
         	<ul class="pagination pagination-large" id="todayPagination">

         	</ul>
         </div>

      </div>
   </div>

   <!-- Intro -->
   
   <div class="intro" id="intro" >
      <div class="container">
         <div class="row">
            <div class="col">
               <h2 class="intro_title text-center">이달의 인기 축제 Top3</h2>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-10 offset-lg-1">
               <div class="intro_text text-center">
                  <p>회원들의 추천을 가장 많이 받은 축제를 확인해보세요! </p>
               </div>
            </div>
         </div>
         <div class="row intro_items" id="top3"></div>
      </div>
   </div>


</div>

<!-- footer -->
<c:import url="footer.jsp" />
</body>

</html>