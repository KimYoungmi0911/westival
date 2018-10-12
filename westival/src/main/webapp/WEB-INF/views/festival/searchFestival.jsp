<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../../header.jsp" />
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
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/offers_responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>

<style type="text/css">
@media only screen and (max-width: 1680px)
{
	.search_item
	{
		margin-bottom: 0px;		
	}
	#tsearch1
	{
		width: 100%;
	}
}

	.extras{
		border: 1px solid #31124b;
		border-radius: .25rem;
	}

	.tagbox_area{
	    display: block;
	    padding: .375rem .75rem;
	    font-size: 1rem;
	    line-height: 1.5;
	    color: #495017;
	    background-color: #fff;
	    background-image: none;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	    transition: border-color cubic-bezier(0.4, 0, 1, 1) .15s,box-shadow ease-in-out .15s;
	}
		
	/* 체크되면 v표시 (삭제해) */
	input[class="search_extras_cb"]:checked + label:after {
		content: '\2714';
		font-size: 12px;
	}
	
	.trending
	{
		width: 100%;
		padding-top: 105px;
		padding-bottom: 50px;
	}
	.trending_container
	{
		margin-top: 90px;
	}
	.trending_item
	{
		margin-bottom: 55px;
	}
	.trending_image
	{
		width: 82px;
		height: 76px;
		float: left;
	}
	.trending_image img
	{
		width: 100%;
	}
	.trending_content
	{
		padding-left: 94px;
	}
	.trending_title
	{
		margin-top: -5px;
	}
	.trending_title a
	{
		font-size: 16px;
		font-weight: 700;
		color: #2d2c2c;
		text-transform: uppercase;
		-webkit-transition: all 200ms ease;
		-moz-transition: all 200ms ease;
		-ms-transition: all 200ms ease;
		-o-transition: all 200ms ease;
		transition: all 200ms ease;
	}
	.trending_title a:hover
	{
		color: #fa9e1b;
	}
	.trending_price
	{
		font-size: 14px;
		font-weight: 700;
		color: #fa9e1b;
		margin-top: 2px;
	}
	.trending_location
	{
		font-size: 14px;
		font-weight: 400;
		color: #929191;
		text-transform: uppercase;
		margin-top: 5px;
	}

</style>

