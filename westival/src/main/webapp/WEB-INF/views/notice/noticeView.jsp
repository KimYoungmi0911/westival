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
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_responsive.css">
</head>
<script type="text/javascript">
function noticeInsert(){
	location.href="ninsert.do"
}

function selectBtnClick(page){
	var filter = $("#filter").val();
	var searchTF = $("#searchTF").val();
	console.log(filter + ", " + searchTF);
	 var currentPage;
	 var maxPage;
	 var startPage;
	 var endPage;
	 
	 $.ajax({
		 url: "nselectbtn.do",
		 type: "get",
		 data: {"filter" : filter, "searchTF" : searchTF, "page" : page},
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
					for(var j = 0; j < json.list[i].ntitle.length; j++){
						json.list[i].ntitle = json.list[i].ntitle.replace("+", " ");		
					}
					values += "<tr align='center'><td>" + json.list[i].nno + "</td>"
					+ "<td>" + decodeURIComponent(json.list[i].ntitle) + "</td>"
					+ "<td>" + decodeURIComponent(json.list[i].nof) + "</td>"
					+ "<td>" + decodeURIComponent(json.list[i].ndate) + "</td></tr>";
				}//for
				$("#tb1").html(values);
				
				$("#domain").html("");
				if(currentPage <= 1) {	
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(1)'>&nbsp;<<&nbsp;</a></li>");
				}
				
				if(currentPage == 1) {
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " - 1)'>&nbsp;<&nbsp;</a></li>");
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
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " + 1)'>&nbsp;>&nbsp;</a></li>");
				}
				
				if (currentPage == maxPage) {
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " + 1)'>&nbsp;>&nbsp;  </a></li>");
				}
		 },//success
		 error: function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
				

			
			}//error
	 });
	 
	 
	 
	 
}




</script>
<style type="text/css">
#home {
		height: 90%;
		display: block;
	}
	 
	.home_background {
		position: relative;
	}
</style>
<body>

<div class="super_container">
	
	<!-- Header -->

	<c:import url="/WEB-INF/views/header.jsp" />

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="phone">+45 345 3324 56789</div>
						<div class="social">
							<ul class="social_list">
								<li class="social_list_item"><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
								<li class="social_list_item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="user_box ml-auto">
							<div class="user_box_login user_box_link"><a href="#">login</a></div>
							<div class="user_box_register user_box_link"><a href="#">등록</a></div>
						</div>
					</div>
				</div>
			</div>		
		</div>

		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
						<div class="logo_container">
							<div class="logo"><a href="#"><img src="images/logo.png" alt="">travelix</a></div>
						</div>
						<div class="main_nav_container ml-auto">
							<ul class="main_nav_list">
								<li class="main_nav_item"><a href="index.html">home</a></li>
								<li class="main_nav_item"><a href="#">about us</a></li>
								<li class="main_nav_item"><a href="offers.html">offers</a></li>
								<li class="main_nav_item"><a href="blog.html">news</a></li>
								<li class="main_nav_item"><a href="noticeview.do">공지사항</a></li>
							</ul>
						</div>
						<div class="content_search ml-lg-0 ml-auto">
							<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
								<g>
									<g>
										<g>
											<path class="mag_glass" fill="#FFFFFF" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
											s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
											C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
											M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
											c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z"/>
										</g>
									</g>
									<g>
										<g>
											<path class="mag_glass" fill="#FFFFFF" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
											c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
											C-2.019,484.77-2.019,497.865,6.057,505.942z"/>
										</g>
									</g>
								</g>
							</svg>
						</div>

						<form id="search_form" class="search_form bez_1">
							<input type="search" class="search_content_input bez_1">
						</form>
						
						<div class="hamburger">
							<i class="fa fa-bars trans_200"></i>
						</div>
					</div>
				</div>
			</div>	
		</nav>

	</header>

	<!-- Home -->

	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg" ></div>
		<div class="home_content">
			<div class="home_title">공지사항</div>
		</div>
	</div>
	<!-- search -->	
	<div style="background:#f6f9fb;">
					<div class="container" data-wow-delay="0.8s" >
						
                            <form action="#" class=" form-inline" method="post" style="margin-top : 0.5%; "> 

                                <div class="form-group" style="margin-left : 35.5%;">                                   
                                    <select class="btn dropdown-toggle btn-sm" id="filter" name="filter">
                                
										<option value="ntitle">제목</option>
                                        

                                    </select>
                                </div>
                                
                                 <div class="form-group" >
                                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." name="searchTF" id="searchTF" style="margin-left:1%; ">
                                </div>
                               <button class="btn search-btn" type="button" style="margin-left:0.5%; cursor:pointer;" id="listBtn" name="listBtn" onclick="selectBtnClick(1);"><i class="fa fa-search" ></i></button>
								  
								  
                            </form>
                          
                        </div>
  </div>

	<!-- Intro -->
  
	<div class="intro" style="padding-top : 2%;">
		
	
	
		<div class="container">
		<c:if test="${!empty sessionScope.member.user_id && sessionScope.member.user_id eq 'admin' }">
		<button type="button" class="btn btn-outline-primary" style="margin-left: 89%; margin-bottom: 1%;" onclick="noticeInsert();">공지사항 등록</button>
		</c:if> 
			<div class="row">
				<div class="col-lg-12">
			
					<div class="intro_content">
					<table class="table" width="100%;" style="border-bottom : solid 0.1px;"> 
					  <thead>
					    <tr align="center">
					      <th scope="col" width="15%">번호</th>
					      <th scope="col" width="45%">제목</th>
					      <th scope="col" width="15%">첨부파일</th>
					      <th scope="col" width="25%">날짜</th>
					     
					    </tr>
					  </thead>
					  <c:if test="${!empty list}">  
					  <tbody id="tb1">
					    <c:forEach items="${list }" var="n">
							<tr>
								<td align="center">${n.notice_no }</td>
								<c:url var="ndetail" value="ndetail.do">
									<c:param name="no" value="${n.notice_no }" />
								</c:url>
								<td align="center"><a href="${ndetail }">${n.notice_title }</a></td>
								<c:if test="${!empty n.original_filepath }">
									<td align="center">◎</td>
								</c:if>
								<c:if test="${empty n.original_filepath }">
									<td align="center">&nbsp;</td>
								</c:if>
								<td align="center">${n.notice_date }</td>
								
							</tr>				    
					    </c:forEach>
					  </tbody>
					</c:if>
					 
					 <c:if test="${empty list }">
					 <tbody>
					 <td colspan="4" align="center">등록된 글이 없습니다.</td>
					 </tbody>
					 </c:if>
					   
					</table>
						
