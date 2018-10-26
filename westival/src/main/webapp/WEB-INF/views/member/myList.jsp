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
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
</head>
<style type="text/css">
	#home {
		height: 90%;
		display: block;
	}
	 
	.home_background {
		position: relative;
	}
	
	#select_month {
		margin: 2% 0 2% 0;
		border-radius: 20px;
		padding: 10px;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa;
	}
	
	#select_month > button {
		margin: 0 0.2% 0 0.2%;
		background-color: #bebebe;
		border-radius: 10px;
		color: #ffffff;
	}
	
	#select_month > button:hover {
		background-color: #350a4e;
	}
	
	#search_month {
		display: inline;
		float: right;
		width: 39%;
	}
	
	#search_month > button {
		margin: 0 0 0 2%;
		background-color: #350a4e;
		border-radius: 10px;
		color: #ffffff;
	}
	
	#search_month > input {
		border-width: 0 0 2.5px 0;
		border-color: #350a4e;
		background-color: #fffcfc;
		text-align: center;
		font-size: 15px;
	}
	
	#search_month > span {
		margin: 0 2% 0 2%;
		color: #3504ae;
		font-size: 17px;
		font-weight: bold;
	}
	
	.festa_summary {
		width: 90%;
		height: 27vh;
		padding: 0;
		border-radius: 20px;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa;
		margin: 0 0 2% 5%;
	}
	
	.festa_summary:hover {
		background-color: #efeaea;
	}
	
 	.media-object {
		width: 100%;
		height: 100%;
	}
	
	.media-left {
		width: 30%;
		height: 22vh;
		margin: 2.5vh 0 2.5vh 2vw;
	}
	
	.media-body {
		width: 70%;
		height: 22vh;
		margin: 2.5vh 0 2.5vh 1vw;
		color: #350a4e;
	}
	
	.media-body > input {
		display: none;
	}
	
	.festival_no:before { content: '축제번호 : '; font-weight: bold; }
	.festival_date:before { content: '축제날짜 : '; font-weight: bold; }
	.festival_name:before { content: '축제명 : '; font-weight: bold; }
	.company_name:before { content: '주최사 : '; font-weight: bold; }
	.festival_placement:before { content: '주소 : '; font-weight: bold; }
	.festival_content:before { content: '설명 : '; font-weight: bold; }
	
	.festival_no, .festival_date, .festival_name,
	.company_name, .festival_placement, .festival_content  {
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 95%;
		word-wrap: normal;
		overflow: hidden;
	}
	
	#delete_container {
		margin: 2% 0 2% 0;
		padding: 0;
	}
	
	#delete_button {
		margin: 0 0 5% 90%;
		background-color: #bebebe;
		color: #ffffff;
		font-size: 15px;
		width: 10%;
	}
	
	#delete_button:hover {
		background-color: #350a4e;
	}
	
	#pagenation > li {
		background-color: #ffffff;
		width: 5%;
		marign: 0 0.5% 0 0.5%;
		border: 0.5px solid #aaaaaa;
		border-radius: 3px;
	}
	
	#pagenation > li:hover {
		background-color: #efeaea;
	}
	
	#pagenation > li > a {
		color: #350a4e;
		font-size: 15px;
	}

	@media only screen and (max-width: 1200px) {
		#search_month {
			width: 45%;
		}
	}
	
	@media only screen and (max-width: 1024px) {
 		.media-left {
 			width: 40%;
 		}
 		
 		.media-body {
 			width: 60%;
 		}
	}
	
	@media only screen and (max-width: 994px) {
		#search_month {
			width: 65%;
		}
	}
	
	@media only screen and (max-width: 768px) {
		#select_month {
			height: 13vh;
		}
		
		#select_month > button {
			width: 32%;
		}
		
		#search_month {
			width: 100%;
			text-align: center;
			margin: 1% 0 0 0;
		}
		
		#delete_button {
			margin-left: 85%;
			width: 15%;
		}
		
		.festival_no, .festival_date, .festival_name,
		.company_name, .festival_placement, .festival_content
		{
			width: 78%; 
		}
	}
	
	@media only screen and (max-width: 726px) {
 		.media-left {
 			width: 50%;
 		}
 		
 		.media-body {
 			width: 50%;
 		}
	}
	
	@media only screen and (max-width: 600px) {		
		.festival_no, .festival_date, .festival_name,
		.company_name, .festival_placement, .festival_content
		{
			width: 95%; 
		}	
	}
	
	@media only screen and (max-width: 485px) {
		.festa_summary {
			height: 50vh;
		}
		
		.media-left {
			width: 90%;
			margin: 5% 0 0 5%;
		}
		
		.media-body {
			margin: 27vh 5% 0 5%;
			position: absolute;
			height: 22vh;
			width: 90%;
		}
	}
	
	@media only screen and (max-width: 470px) {
		#select_month {
			height: 30vh;
		}
		
		#select_month > button {
			width: 100%;
			margin: 0 0 1% 0;
		}
		
		#search_month > button {
			width: 100%;
			text-align: center;
			margin: 1% 0 0 0;
		}
	}
	
	@media only screen and (max-width: 395px) {
		#select_month {
			height: 32vh;
		}
		
		#delete_button {
			margin-left: 80%;
			width: 20%;
		}
	}