<script type="text/javascript">
	
	function locationSearch(){
		
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
		
		$.ajax({
			url : "locationSearch.do",
			data : { address : address, start_date : startDate, end_date : endDate, theme : theme },
			type : "post",
			dataType : "json",
			success : function(result){	
				// 1. 리턴된 객체를 문자열로 바꿈
				var objStr = JSON.stringify(result);
				// 2. 문자열을 json 객체로 바꿈
				var jsonObj = JSON.parse(objStr);					
				
				var resultList="";
				
				if(jsonObj.list.length==0){
					$("#searchList").html("검색 결과가 없습니다.");
				} else {
					for(var i in jsonObj.list){ 					
						resultList += "<div class='offers_item rating_4'><div class='row'><div class='col-lg-3 col-1680-4'><div class='offers_image_container'>"
							+ "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name
							+ "'></div></div></div><div class='col-lg-8'><div class='offers_content'><div class='offers_price'>" + jsonObj.list[i].name + "<span>" 
							+ jsonObj.list[i].start_date + " ~ " + jsonObj.list[i].end_date + "</span></div><p class='offers_text'>" + "설명<br><br><Br><br>" 
							+ "</p><div class='button book_button'><a href='#'>상세보기<span></span><span></span><span></span></a></div>" 
							+ "<div class='offer_reviews'><div class='offer_reviews_content'><div class='offer_reviews_subtitle'>" + jsonObj.list[i].recommend 
							+ " 명의 추천을 받았습니다.</div></div><div class='offer_reviews_rating text-center'><a href='#' onclick='scrap(" + jsonObj.list[i].no +"); return false;'>♡</a></div>"
							+ "</div></div></div></div></div>";
							
						/* console.log("축제번호 : " + jsonObj.list[i].no + ", 축제명 : " + jsonObj.list[i].name +
								", 이미지 : " + jsonObj.list[i].new_img_name + ", 주소 : " + jsonObj.list[i].address +
								", 시작날짜 : " + jsonObj.list[i].start_date + ", 종료날짜 : " + jsonObj.list[i].end_date +
								", 테마 : " + jsonObj.list[i].theme + ", 태그 : " + jsonObj.list[i].tag + ", 추천수 : " + jsonObj.list[i].recommend); */
					}			
					//console.log(resultList);				
					$("#searchList").html("<div class='offers_grid'>" + resultList + "</div>");					
				}
			},
			error : function(request, status, errorData){
				alert("error code : " + request.status + "\n" + "message : " + request.responseText 
						+ "\n" + "error : " + errorData);
			} 
		});
		
	}

	function tagSearch(){
		
		if($("#tag").val().length==0){
			console.log("태그를 반드시 입력해주세요.");
			return false;
		} else{
			
			var tag = $("#tag").val();
			
			$.ajax({
				url : "tagSearch.do",
				data : { tag : tag },
				type : "post",
				dataType : "json",
				success : function(result){	
					console.log("ok");
					// 1. 리턴된 객체를 문자열로 바꿈
					var objStr = JSON.stringify(result);
					// 2. 문자열을 json 객체로 바꿈
					var jsonObj = JSON.parse(objStr);	
					
					var resultList="";

					if(jsonObj.list.length==0){
						$("#searchList").html("검색 결과가 없습니다.");
					} else {
						for(var i in jsonObj.list){ 					
							resultList += "<div class='offers_item rating_4'><div class='row'><div class='col-lg-3 col-1680-4'><div class='offers_image_container'>"
								+ "<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/" + jsonObj.list[i].new_img_name
								+ "'></div></div></div><div class='col-lg-8'><div class='offers_content'><div class='offers_price'>" + jsonObj.list[i].name + "<span>" 
								+ jsonObj.list[i].start_date + " ~ " + jsonObj.list[i].end_date + "</span></div><p class='offers_text'>" + "설명<br><br><Br><br>" 
								+ "</p><div class='button book_button'><a href='#'>상세보기<span></span><span></span><span></span></a></div>" 
								+ "<div class='offer_reviews'><div class='offer_reviews_content'><div class='offer_reviews_subtitle'>" + jsonObj.list[i].recommend 
								+ " 명의 추천을 받았습니다.</div></div><div class='offer_reviews_rating text-center'><a href='#' onclick='scrap(" + jsonObj.list[i].no +"); return false;'>♡</a></div>"
								+ "</div></div></div></div></div>";
								
							/* console.log("축제번호 : " + jsonObj.list[i].no + ", 축제명 : " + jsonObj.list[i].name +
									", 이미지 : " + jsonObj.list[i].new_img_name + ", 주소 : " + jsonObj.list[i].address +
									", 시작날짜 : " + jsonObj.list[i].start_date + ", 종료날짜 : " + jsonObj.list[i].end_date +
									", 테마 : " + jsonObj.list[i].theme + ", 태그 : " + jsonObj.list[i].tag + ", 추천수 : " + jsonObj.list[i].recommend); */
						}			
						//console.log(resultList);				
						$("#searchList").html("<div class='offers_grid'>" + resultList + "</div>");					
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
		
		/* $.ajax({
			url : "tagSearch.do",
			
		}); */
	} 

</script>

</head>

<body>

<div class="super_container">

	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">our offers</div>
		</div>
	</div>

	<!-- Offers -->

	<div class="offers">

		<!-- Search -->
		<div class="search">
			<div class="search_inner">

				<!-- Search Contents -->
				
				<div class="container fill_height no-padding">
					<div class="row fill_height no-margin">
						<div class="col fill_height no-padding">

							<!-- Search Tabs -->
							<div class="search_tabs_container">
								<div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
									<div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="/westival/resources/images/bus.png" alt=""><span>지역 별 축제</span></div>
									<div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="/westival/resources/images/bus.png" alt="">태그 별 축제</div>
								</div>		
							</div>

							<!-- Search Panel -->

							<div class="search_panel active" >
								<form action="#" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
									<div class="search_item">
										<div>* 지역명</div>
										<select name="address" id="address" class="destination search_input">
										    <option value="">지역 선택</option>
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
										<input type="date" id="start_date" class="check_in search_input" >
									</div>
									<div class="search_item">
										<div>* 축제 종료일</div>
										<input type="date" id="end_date" class="check_out search_input" >
									</div>
									<div class="search_item" id="tsearch1" style="text-align:center;" >										
										<div class="extras" >
											<div style="color:#31124b;">* 주제</div>									
											<ul class="search_extras clearfix">
												<li class="search_extras_item">
													<div class="clearfix">
														<input type="checkbox" name="theme" id="search_extras_1" class="search_extras_cb" value="festival">
														<label id="search_extras_lb1" for="search_extras_1">축제</label>
													</div>	
												</li>
												<li class="search_extras_item">
													<div class="clearfix">
														<input type="checkbox" name="theme" id="search_extras_2" class="search_extras_cb" value="party">
														<label id="search_extras_lb1" for="search_extras_2">파티</label>
													</div>
												</li>
												<li class="search_extras_item">
													<div class="clearfix">
														<input type="checkbox" name="theme" id="search_extras_3" class="search_extras_cb" value="meeting">
														<label id="search_extras_lb1" for="search_extras_3">모임</label>
													</div>
												</li>
												<li class="search_extras_item">
													<div class="clearfix">
														<input type="checkbox" name="theme" id="search_extras_4" class="search_extras_cb" value="performance">
														<label id="search_extras_lb1" for="search_extras_4">공연</label>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<input type="submit" class="button search_button" value="검색하기" onclick="locationSearch(); return false;" >
								</form>
							</div>

							<!-- Search Panel -->

							<div class="search_panel ">
								<form action="#" id="search_form_2" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
									<div class="search_item">
										<div>태그를 입력해주세요.</div>
										<input type="text" id="tag" name="tag" class="destination search_input" >
									</div>
									<input type="submit" class="button search_button" value="검색하기" onclick="tagSearch(); return false;" >
								</form>
							</div>

						</div>
					</div>
				</div>	
			</div>	
		</div>
	</div>

	<!-- Intro -->

	<div class="intro" style="height:500px;">
		<div class="container">
			<div class="row">				
				<div class="col-lg-12" id="searchList">
										
				</div>
			</div>
		</div>
	</div>


</div>

<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/westival/resources/js/offers_custom.js"></script>

</body>

</html>