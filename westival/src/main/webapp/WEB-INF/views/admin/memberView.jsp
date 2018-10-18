<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>회원관리</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_responsive.css">
</head>
<style type="text/css">
	#home {
		height: 90%;
		display: block;
	}
	 
	.home_background {
		position: relative;
	}
	#domain {  
    text-align:center;  
}  
#domain li {  
    display:inline;  
    vertical-align:middle;  
}  
#domain li a {  
    display:-moz-inline-stack;  /*FF2*/  
    display:inline-block;  
    vertical-align:top;  
    padding:4px;  
    margin-right:3px;  
    width:30px !important;  
    color:#000;  
    font:bold 12px tahoma;  
    border:1px solid #eee;  
    text-align:center;  
    text-decoration:none;  
    width /**/:30px;    /*IE 5.5*/  
}  
#domain li a.now {  
    color:#fff;  
    background-color:#f40;  
    border:1px solid #f40;  
}  
#domain li a:hover, ul li a:focus {  
    color:#fff;  
    border:1px solid #f40;  
    background-color:#f40;  
}  
	
</style>
<script type="text/javascript" src="/westival/resources/js/jquery-3.2.1.min.js"></script>
 <script type="text/javascript">
 function paging(page){
	 var currentPage;
	 var maxPage;
	 var startPage;
	 var endPage;
	
	 $.ajax({
		 url: "mpage.do",
		 type: "get",
		 data: {"page" :page},
		 dataType: "json",
		 success: function(data){
			 var jsonStr = JSON.stringify(data);
			 var json = JSON.parse(jsonStr);
			 
			 
					currentPage = json.currentPage;
					maxPage = json.maxPage;
					startPage = json.startPage;
					endPage = json.endPage;
					
					var values = "";
					for(var i in json.list){
						for(var j = 0; j < json.list[i].maddress.length; j++){
							json.list[i].maddress = json.list[i].maddress.replace("+", " ");		
						}
						
						values += "<tr align='center'><td>" + decodeURIComponent(json.list[i].mid) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].mname) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].mbirth) + "</td>" 
						+ "<td>" + decodeURIComponent(json.list[i].maddress) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].mphone) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].memail) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].mgender) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].mconfirm) + "</td></tr>";
					}//for
					$("#tb1").html(values);
					
					//페이징
					$("#domain").html("");
					if(currentPage <= 1){
					}else{
						$("#domain").append("<li><a href='#' onclick='paging(1)'><<</a></li>");
					}
					
					if(currentPage == 1) {
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(" + currentPage + " - 1)'><</a></li>");
					}
					
					for (var p = startPage; p <= endPage; p++) { 
						if (p == currentPage) {
							$("#domain").append("<li><a href='#'><font color='red'>" + p + "</font></a></li>");
						} else {
							$("#domain").append("<li><a href='#' onclick='paging(" + p + ")'>" + p + "</a></li>");
						}
					}
					
					if (currentPage == maxPage) {
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(" + currentPage + " + 1)'> > </a></li>");
					}
					
					if (currentPage >= maxPage) {
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(" + maxPage + ")'> >> </a></li>");
					}
					
					
					
					
				},//success
				error: function(jqXHR, textstatus, errorThrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
					

				
				}//error
			});
		}
 	
  //검색함수
	  function selectBtnClick(page){
		 var filter = $("#filter").val();
		 var searchTF = $("#searchTF").val();
		 
		 console.log(filter + ", " + searchTF);
		 var currentPage;
		 var maxPage;
		 var startPage;
		 var endPage;
		 
		
		
	 
 		
	  $.ajax({
		url: "mselectbtn.do",
		type: "post",
		data: {"filter" : filter, "searchTF" : searchTF, "page" : page},
		dataType: "json",
		success : function(data){
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			
			currentPage = json.currentPage;
			maxPage = json.maxPage;
			startPage = json.startPage;
			endPage = json.endPage;
			
			var values = "";
			for(var i in json.list){
				
				for(var j = 0; j < json.list[i].maddress.length; j++){
					json.list[i].maddress = json.list[i].maddress.replace("+", " ");		
				}
				
				values += "<tr align='center'><td>" + decodeURIComponent(json.list[i].mid) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].mname) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].mbirth) + "</td>" 
				+ "<td>" + decodeURIComponent(json.list[i].maddress) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].mphone) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].memail) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].mgender) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].mconfirm) + "</td></tr>";
			}//for
			$("#tb1").html(values);  
			
			$("#domain").html("");
			if(currentPage <= 1) {	
			} else {
				$("#domain").append("<li><a href='#' onclick='selectBtnClick(1)'> << </a></li>");
			}
			
			if(currentPage == 1) {
			} else {
				$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " - 1)'> < </a></li>");
			}
			
			for (var p = startPage; p <= endPage; p++) { 
				if (p == currentPage) {
					$("#domain").append("<li><a href='#'><font color='red'>" + p + "</font></a></li>");
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + p + ")'>" + p + "</a></li>");
				}
			}
			
			if (currentPage == maxPage) {
			} else {
				$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " + 1)'> > </a></li>");
			}
			
			if (currentPage == maxPage) {
			} else {
				$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + maxPage + " )'> >> </a></li>");
			}
			
			
		},//success
		error: function(jqXHR, textstatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			

		
		}//error
	  });
	  }
  
  
  /* var searchTFValue = $("#searchTF").val();
	var filterValue = $("#filter").val();
 	//검색함수
 	function paging(searchTF, filter, Page){
 		$.ajax({
 			url: "mselectbtn.do",
 			data: {"searchTF": searchTFValue, "filter":filterValue, "page":Page},
 			type:"post",
 			dataType:"json",
 			success: function(obj){
 				var objStr = JSON.stringify(obj);
	            var jsonObj = JSON.parse(objStr);
	               
	            var outValues= '';
	   
	            
	            if(obj.totalCount == 0){
	            	 outValues += '<td colspan="8">검색 결과가 존재하지 않습니다.</td>';
	            }else{
	            	for(var i in jsonObj.list){
	            		outValues += '<tr><td>' + obj.list[i].mid + '</td>';
	            		outValues += '<td>' + obj.list[i].mname + '</td>';
	            		outValues += '<td>' + obj.list[i].mbirth + '</td>';
	            		outValues += '<td>' + obj.list[i].maddress + '</td>';
	            		outValues += '<td>' + obj.list[i].mphone + '</td>';
	            		outValues += '<td>' + obj.list[i].memail + '</td>';
	            		outValues += '<td>' + obj.list[i].mgender + '</td>';
	            		outValues += '<td>' + obj.list[i].mconfirm + '</td></tr>';
	            	}
	            }
	            $("#tb1").html(outValues);
	          //페이징
				$("#domain").html("");
				if(currentPage <= 1){
				}else{
					$("#domain").append("<li><a href='#' onclick='paging(searchTF, filter, 1)'><<</a></li>");
				}
				
				if(currentPage == 1) {
				} else {
					$("#domain").append("<li><a href='#' onclick='paging(searchTF, filter, " + currentPage + " - 1)'><</a></li>");
				}
				
				for (var p = startPage; p <= endPage; p++) { 
					if (p == currentPage) {
						$("#domain").append("<li><a href='#'><font color='red'>" + p + "</font></a></li>");
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(searchTF, filter, " + p + ")'>" + p + "</a></li>");
					}
				}
				
				if (currentPage == maxPage) {
				} else {
					$("#domain").append("<li><a href='#' onclick='paging(searchTF, filter, " + currentPage + " + 1)'> > </a></li>");
				}
				
				if (currentPage >= maxPage) {
				} else {
					$("#domain").append("<li><a href='#' onclick='paging(searchTF, filter, " + maxPage + ")'> >> </a></li>");
				}
	            

	            
 			},//success
 			error: function(request, status, errorData){
	               alert("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
	                     + "error : " + errorData);
	        }//error
 		});
 	} */
 
 
	</script>
 
 <body>

