<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>축제관리</title> 
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
 function goinert(){
	 location.href="insertFestivalPage.do";
 }
 function godetail(no){
	 location.href="detailFestival.do";
 }
 
 function paging(page){
	 var currentPage;
	 var maxPage;
	 var startPage;
	 var endPage;
	 var idx = -1;
	 $.ajax({
		 url: "fpage.do",
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
						for(var j = 0; j < json.list[i].faddress.length; j++){
							json.list[i].faddress = json.list[i].faddress.replace("+", " ");		
						}
						for(var a = 0; a < json.list[i].fname.length; a++){
							json.list[i].fname = json.list[i].fname.replace("+", " ");
						}
						for(var b = 0; b < json.list[i].fmanage.length; b++){
							json.list[i].fmanage = json.list[i].fmanage.replace("+", " ");
						}
						idx += 1;
						values += "<tr align='center' class='tbtr'><td>" + json.list[i].fno + "</td>"
						+ "<td><a href='Info.do?no=" + json.list[i].fno + "'>" + decodeURIComponent(json.list[i].fname) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].faddress) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].fstart) + "</td>" 
						+ "<td>" + decodeURIComponent(json.list[i].fmanage) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].ftelephone) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].fticket) + "</td>"
						+ "<td>" + json.list[i].freadcount + "</td>"
						+ "<td>" + json.list[i].frecommend + "</td>"
						+ "<td><input type='button' value='삭제' class='btn btn-secondary btn-sm' onclick='javascript:festivaldelete("+ idx +")'>" + "</td></tr>";
					}//for
					$("#tb1").html(values);
					
					//페이징
					$("#domain").html("");
					if(currentPage <= 1){
					}else{
						$("#domain").append("<li><a href='#' onclick='paging(1)'> &laquo;  </a></li>");
					}
					
					if(currentPage == 1) {
					} else {
						$("#domain").append("<li><a href='#' onclick='paging(" + currentPage + " - 1)'> &lsaquo; </a></li>");
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
 
 	
 	
	  function selectBtnClick(page){
		 var filter = $("#filter").val();
		 var searchTF = $("#searchTF").val();
		 console.log(filter + ", " + searchTF);
		 var currentPage;
		 var maxPage;
		 var startPage;
		 var endPage;
		 var idx = -1;
		
		
	 
 		
	  $.ajax({
		url: "selectbtn.do",
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
				for(var j = 0; j < json.list[i].faddress.length; j++){
					json.list[i].faddress = json.list[i].faddress.replace("+", " ");		
				}
				for(var a = 0; a < json.list[i].fname.length; a++){
					json.list[i].fname = json.list[i].fname.replace("+", " ");
				}
				for(var b = 0; b < json.list[i].fmanage.length; b++){
					json.list[i].fmanage = json.list[i].fmanage.replace("+", " ");
				}
				idx += 1;
				values += "<tr align='center' class='tbtr'><td>" + json.list[i].fno + "</td>"
				+ "<td><a href='Info.do?no=" + json.list[i].fno + "'>" + decodeURIComponent(json.list[i].fname) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].faddress) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].fstart) + "</td>" 
				+ "<td>" + decodeURIComponent(json.list[i].fmanage) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].ftelephone) + "</td>"
				+ "<td>" + decodeURIComponent(json.list[i].fticket) + "</td>"
				+ "<td>" + json.list[i].freadcount + "</td>"
				+ "<td>" + json.list[i].frecommend + "</td>"
				+ "<td><input type='button' value='삭제' class='btn btn-secondary btn-sm' onclick='javascript:festivaldelete("+ idx +")'>" + "</td></tr>";
			}//for
			}
			$("#tb1").html(values);
			
			$("#domain").html("");
			if(currentPage <= 1) {	
			} else {
				$("#domain").append("<li><a href='#' onclick='selectBtnClick(1)'>&laquo; </a></li>");
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
				$("#domain").append("<li><a href='#' onclick='selectBtnClick(" + currentPage + " + 1)'> &raquo;</a></li>");
			}
			
			
		},//success
		error: function(jqXHR, textstatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			

		
		}//error
	  });
	  }
 
	  function festivaldelete(idx){
		  if(confirm('축제정보를 삭제하시겠습니까?') == true){
			var fno = $(".tbtr").eq(idx).children(":first").text();
			console.log("fno : " + fno);
			 $.ajax({
				url: "afdelete.do",
				type:"post",
				data: {"fno" : fno},
				success: function(result){
					if(result > 0){
						paging(1);
					}
					/* var objStr = JSON.stringify(result);
					var jsonObj = JSON.parse(objStr);
					
					var values = "";
					for(var i in jsonObj.list){
						values += "<tr align='center' class='tbtr'><td><input type='hidden' value='no' name='no'>" + decodeURIComponent(json.list[i].fname) + "</a></td>"
						+ "<td>" + decodeURIComponent(json.list[i].faddress) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].fstart) + "</td>" 
						+ "<td>" + decodeURIComponent(json.list[i].fmanage) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].ftelephone) + "</td>"
						+ "<td>" + decodeURIComponent(json.list[i].fticket) + "</td>"
						+ "<td>" + json.list[i].freadcount + "</td>"
						+ "<td>" + json.list[i].frecommend + "</td>"
						+ "<td><input type='button' value='탈퇴' class='btn btn-secondary btn-sm' onclick='javascript:festivaldelete("+ idx +")'>" + "</td></tr>";
						
					}
					$("#tb1").html(); */
				},
				error: function(request, status, errorData){
					alert("error code : " + request.status + "\n" + "message : " + request.responseText 
							+ "\n" + "error : " + errorData);
				} 
			}); 
			 alert("정상적으로 삭제되었습니다.");
			 location.href="adminfestival.do";
		  }else
			  return;
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
			<div class="home_title">축제관리</div>
		</div>
	</div>
	
	<!-- search -->	
	<div style="background:#f6f9fb;">
					<div class="container" data-wow-delay="0.8s" >
						
                            <form action="#" class=" form-inline" method="post" style="margin-top : 0.5%;"> 

                                <div class="form-group" style="margin-left : 30%;">                                   
                                    <select class="btn dropdown-toggle btn-sm" id="filter" name="filter">
                                
										<option value="all">통합검색</option>
                                        <option value="location">위치</option>
                                        <option value="fname">축제명</option>
                                        <option value="manage">주최/주관</option>
                                        <option value="ticket">티켓</option>

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
			<button type="button" class="btn btn-outline-primary" style="margin-left:90%; margin-bottom:0.5%; cursor:pointer;"  
			onclick="goinert();">축제 등록</button> 
			
<!-- 모달 -->
						<!-- <div class="modal fade" id="fiModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title"></h4>
									</div>
									<div class="modal-body">
									<form action="#" onsubmit="return confirm('축제를 등록하시겠습니까?');">
										<tr>
											<th scope="col" >  <label>축제명</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>장소</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>썸네일</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>내용</label></th>
											<td> <textarea class="form-control" rows="3"></textarea></td>
										</tr>
										<tr>
											<th scope="col" >  <label>기간</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>테마</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>연락처</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>주최/주관</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>티켓</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>사진</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col" >  <label>태그</label></th>
											<td> <input type="text" class="form-control"  placeholder="축제명을 입력하세요"></td>
										</tr>
									
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">등록하기</button>
											</form>
									</div>
								</div>
								/.modal-content
							</div>
							/.modal-dialog
						</div> -->
						<!-- /.modal -->
						
<!-- 테이블 -->
						<div class="intro_content">
					<table class="table" width="100%;" style="border-bottom : solid 0.1px;"> 
					  <thead>
					    <tr align="center">
					      
					      <th scope="col" width="">No</th>
					      <th scope="col" width="">축제명</th>
					      <th scope="col" width="">위치</th>
					      <th scope="col" width="">날짜</th>
					      <th scope="col" width="">주최/주관</th>
					      <th scope="col" width="">문의처</th>
					      <th scope="col" width="">티켓(Y/N)</th>
					      <th scope="col" width="">조회수</th>
					      <th scope="col" width="">추천수</th>
					      <th scope="col" width=""></th>
					     
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
											<li class="page-item"><a class="page-link" href="fpage.do?page=${ p }" style="background: rgba(53, 10, 78, 0.6);color: white;">${ p }</a></li>
										</c:if>
										<c:if test="${ p != currentPage }">
											<li class="page-item"><a class="page-link" href="fpage.do?page=${ p }" style="color: rgba(53, 10, 78, 0.6);">${ p }</a></li>
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