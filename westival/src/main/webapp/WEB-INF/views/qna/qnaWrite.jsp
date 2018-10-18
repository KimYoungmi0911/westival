<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/header.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Travelix</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_responsive.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/responsive.css">
<style type="text/css">

	.intro {
		background-color: #fff;
		width: 100%;
    	padding-top: 40px;
    	padding-bottom: 40px;
    	color: black;
	}
	
	.board {
    	border-top: 1.5px solid #283444;
    	width: 85%;
    	margin: 35px auto 15px auto;
    	font-size: 14px;
    }
    
    .board th { 
    	border-right: 1px solid #ececec; 
    	border-bottom: 1px solid #ececec; 
    	background: #f5f5f7; 
    	width: 20%; 
    	padding-left:15px; 
    	font-weight: 400;
    }
    
    .board td { 
    	padding:15px;
    	border-bottom: 1px solid #ececec; 
    	height: 56px;
    }
    
    .qnaWirteForm__btn {
    	text-align: center;
    }
    
    #category {
    	width: 25%; 
    	height: 43px;
    	font-size:14px;
    }
</style>
</head>

<body>


<div class="super_container">
	
	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" style="background-image:url(/westival/resources/images/about_background.jpg)"></div>
		<div class="home_content">
			<div class="home_title">글쓰기</div>
		</div>
	</div>
	
	<!-- Intro -->
	
	<div class="intro">
		<div class="container">
			<div class="row">
				<div class="col">
					<form action="qnaFileInsert.do" id ="qnaInsert" method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
						<table class="board">
							<tr>
								<th>분류</th>
								<td><select class="form-control" id="category" name="category">
										<option value="축제문의">축제문의</option>
										<option value="티켓문의">티켓문의</option>
										<option value="환불문의">환불문의</option>
										<option value="기타문의">기타문의</option>
									   </select>
								</td>
								<td style="height:43px;width:10%;text-align:right;">
									<input class="form-check-input" id="active" name="active" type="checkbox" value="N" ><span>비밀글</span>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="2"><input type="text" class="form-control" name="subject" id="subject"></td>
							</tr>
							<tr>
								<th>파일첨부</th>
								<td colspan="2"><input type="file" name="file_name" id="file_name"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="2"><textarea id="summernote" name="content"></textarea></td>
							</tr>
						</table>
						<input type="text" name="user_id" value="${ member.user_id }" style="display:none;">
				<br>
			<div class="qnaWirteForm__btn">
				<button class="btn btn-light" type="button" id="cancel">취소</button>
				<button class="btn btn-light" type="submit">등록</button>
			</div>
			</form>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
</div>

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b698969a5fbbf08d3bddab4e1ceacc&libraries=services"></script>
<script>
	/*jquery*/
	$(function(){
		$('#summernote').summernote({
	    height : 250, // set editor height
	    minHeight : 100, // set minimum height of editor
	    maxHeight : null, // set maximum height of editor
	    lang : 'ko-KR' // default: 'en-US'
	});

	});	//jquery
	
	function formCheck(){
		
		console.log($("#active").val());
	
		if( $("#subject").val() == "" ){
			alert("제목을 입력하세요.");
			return false;
		}else if( $("#summernote").val() == "" ){
			alert("내용을 입력하세요.");
			return false;
		}
		
		if( $("#file_name").val() == "" ){
			$("#qnaInsert").removeAttr("enctype");
			$("#qnaInsert").attr("action", "qnaInsert.do");
		}
		
		return true;
	}
</script>

</body>

</html>