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
<!-- <link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
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
    background-color:rgba(53, 10, 78, 0.6);
    border:1px solid #f40;  
}  
#domain li a:hover, ul li a:focus {  
    color:#fff;  
    border:1px solid #f40;  
    background-color:#f40;  
}  

</style>
<script type="text/javascript">
function noticeInsert(){
	location.href="ninsert.do"
}

function paging(page){
	 var currentPage;
	 var maxPage;
	 var startPage;
	 var endPage;
	
	 $.ajax({
		 url: "npage.do",
		 type: "post",
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
						for(var j = 0; j < json.list[i].ntitle.length; j++){
							json.list[i].ntitle = json.list[i].ntitle.replace("+", " ");		
						}
						var nofvalue;
						if(json.list[i].nof == null){
							nofvalue = "";
						}else {
							nofvalue = "&checkmark;";
						}
						values += "<tr align='center'><td>" + json.list[i].nno + "</td>"
						+ "<td><a href='ndetail.do?no="+data.list[i].nno+"&page="+data.currentPage+"'>" + decodeURIComponent(json.list[i].ntitle) + "</a></td>"
						+ "<td>" + nofvalue + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].ndate) + "</td></tr>";
					}//for
					$("#tb1").html(values);
					
					//페이징
					$("#domain").html("");
					if(currentPage <= 1){
					}else{
						$("#domain").append("<li><a href='#' onclick='paging(1)'>&laquo;</a></li>");
					}
					
					if(currentPage == 1) {
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(" + currentPage + " - 1)'>&lsaquo;</a></li>");
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
						$("#domain").append("<li><a href='#' onclick='paging(" + currentPage + " + 1)'> &rsaquo; </a></li>");
					}
					
					if (currentPage >= maxPage) {
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(" + maxPage + ")'> &raquo;</a></li>");
					}
					
					
					
					
				},//success
				error: function(jqXHR, textstatus, errorThrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
					

				
				}//error
			});
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
				if(data.listCount == 0){
					values += '<td colspan="4" align="center">검색 결과가 존재하지 않습니다.</td>';
				}else{
				for(var i in json.list){
					for(var j = 0; j < json.list[i].ntitle.length; j++){
						json.list[i].ntitle = json.list[i].ntitle.replace("+", " ");		
					} 
					if(json.list[i].nof == null){
						nofvalue = "";
					}else {
						nofvalue = decodeURIComponent(json.list[i].nof);
					}
					values += "<tr align='center'><td>" + json.list[i].nno + "</td>"
					+ "<td><a href='ndetail.do?no="+data.list[i].nno+"&page="+data.currentPage+"'>" + decodeURIComponent(json.list[i].ntitle) + "</a></td>"
					+ "<td>" + nofvalue + "</td>"
					+ "<td>" + decodeURIComponent(json.list[i].ndate) + "</td></tr>";
				}//for
				}
				$("#tb1").html(values);
				
				$("#domain").html("");
				if(currentPage <= 1) {	
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(1)'>&laquo;</a></li>");
				}
				
				if(currentPage == 1) {
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " - 1)'>&lsaquo;</a></li>");
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
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " + 1)'>&rsaquo;</a></li>");
				}
				
				if (currentPage == maxPage) {
				} else {
					$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + maxPage + " )'> &raquo; </a></li>");
				}
		 },//success
		 error: function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
				

			
			}//error
	 });
	 
	 
	 
	 
}




</script>

<body>

<div class="super_container">
	
	<!-- Header -->

	<c:import url="/WEB-INF/views/header.jsp" />

	

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

                                <div class="form-group" style="margin-left : 34%;">                                   
                                    <select class="btn dropdown-toggle btn-sm" id="filter" name="filter">
                                	
                                		<option value="all">통합검색</option>
                                		<option value="no">번호</option>
										<option value="ntitle">제목</option>

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
								<td align="center"><a href="ndetail.do?no=${n.notice_no }&page=${currentPage}">${n.notice_title }</a></td>
								<c:if test="${!empty n.original_filepath }">
									<td align="center">&checkmark;</td>
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
						 <!-- 페이지 -->
							<div class="paginate">
									<ul class="pagination" style="justify-content: center;" id="domain">
									<c:if test="${currentPage >= 2 }">
										<li class="page-item"><a class="page-link" href="noticeview.do?page=1">&laquo;</a></li>
										</c:if>
										<c:if test="${currentPage >= 2 }">
										<li class="page-item"><a class="page-link" href="noticeview.do?page=${currentPage - 1 }" >&lsaquo;</a></li>
										</c:if>
										<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
										<c:if test="${ p == currentPage }">
											<li class="page-item"><a class="page-link" href="noticeview.do?page=${ p }">${ p }</a></li>
										</c:if>
										<c:if test="${ p != currentPage }">
											<li class="page-item"><a class="page-link" href="noticeview.do?page=${ p }" >${ p }</a></li>
										</c:if>
									</c:forEach>	
										<c:if test="${currentPage != maxPage }">
										<li class="page-item"><a class="page-link" href="noticeview.do?page=${currentPage + 1 }" >&rsaquo;</a></li>
										</c:if>
										<c:if test="${currentPage != maxPage }">
										<li class="page-item"><a class="page-link" href="noticeview.do?page=${maxPage }" >&raquo;</a></li>
										</c:if>
									</ul>
							</div>
					<!-- 페이지 끝 -->
<%-- <!-- 페이징 처리 -->
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

</div> --%>

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
<c:import url="/WEB-INF/views/footer.jsp" />
	



	

</div>

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
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