<div class="super_container">
	
	<!-- Header -->

	<c:import url="/WEB-INF/views/header.jsp" />

		
	<!-- Home -->

	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg" ></div>
		<div class="home_content">
			<div class="home_title">회원관리</div>
		</div>
	</div>
	
	<!-- search -->	
	<div style="background:#f6f9fb;">
					<div class="container" data-wow-delay="0.8s" >
						
                            <form action="#" class=" form-inline" method="post" style="margin-top : 0.5%; "> 

                                <div class="form-group" style="margin-left : 34%;">                                   
                                    <select class="btn dropdown-toggle btn-sm" id="filter" name="filter">
                                
										<!-- <option value="all">통합검색</option> -->
                                        <option value="mid">아이디</option>
                                        <option value="mname">이름</option>
                                        <option value="maddress">주소</option>
                                        <option value="mtelephone">전화번호</option>
                                        <option value="memail">이메일</option>
                                        <option value="mgender">성별</option>	
                                        <option value="mconfirm">위치동의</option>

                                    </select>
                                </div>
                                
                                 <div class="form-group" >
                                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." name="searchTF" id="searchTF" style="margin-left:1%; ">
                                </div>
                               <button class="btn search-btn" type="button" style="margin-left:0.5%; cursor:pointer;" id="searchBtn" name="searchBtn" onclick="selectBtnClick(1);"><i class="fa fa-search" ></i></button>
								  <button class="btn search-btn" type="button" style="margin-left:0.5%; cursor:pointer;" id="listBtn" name="listBtn" onclick="paging(1);"><i class="fa fa-search" >전체조회</i></button>
								  
                            </form>
                          
                        </div>
  </div>
	<!-- Intro -->
  
	<div class="intro" style="padding-top : 2%;">
		
	
	
		<div class="container">
		
			<div class="row">
				<div class="col-lg-12">
			<button type="button" class="btn btn-outline-primary" style="margin-left:90%; margin-bottom:0.5%; cursor:pointer;"  
			data-toggle="modal" data-target="#register">회원 등록</button>
			
