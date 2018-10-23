<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>태그 별 축제 페이지</title>
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
<style type="text/css">
	
</style>

<script type="text/javascript">

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

<c:import url="/WEB-INF/views/header.jsp" />

<div class="super_container">


	
	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/about_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">태그 별 축제 페이지</div>
		</div>
	</div>

	<!-- Offers -->

	<div class="offers" style="height:1500px;" >

		

		<!-- Offers -->

		<div class="container" >
			<div class="row">
				<div class="col text-center">
					<div class="section_title"><font color="red">#${ tag }</font> 검색 결과</div>
				</div>				
				<div class="col-lg-1 temp_col"></div>
				<br><br><br>
				<div class="col-lg-12">					

						<!-- Offers Item -->
						<c:forEach var="item" items="${ list }" varStatus="status">
							<div class='offers_item'>
								<div class='row'>
									<div class='col-lg-3 col-1680-4'>
										<div class='offers_image_container'>
											<div class='offers_image_background' style='background-image:url(/westival/resources/uploadFiles/festivalImg/${ item.new_img_name}'>
											</div>
										</div>
									</div>
									<div class='col-lg-8'>
										<div class='offers_content'>
											<div class='offers_price'>${ item.name }<span>${ item.start_date } ~ ${ item.end_date }</span>
											</div>
											<p class='offers_text'>${ item.content }<br><br><Br><br></p>
											<div class='button book_button'>
												<a href='#'>상세보기<span></span><span></span><span></span></a>
											</div>
											<div class='offer_reviews'>
												<div class='offer_reviews_content'>
													<div class='offer_reviews_subtitle'>${ item.recommend } 명의 추천을 받았습니다.</div>
												</div>
												<%-- 작업중....
												${scrap[status.index]}
												
												
												
												<div class='offer_reviews_rating text-center'>
													<a href='#' id='scrapCheck' onclick='scrap(${ item.no }); return false;'> scrap </a>
												</div> --%>
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</c:forEach>

						
					</div>					
				</div>

			</div>
		</div>
		
			
	</div>

</div>

</body>

</html>