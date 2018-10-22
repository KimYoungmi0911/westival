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
/* function ndelete(){
	
	location.href="noticedelete.do"
}
function nrewrite(){
	location.href="noticerewrite.do"
} */

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
			<div class="home_title">${noticedetail.notice_no }번글 상세보기</div>
		</div>
	</div>  

	<!-- Contact -->

	<div class="contact_form_section" style="padding-top : 2%;">
		<div class="container">
			<div class="row">
				<div class="col">

					<!-- Contact Form -->
					<div class="contact_form_container" style="background : linear-gradient(to top right, white, white">
						<table class="table table-hover">
	 <tr>
      <th scope="col" width="10%;">글번호</th><td>${noticedetail.notice_no }</td>
    </tr>
    <tr>
      <th scope="col">제목</th><td>${noticedetail.notice_title }</td>
    </tr>
    <tr>
      <th scope="col">작성자</th><td>${noticedetail.user_id }</td>
    </tr>
     <tr>
      <th scope="col">작성날짜</th><td>${noticedetail.notice_date }</td>
    </tr>
     <tr>
      <th scope="col">첨부파일</th>
      <td>
      <c:if test="${!empty noticedetail.original_filepath }">
      	<c:url var="fdown" value="fdown.do">
      		<c:param name="ofile" value="${noticedetail.original_filepath }" />
      		<c:param name="rfile" value="${noticedetail.rename_filepath }" />
      	</c:url>
      	<a href="${fdown }">${noticedetail.original_filepath } 다운받기</a>
      </c:if>
      <c:if test="${empty noticedetail.original_filepath }">
      &nbsp;
      </c:if>
      </td>
    </tr>
     <tr>
      <th scope="col">내용</th><td>${noticedetail.notice_content }</td>
    </tr>

 
 
 
    
 
</table>

<!-- <button type="button" class="btn btn-dark" onclick="goview();" style="margin-left : 89%; cursor:pointer;" >목록</button> --> 

<div style="float : right;">
<div class="button intro_button" style="position:relative; margin-top:50%; "><div class="button_bcg"></div><a href="noticeview.do?page=${currentPage }">목록<span></span><span></span><span></span></a></div>
<c:if test="${!empty sessionScope.member.user_id && sessionScope.member.user_id eq 'admin' }">
<c:url var="ndelete" value="ndelete.do">
	<c:param name="no" value="${noticedetail.notice_no }" />
</c:url>
<c:url var="noticeupdate" value="noticeupdate.do">
	<c:param name="no1" value="${noticedetail.notice_no }" />
</c:url>
<div>
<button type="button" class="btn btn-dark" onclick="location.href='${noticeupdate}'" style="cursor:pointer; margin-left:12%;">수정</button>
<button type="button" class="btn btn-dark" onclick="deleteBtn();" style="cursor:pointer;">삭제</button>
</div>
</c:if>

<%-- <a href="${noticeupdate }">수정</a>
<a href="${ndelete }" onclick="return confirm('정말로 삭제하시겠습니까 ?');">삭제</a> --%>
<script type="text/javascript">
function deleteBtn(){
	if(confirm('정말로 삭제하시겠습니까 ? ') == true){
	
		location.href="${ndelete}";
		alert("정상적으로 삭제되었습니다.");
	}else
		return;
}
</script>
</div>

						
						
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