</style>
<script type="text/javascript">
	function paging(page) {
		$.ajax({
			url : "myTotalList.do",
			type : "post",
			data : {"page" : page},
			dataType : "json",
			success : function(result){					
				var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈				
				var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈	
				var myList = '';
				var pagenation = '';
				var idx = -1;
				
				if(jsonObj.list.length==0) {
					console.log("검색 결과가 없습니다.");
					myList += "<div align='center' style='margin-top: 5%;'><img src='resources/images/logo1.PNG' alt='logo' width='20%' height='10%'></div>"
						+ "<h3 style='text-align: center; margin-top: 5%; margin-bottom: 5%;'>검색 결과가 없습니다.</h3>";	
				} else {
					for(var i in jsonObj.list){
						idx += 1;
						myList += "<div class='festa_summary' onclick='javascript:checkFn(" + idx + ");'><ul class='media-list'><li class='media'>"
							+ "<div class='media-left'><img class='media-object' src='/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name + "' alt='festival_img'></div>"
					 		+ "<div class='media-body'><input type='checkbox' name='select-item' value='" + jsonObj.list[i].no + "'><h6 class='festival_no'>" + jsonObj.list[i].no
					 		+ "</h6><h6 class='festival_date'>" +  jsonObj.list[i].start_date + " ~ " +  jsonObj.list[i].end_date + "</h6><h6 class='festival_name'>" + jsonObj.list[i].name
					 		+ "</h6><h6 class='company_name'>" +  jsonObj.list[i].manage + "</h6><h6 class='festival_placement'>" +  jsonObj.list[i].address + "</h6><h6 class='festival_content'>"
					 		+ jsonObj.list[i].content + "</h6></div></li></ul></div>";
					}
					myList += "<button type='button' id='delete_button' type='button' class='btn' onclick='javascript:deleteFn();'>삭제</button>";
				}
				$(".myfesta").html(myList);
				
				$("#pagenation").html("");
				if(jsonObj.currentPage <= 1)
					$("#pagenation").html("<li><a>«</a></li>");
				else
					$("#pagenation").append("<li><a href='javascript:paging(" + 1 + ")'>«</a></li>");
				
				for(var p = jsonObj.startPage; p <= jsonObj.endPage; p++) {
					if(p == jsonObj.currentPage)
						$("#pagenation").append("<li><a style='font-weight: bold;' disabled>" + p + "</a></li>");
					else
						$("#pagenation").append("<li><a href='javascript:paging(" + p + ")'>" + p + "</a></li>");
				}
				
				if(jsonObj.currentPage >= jsonObj.maxPage)
					$("#pagenation").append("<li><a>»</a></li>");
				else
					$("#pagenation").append("<li><a href='javascript:paging(" + jsonObj.maxPage + ")'>»</a></li>");
			},
			error : function(request, status, errorData){
				alert("error code : " + request.status + "\n" + "message : " + request.responseText 
						+ "\n" + "error : " + errorData);
			}
		});
	}
	
	$(function() {
		$.ajax({
			url : "myTotalList.do",
			type : "post",
			dataType : "json",
			success : function(result){					
				var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈				
				var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈	
				var myList = '';
				var idx = -1;
				
				if(jsonObj.list.length==0) {
					console.log("검색 결과가 없습니다.");
					myList += "<div align='center' style='margin-top: 5%;'><img src='resources/images/logo1.PNG' alt='logo' width='20%' height='10%'></div>"
						+ "<h3 style='text-align: center; margin-top: 5%; margin-bottom: 5%;'>검색 결과가 없습니다.</h3>";	
				} else {
					for(var i in jsonObj.list){
						idx += 1;
						myList += "<div class='festa_summary' onclick='javascript:checkFn(" + idx + ");'><ul class='media-list'><li class='media'>"
							+ "<div class='media-left'><img class='media-object' src='/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name + "' alt='festival_img'></div>"
					 		+ "<div class='media-body'><input type='checkbox' name='select-item' value='" + jsonObj.list[i].no + "'><h6 class='festival_no'>" + jsonObj.list[i].no
					 		+ "</h6><h6 class='festival_date'>" +  jsonObj.list[i].start_date + " ~ " +  jsonObj.list[i].end_date + "</h6><h6 class='festival_name'>" + jsonObj.list[i].name
					 		+ "</h6><h6 class='company_name'>" +  jsonObj.list[i].manage + "</h6><h6 class='festival_placement'>" +  jsonObj.list[i].address + "</h6><h6 class='festival_content'>"
					 		+ jsonObj.list[i].content + "</h6></div></li></ul></div>";
					}
					myList += "<button type='button' id='delete_button' type='button' class='btn' onclick='javascript:deleteFn();'>삭제</button>";
				}
				$(".myfesta").html(myList);
				
				if(jsonObj.currentPage <= 1)
					$("#pagenation").html("<li><a>«</a></li>");
				else
					$("#pagenation").append("<li><a href='javascript:paging(" + 1 + ")'>«</a></li>");
				
				for(var p = jsonObj.startPage; p <= jsonObj.endPage; p++) {
					if(p == jsonObj.currentPage)
						$("#pagenation").append("<li><a style='font-weight: bold;' disabled>" + p + "</a></li>");
					else
						$("#pagenation").append("<li><a href='javascript:paging(" + p + ")'>" + p + "</a></li>");
				}
				
				if(jsonObj.currentPage >= jsonObj.maxPage)
					$("#pagenation").append("<li><a>»</a></li>");
				else
					$("#pagenation").append("<li><a href='javascript:paging(" + jsonObj.maxPage + ")'>»</a></li>");
			},
			error : function(request, status, errorData){
				alert("error code : " + request.status + "\n" + "message : " + request.responseText 
						+ "\n" + "error : " + errorData);
			}
		});
	});
	
	function checkFn(idx) {				
		var selectBox = $(".media-body").eq(idx).children(":first");
			if(selectBox.is(":checked")) {
				selectBox.prop("checked", false);
				$(".festa_summary").eq(idx).css("background-color", "#ffffff");
			} else {
				selectBox.prop("checked", true);
				$(".festa_summary").eq(idx).css("background-color", "#bebebe");
			} 
	};
	
	function deleteFn() {
		var noList = document.getElementsByName("select-item");
        var checkList = ''; 
		
         for(var i=0; i<noList.length; i++){
            if(noList[i].checked)
               checkList += (noList[i].value) + " ";
         }
         
         if(checkList) {
         	if(confirm('선택한 항목을 삭제하시겠습니까?') == true)
         		location.href="updateMyList.do?checkList=" + checkList;
 			else
 				return;
          } else {
         	 alert("삭제할 항목을 선택해주세요.");
          }
	};
	
	function myListSearch(page){
		if( ($("#start_date").val() > $("#end_date").val()) || ($("#end_date").val() < $("#start_date").val()) ){	
			alert("날짜를 확인해주세요.");	
			return;
		} else{
			var start_date = $("#start_date").val();
			var end_date = $("#end_date").val();
			$.ajax({
				url : "myListSearch.do",
				type : "post",
				data : {"start_date" : start_date, "end_date" : end_date, "page" : page},
				dataType : "json",
				success : function(result){
					var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈				
					var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈	
					var myList = '';
					var idx = -1;
					
					if(jsonObj.list.length==0) {
						console.log("검색 결과가 없습니다.");
						myList += "<div align='center' style='margin-top: 5%;'><img src='resources/images/logo1.PNG' alt='logo' width='20%' height='10%'></div>"
							+ "<h3 style='text-align: center; margin-top: 5%; margin-bottom: 5%;'>검색 결과가 없습니다.</h3>";	
					} else {
						for(var i in jsonObj.list){
							idx += 1;
							myList += "<div class='festa_summary' onclick='javascript:checkFn(" + idx + ");'><ul class='media-list'><li class='media'>"
								+ "<div class='media-left'><img class='media-object' src='/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name + "' alt='festival_img'></div>"
						 		+ "<div class='media-body'><input type='checkbox' name='select-item' value='" + jsonObj.list[i].no + "'><h6 class='festival_no'>" + jsonObj.list[i].no
						 		+ "</h6><h6 class='festival_date'>" +  jsonObj.list[i].start_date + " ~ " +  jsonObj.list[i].end_date + "</h6><h6 class='festival_name'>" + jsonObj.list[i].name
						 		+ "</h6><h6 class='company_name'>" +  jsonObj.list[i].manage + "</h6><h6 class='festival_placement'>" +  jsonObj.list[i].address + "</h6><h6 class='festival_content'>"
						 		+ jsonObj.list[i].content + "</h6></div></li></ul></div>";
						}
						myList += "<button type='button' id='delete_button' type='button' class='btn' onclick='javascript:deleteFn();'>삭제</button>";
					}
					$(".myfesta").html(myList);
					
					$("#pagenation").html("");
					if(jsonObj.currentPage <= 1)
						$("#pagenation").html("<li disabled><a>«</a></li>");
					else
						$("#pagenation").append("<li><a href='javascript:myListSearch(" + 1 + ")'>«</a></li>");
					
					for(var p = jsonObj.startPage; p <= jsonObj.endPage; p++) {
						if(p == jsonObj.currentPage)
							$("#pagenation").append("<li disabled><a style='font-weight: bold;' disabled>" + p + "</a></li>");
						else
							$("#pagenation").append("<li><a href='javascript:myListSearch(" + p + ")'>" + p + "</a></li>");
					}
					
					if(jsonObj.currentPage >= jsonObj.maxPage)
						$("#pagenation").append("<li><a disabled>»</a></li>");
					else
						$("#pagenation").append("<li><a href='javascript:myListSearch(" + jsonObj.maxPage + ")'>»</a></li>");
				},
				error : function(request, status, errorData){
					alert("error code : " + request.status + "\n" + "message : " + request.responseText 
							+ "\n" + "error : " + errorData);
				} 
			});
		}
	}
		
	function myListSearchMonth(month, page){	
		$.ajax({
			url : "myListSearchMonth.do",
			type : "post",
			data : {month : month, page : page},
			dataType : "json",
			success : function(result){
				var objStr = JSON.stringify(result); // 1. 리턴된 객체를 문자열로 바꿈				
				var jsonObj = JSON.parse(objStr); // 2. 문자열을 json 객체로 바꿈	
				var myList = '';
				var idx = -1;
				
				if(jsonObj.list.length==0) {
					console.log("검색 결과가 없습니다.");
					myList += "<div align='center' style='margin-top: 5%;'><img src='resources/images/logo1.PNG' alt='logo' width='20%' height='10%'></div>"
						+ "<h3 style='text-align: center; margin-top: 5%; margin-bottom: 5%;'>검색 결과가 없습니다.</h3>";	
				} else {
					for(var i in jsonObj.list){
						idx += 1;
						myList += "<div class='festa_summary' onclick='javascript:checkFn(" + idx + ");'><ul class='media-list'><li class='media'>"
							+ "<div class='media-left'><img class='media-object' src='/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name + "' alt='festival_img'></div>"
					 		+ "<div class='media-body'><input type='checkbox' name='select-item' value='" + jsonObj.list[i].no + "'><h6 class='festival_no'>" + jsonObj.list[i].no
					 		+ "</h6><h6 class='festival_date'>" +  jsonObj.list[i].start_date + " ~ " +  jsonObj.list[i].end_date + "</h6><h6 class='festival_name'>" + jsonObj.list[i].name
					 		+ "</h6><h6 class='company_name'>" +  jsonObj.list[i].manage + "</h6><h6 class='festival_placement'>" +  jsonObj.list[i].address + "</h6><h6 class='festival_content'>"
					 		+ jsonObj.list[i].content + "</h6></div></li></ul></div>";
					}
					myList += "<button type='button' id='delete_button' type='button' class='btn' onclick='javascript:deleteFn();'>삭제</button>";
				}
				$(".myfesta").html(myList);
					
				$("#pagenation").html("");
				if(jsonObj.currentPage <= 1)
					$("#pagenation").html("<li><a>«</a></li>");
				else
					$("#pagenation").append("<li><a href='javascript:myListSearchMonth(" + jsonObj.month + ", " + 1 + ")'>«</a></li>");
				
				for(var p = jsonObj.startPage; p <= jsonObj.endPage; p++) {
					if(p == jsonObj.currentPage)
						$("#pagenation").append("<li><a style='font-weight: bold;' disabled>" + p + "</a></li>");
					else
						$("#pagenation").append("<li><a href='javascript:myListSearchMonth(" + jsonObj.month + ", " + p + ")'>" + p + "</a></li>");
				}
				
				if(jsonObj.currentPage >= jsonObj.maxPage)
					$("#pagenation").append("<li><a>»</a></li>");
				else
					$("#pagenation").append("<li><a href='javascript:myListSearchMonth(" +  jsonObj.month + ", " + jsonObj.maxPage + ")'>»</a></li>");
			},
			error : function(request, status, errorData){
				alert("error code : " + request.status + "\n" + "message : " + request.responseText 
						+ "\n" + "error : " + errorData);
			} 
		});
	}
