<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head> 
<title>Contact</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_responsive.css">
</head>
<script type="text/javascript">
function goview(){
	location.href="noticeview.do"
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

		

	<!-- Home -->

	<div class="home" id="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/contact_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">수정하기</div>
		</div>
	</div>  

	<!-- Contact -->

		<div class="contact_form_section" style="padding-top: 2%;">
			<div class="container">
				<div class="row">
					<div class="col">

						<!-- Contact Form -->
						<div class="contact_form_container"
							style="background: linear-gradient(to top right, white, white">
							<table class="table table-hover">
							<%-- <c:url var="nup" value="nupdate.do">
								<c:param name="no" value="${nudetail.notice_no }"></c:param>
							</c:url> --%>
	
								<form action="nupdate.do" method="post" enctype="multipart/form-data" onsubmit="return confirm('게시물을 수정하시겠습니까?')">
								<tr>
									<th scope="col" width="10%;">글번호</th>
									<td><input type="text" style="width: 50%;" required name="no" id="no" value="${nudetail.notice_no }" readonly></td>
								</tr>
								<tr>
									<th scope="col" >제목</th>
									<td><input type="text" style="width: 50%;" required name="ntitle" id="ntitle" value="${nudetail.notice_title }"></td>
								</tr>
								<tr>
									<th scope="col">작성자</th>
									<td>admin</td>
								</tr>

								<tr>
									<th scope="col">첨부파일</th>
									<td><input type="file" name="file" >기존 파일 : ${nudetail.original_filepath }</td>
								</tr>
								<tr>
									<th scope="col">내용</th>
									<td><textarea name="ncontent" cols="100" rows="6" required id="ncontent">${nudetail.notice_content }</textarea></td>
								</tr>  


							</table>
							<div>
							<center>
							<input class="btn btn-primary" type="submit" value="수정하기" style="cursor:pointer;">
							<button type="button" class="btn btn-secondary" onclick="goview();">취소하기</button>
							</center>
							</div>
							</form>

						</div>

					</div>
				</div>
			</div>
		</div>



		<br>
	<!-- Footer -->

	<c:import url="/WEB-INF/views/footer.jsp" />

	

</div>

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/westival/resources/js/contact_custom.js"></script>

</body>

</html>