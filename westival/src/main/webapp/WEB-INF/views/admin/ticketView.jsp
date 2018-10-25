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
		 url: "tpage.do",
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
						
						for(var j = 0; j < json.list[i].tname.length; j++){
							json.list[i].tname = json.list[i].tname.replace("+", " ");		
						}
						for(var j = 0; j < json.list[i].tstate.length; j++){
							json.list[i].tstate = json.list[i].tstate.replace("+", " ");		
						}
						for(var j = 0; j < json.list[i].tptype.length; j++){
							json.list[i].tptype = json.list[i].tptype.replace("+", " ");		
						}
						
						values += "<tr align='center'><td>" + decodeURIComponent(json.list[i].tusername) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tid) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tname) + "</td>" 
						+ "<td>" + decodeURIComponent(json.list[i].tno) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tdate) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tcount) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tprice) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tptype) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].tstate) + "</td></tr>";
						
					}//for
					$("#tb1").html(values);
					
					//페이징
					$("#domain").html("");
					if(currentPage <= 1){
					}else{
						$("#domain").append("<li><a href='#' onclick='paging(1)'>&laquo; </a></li>");
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
						$("#domain").append("<li><a href='#' onclick='paging(" + maxPage + ")'> &raquo; </a></li>");
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
	url: "tselectbtn.do",
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
		if(data.listCount == 0){
			values += '<td colspan="9" align="center">검색 결과가 존재하지 않습니다.</td>';
		}else{
		for(var i in json.list){
			
			for(var j = 0; j < json.list[i].tname.length; j++){
				json.list[i].tname = json.list[i].tname.replace("+", " ");		
			}
			for(var j = 0; j < json.list[i].tstate.length; j++){
				json.list[i].tstate = json.list[i].tstate.replace("+", " ");		
			}
			for(var j = 0; j < json.list[i].tptype.length; j++){
				json.list[i].tptype = json.list[i].tptype.replace("+", " ");		
			}
			
			values += "<tr align='center'><td>" + decodeURIComponent(json.list[i].tusername) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tid) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tname) + "</td>" 
			+ "<td>" + decodeURIComponent(json.list[i].tno) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tdate) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tcount) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tprice) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tptype) + "</td>"
			+ "<td>" + decodeURIComponent(json.list[i].tstate) + "</td></tr>";
			
		}//for
		}
		$("#tb1").html(values);  
		
		$("#domain").html("");
		if(currentPage <= 1) {	
		} else {
			$("#domain").append("<li><a href='#' onclick='selectBtnClick(1)'> &laquo; </a></li>");
		}
		
		if(currentPage == 1) {
		} else {
			$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " - 1)'> &lsaquo; </a></li>");
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
			$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " + 1)'> &rsaquo; </a></li>");
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
			<div class="home_title">예매관리</div>
		</div>
	</div>
	
	<!-- search -->
	<div style="background:#f6f9fb;">
					<div class="container" data-wow-delay="0.8s" >
						
                             <form action="#" class=" form-inline" method="post" style="margin-top : 0.5%;"> 

                                <div class="form-group" style="margin-left : 30%;">                                   
                                    <select class="btn dropdown-toggle btn-sm" id="filter" name="filter">
                                
										<option value="all">통합검색</option>
                                        <option value="name">이름</option>
                                        <option value="id">아이디</option>
                                        <option value="fname">축제명</option>
                                        <option value="tno">예매번호</option>
                                        <option value="price">금액</option>
                                        <option value="ptype">결제방식</option>
                                        <option value="state">상태</option>
                                        

                                    </select>
                                </div>
                                
                                 <div class="form-group" >
                                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요." name="searchTF" id="searchTF" style="margin-left:1%; ">
                                </div>
                               <button class="btn search-btn" type="button" style="margin-left:0.5%; cursor:pointer;" id="selectBtn" name="selectBtn" onclick="selectBtnClick(1);"><i class="fa fa-search" ></i></button>
								  <button class="btn search-btn" type="button" style="margin-left:0.5%; cursor:pointer;" id="listBtn" name="listBtn" onclick="paging(1);"><i class="fa fa-search" >전체조회</i></button>
								  
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
					      
					     
					    </tr>
					  </thead>
					  <tbody id="tb1">
					
					    <c:forEach items="${list }" var="n">
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
								
								
							</tr>				    
					    </c:forEach>
					  </tbody>
					  
					   
					</table>

		 <!-- 페이지 -->
							<div class="paginate">
									<ul class="pagination" style="justify-content: center;" id="domain">
									<c:if test="${currentPage >= 2 }">
										<li class="page-item"><a class="page-link" href="adminticket.do?page=1">&laquo;</a></li>
										</c:if>
										<c:if test="${currentPage >= 2 }">
										<li class="page-item"><a class="page-link" href="adminticket.do?page=${currentPage - 1 }" >&lsaquo;</a></li>
										</c:if>
										<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
										<c:if test="${ p == currentPage }">
											<li class="page-item"><a class="page-link" href="adminticket.do?page=${ p }">${ p }</a></li>
										</c:if>
										<c:if test="${ p != currentPage }">
											<li class="page-item"><a class="page-link" href="adminticket.do?page=${ p }" >${ p }</a></li>
										</c:if>
									</c:forEach>	
										<c:if test="${currentPage != maxPage }">
										<li class="page-item"><a class="page-link" href="adminticket.do?page=${currentPage + 1 }" >&rsaquo;</a></li>
										</c:if>
										<c:if test="${currentPage != maxPage }">
										<li class="page-item"><a class="page-link" href="adminticket.do?page=${maxPage }" >&raquo;</a></li>
										</c:if>
									</ul>
							</div>
					<!-- 페이지 끝 -->


							

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