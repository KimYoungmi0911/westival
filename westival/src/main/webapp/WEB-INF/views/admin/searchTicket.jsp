<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>예매관리</title>
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
</style>

<script type="text/javascript" src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
</script>
<body>

<div class="super_container">
	
	<!-- Header -->

	<c:import url="/WEB-INF/views/header.jsp" />

		
	<!-- Home -->

	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg" ></div>
		<div class="home_content">
			<div class="home_title">예매관리</div>
		</div>
	</div>
	
	<!-- search -->
	<div style="background:#f6f9fb;">
					<div class="container" data-wow-delay="0.8s" >
						
                            <form action="search.do" class=" form-inline" method="post" style="margin-top : 0.5%; "> 

                                <div class="form-group" style="margin-left : 34%;">                                   
                                    <select class="btn dropdown-toggle btn-sm" id="filter" name="filter">
                                
									<option value="all" >통합검색</option>
                                        <option value="name">이름</option>
                                        <option value="id" >아이디</option>
                                        <option value="fname" >축제명</option>
                                        <option value="tno" >예매번호</option>
                                        <option value="price" >금액</option>
                                        <option value="ptype" >결제방식</option>
                                        <option value="state" >상태</option>
                                          <option value="account">계좌번호</option>
                                         	
                               

                                    </select>
                                </div>
                                
                                 <div class="form-group" >
                                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." name="searchTF" id="searchTF" style="margin-left:1%; ">
                                </div>
                                <button class="btn search-btn" type="submit" style="margin-left:0.5%;"><i class="fa fa-search" ></i></button>
                              
								
                            </form>
                        </div>
  </div>
	<!-- Intro -->
  
	<div class="intro" style="padding-top : 2%;">
		
	
	
		<div class="container">
		
			<div class="row">
				<div class="col-lg-12">
			
					<div class="intro_content">
					<table class="table" width="100%;" style="border-bottom : solid 0.1px;"> 
					  <thead>
					    <tr align="center">
					      <th scope="col" width="">이름</th>
					      <th scope="col" width="">아이디</th>
					      <th scope="col" width="">축제명</th>
					      <th scope="col" width="">예매번호</th>
					      <th scope="col" width="">예매날짜</th>
					      <th scope="col" width="">수량</th>
					      <th scope="col" width="">금액</th>
					      <th scope="col" width="">결제방식</th>
					      <th scope="col" width="">상태</th>
					      <th scope="col" width="">계좌번호</th>
					     
					    </tr>
					  </thead>
					  <tbody id="tb1">
					
					    <c:forEach items="${map.list }" var="n">
							<tr>
								<td align="center">${n.user_name }</td>
								
								<td align="center">${n.user_id }</td>
								
								<td align="center">${n.name }</td>
								
								<td align="center">${n.ticket_no }</td>
								
								<td align="center">${n.ticket_date }</td>
								
								<td align="center">${n.ticket_count }</td>
								
								<td align="center">${n.price }</td>
								
								<td align="center">${n.pay_type }</td>
								
								<td align="center">${n.state }</td>
								
								<td align="center">${n.account_no }</td>
							</tr>				    
					    </c:forEach>
					  </tbody>
					  
					   
					</table>
						
<%-- <div style="text-align: center">
<% if(currentPage <= 1){ %>
	[맨처음]&nbsp;
<% }else{ %>
	<a href="/second/blist?page=1">[맨처음]</a>
<% } %>
<c:if test="${currentPage <= 1 }">
[맨처음]&nbsp;
</c:if>
<c:if test="${currentPage > 1 }">
<c:url var="mi13" value="adminticket.do">
	<c:param name="page" value="1"/>
</c:url>
<a href="${mi13 }">[맨처음]</a>
</c:if>
<% if((currentPage - 10) < startPage && 
		(currentPage - 10) > 1){ %>
	<a href="/second/blist?page=<%= startPage - 10 %>">[이전]</a>
<% }else{ %>
	[이전]&nbsp;
<% } %>
<c:if test="${(currentPage-10) <  startPage && (currentPage-10) > 1 }">
	<c:url var="mi14" value="adminticket.do">
		<c:param name="page" value="${startPage -10 }" />
	</c:url>
	<a href="${mi14 }">[이전]</a>
</c:if>
<c:if test="${(currentPage-10) >=  startPage || (currentPage-10) <= 1  }">
[이전]&nbsp;
</c:if>
<c:forEach var="cnt" begin="${startPage }" end="${endPage }">
<c:if test="${cnt == currentPage }">
	<font color="red" size="4">[${cnt }]</font>
</c:if>
<c:if test="${cnt != currentPage }">
	<c:url var="mid15" value="adminticket.do">
		<c:param name="page" value="${cnt }" />
	</c:url>
	<a href="${mid15 }">${cnt }</a>
</c:if>
</c:forEach>
<c:if test="${(currentPage + 10) > endPage && (currentPage+10) < maxPage }">
	<c:url var="mid16" value="adminticket.do">
		<c:param name="page" value="${endPage + 10 }" />
	</c:url>
	<a href="${mid16 }">[다음]</a>
</c:if>
<c:if test="${!((currentPage + 10) > endPage && (currentPage+10) < maxPage) }">
	[다음]&nbsp;
</c:if>
<c:if test="${currentPage >= maxPage }">
	[맨끝]&nbsp;
</c:if>
<c:if test="${!(currentPage >= maxPage) }">
<c:url var="mid17" value="adminticket.do">
	<c:param name="page" value="${maxPage }" />
</c:url> 
<a href="${mid17 }">[맨끝]</a>
</c:if>
startPage ~ endPage 출력

<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){ 
%>
	<font color="red" size="4">[<%= p %>]</font>
<%      }else{ %>
	<a href="/second/blist?page=<%= p %>"><%= p %></a>
<% }} %>
----------------
<% if((currentPage + 10) > endPage && 
		(currentPage + 10) < maxPage){ %>
	<a href="/second/blist?page=<%= endPage + 10 %>">[다음]</a>
<% }else{ %>
	[다음]&nbsp;
<% } %>

<% if(currentPage >= maxPage){ %>
	[맨끝]&nbsp;
<% }else{ %>
	<a href="/second/blist?page=<%= maxPage %>">
	[맨끝]</a>
<% } %>

</div> --%>


							

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