</script>
<body>
<div class="super_container">
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/header.jsp" />

	<!-- Home -->
	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/blog_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">내 게시글</div>
		</div>
	</div>
	
	<div class="container">
		<c:import url="tabHeader.jsp" />
		
		<!-- search bar -->
		<div id="select_month">
			<button type="button" class="btn" id="1month_button" onclick="myListSearchMonth(1, 1);">1개월</button>
			<button type="button" class="btn" id="3month_button" onclick="myListSearchMonth(3, 1);">3개월</button>
			<button type="button" class="btn" id="6month_button" onclick="myListSearchMonth(6, 1);">6개월</button>
			<div id="search_month">
				<input type="date" class="YY-MM-dd" id="start_date">
				<span>~</span>
				<input type="date" class="YY-MM-dd" id="end_date">
				<button type="button" class="btn" onclick="myListSearch(1);">검색</button>
			</div>
		</div>
		
		<!-- information -->
		<c:if test="${!empty sessionScope.member.user_id }">
			<div class="myfesta">
				<div align="center" style="margin-top: 5%;"><img src="resources/images/loading.gif" alt="loading" width="7%" height="7%"></div>
				<h3 style="text-align: center; margin-top: 5%; margin-bottom: 5%;">Loading...</h3>
			</div>
			
			<div style="text-align: center; margin-bottom: 5%;">
				<ul class="pagination" id="pagenation" style="justify-content: center;"></ul>	
			</div>
		</c:if>
		<c:if test="${empty sessionScope.member.user_id }">
			<div align="center" style="margin-top: 5%;"><img src="resources/images/logo1.PNG" alt="logo" width="20%" height="10%"></div>
			<h3 style="text-align: center; margin-top: 5%; margin-bottom: 5%;">로그인이 필요한 서비스 입니다.</h3>
		</c:if>
	</div>
</div>

<!-- Footer -->
<c:import url="/WEB-INF/views/footer.jsp" />

<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/westival/resources/js/contact_custom.js"></script>
</body>

</html>