<!-- 페이징 처리 -->
<div style="text-align: center">
<c:if test="${currentPage <= 1 }">
[맨처음]&nbsp;
</c:if>
<c:if test="${currentPage > 1 }">
<c:url var="mi13" value="noticeview.do">
	<c:param name="page" value="1"/>
</c:url>
<a href="${mi13 }">[맨처음]</a>
</c:if>
<c:if test="${(currentPage-10) <=  startPage && (currentPage-10) >= 1 }">
	<c:url var="mi14" value="noticeview.do">
		<c:param name="page" value="${startPage -10 }" />
	</c:url>
	
	<a href="${mi14 }">[이전]</a>
</c:if>
<c:if test="${(currentPage-10) >=  startPage || (currentPage-10) <= 1  }">
&nbsp;
</c:if>
<c:forEach var="cnt" begin="${startPage }" end="${endPage }">
<c:if test="${cnt == currentPage }">
	<font color="red" size="4">[${cnt }]</font>
</c:if>
<c:if test="${cnt != currentPage }">
	<c:url var="mid15" value="noticeview.do">
		<c:param name="page" value="${cnt }" />
	</c:url>
	<a href="${mid15 }">${cnt }</a>
</c:if>
</c:forEach>
<c:if test="${(currentPage + 10) > endPage}">
	<c:url var="mid16" value="noticeview.do">
		<c:param name="page" value="${endPage + 1 }" />
	</c:url>
	<a href="${mid16 }">[다음]s</a>
</c:if>
<c:if test="${!((currentPage + 10) > endPage && (currentPage+10) < maxPage) }">
	&nbsp;
</c:if>

<c:if test="${currentPage >= maxPage }">
	[맨끝]&nbsp;
</c:if>
<c:if test="${!(currentPage >= maxPage) }">
<c:url var="mid17" value="noticeview.do">
	<c:param name="page" value="${maxPage }" />
</c:url> 
<a href="${mid17 }">[맨끝]</a>
</c:if>

</div>

<%-- <c:if test="">
<nav aria-label="Page navigation example" >
 
  <ul class="pagination" id="domain" style="width:100%; margin-left : 50%;">
    
  </ul>
 
</nav>
</c:if> --%>
							

					</div>
				</div>
			
			</div>
		</div>
	</div>

	

	

	

	<!-- Footer -->

	<footer class="footer">
		<div class="container">
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