<!-- 모달 -->
<!-- Modal-register -->
<div class="modal fade" id="register" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<img src="/westival/resources/images/titlelogo.png"	class="modal-title rounded mx-auto d-block" width="80" height="80">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"><%@ include file="/WEB-INF/views/register.jsp" %></div>
				</div>
			</div>
		</div>
						
<!-- 테이블 -->
						<div class="intro_content">
					<table class="table" width="100%;" style="border-bottom : solid 0.1px;"> 
					  <thead>
					    <tr align="center">
					      
					      <th scope="col" width="">아이디</th>
					      <th scope="col" width="">이름</th>
					      <th scope="col" width="">생일</th>
					      <th scope="col" width="">주소</th>
					      <th scope="col" width="">연락처</th>
					      <th scope="col" width="">이메일</th>
					      <th scope="col" width="">성별</th>
					      <th scope="col" width="">위치정보동의여부</th>
					     
					    </tr>
					  </thead>
					  
					  <tbody id="tb1">
					  </tbody>
					  
					  </table>
					</div>
					
					
 				 <!-- 페이지 -->
							<div class="paginate">
									<ul class="pagination" style="justify-content: center;" id="domain">
										<li class="page-item"><a class="page-link" href="#" style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>
										<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
										<c:if test="${ p == currentPage }">
											<li class="page-item"><a class="page-link" href="mpage.do?page=${ p }" style="background: rgba(53, 10, 78, 0.6);color: white;">${ p }</a></li>
										</c:if>
										<c:if test="${ p != currentPage }">
											<li class="page-item"><a class="page-link" href="mpage.do?page=${ p }" style="color: rgba(53, 10, 78, 0.6);">${ p }</a></li>
										</c:if>
									</c:forEach>
										<li class="page-item"><a class="page-link" href="#" style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>
									</ul>
							</div>
					<!-- 페이지 끝 -->
				</div>
			
			</div>
		</div>
	</div>

	

	

	

	<!-- Footer -->

	<footer class="footer">
		<div class="container" style="margin : 0">
			<div class="row">

				<!-- Footer Column -->
				<div class="col-lg-3 footer_column">
					<div class="footer_col">
						<div class="footer_content footer_about">
							<div class="logo_container footer_logo">
								<div class="logo"><a href="#"><img src="images/logo.png" alt="">travelix</a></div>
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
								<div class="footer_blog_image"><img src="images/footer_blog_1.jpg" alt="https://unsplash.com/@avidenov"></div>
								<div class="footer_blog_content">
									<div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
									<div class="footer_blog_date">Nov 29, 2017</div>
								</div>
							</div>
							
							<!-- Footer blog item -->
							<div class="footer_blog_item clearfix">
								<div class="footer_blog_image"><img src="images/footer_blog_2.jpg" alt="https://unsplash.com/@deannaritchie"></div>
								<div class="footer_blog_content">
									<div class="footer_blog_title"><a href="blog.html">New destinations for you</a></div>
									<div class="footer_blog_date">Nov 29, 2017</div>
								</div>
							</div>

							<!-- Footer blog item -->
							<div class="footer_blog_item clearfix">
								<div class="footer_blog_image"><img src="images/footer_blog_3.jpg" alt="https://unsplash.com/@bergeryap87"></div>
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
									<div><div class="contact_info_icon"><img src="images/placeholder.svg" alt=""></div></div>
									<div class="contact_info_text">4127 Raoul Wallenber 45b-c Gibraltar</div>
								</li>
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="images/phone-call.svg" alt=""></div></div>
									<div class="contact_info_text">2556-808-8613</div>
								</li>
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="images/message.svg" alt=""></div></div>
									<div class="contact_info_text"><a href="mailto:contactme@gmail.com?Subject=Hello" target="_top">contactme@gmail.com</a></div>
								</li>
								<li class="contact_info_item d-flex flex-row">
									<div><div class="contact_info_icon"><img src="images/planet-earth.svg" alt=""></div></div>
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

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/greensock/TweenMax.min.js"></script>
<script src="/westival/resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="/westival/resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/westival/resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="/westival/resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/westival/resources/js/about_custom.js"></script>

</body>

</html>