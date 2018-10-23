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
<script>
	var festivalName;
	
	function categoryChange(){
		if($("#category option:selected").val() == "동행"){
			$(".festivalSelect").attr("style", "display:inline");
			//$(".user_count").attr("style", "display:inline");
		}
		if($("#category option:selected").val() == "일반"){
			$(".festivalSelect").attr("style", "display:none");
			//$("#user_count").attr("style", "display:none");		
		}
		
	}
	
	$(function(){
		$("#category").val("일반").prop("selected", true);
		
		//게시글 수정시 필드 값 초기화  
		if('${community.community_no}' != 0){
			$("#category").val('${community.category}').prop("selected", true);
			if("${community.category}" == "동행"){
				$(".festivalSelect").prop("style", "display:inline");
				$("#festival").val("${community.no}").prop("selected", true);
				$(".festivalSelect").append("<input type='hidden' name='no' value='${festival.no}'>");
				$("#user_count").val("${community.user_count}").prop("selected", true);
			}
			$("#commuInsert").append("<input type='hidden' name='community_no' value='${community.community_no}'>");
			$("#title").val("${community.title}");
			$("#content").val("${community.content}");
	    	
			$("#insertBtn").prop("style", "display:none");
			$("#updateBtn").prop("style", "display:inline");
	    }
	}); 
	
	//게시글 수정
	function updataBtnClick(){
		var formData = $("#commuInsert").serialize();
		$.ajax({
			url : "commuupdate.do",
			type : "post",
			data : formData,
			success : function(data){
				if(data > 0){
					alert("수정이 완료되었습니다.");
					location.href="commuDetail.do?community_no=${community.community_no}";
				}else{
					alert("게시글 수정 실패");
				}
			}
		});
	}
	
	function formCheck(){	
		if( $("#title").val() == "" ){
			alert("제목을 입력하세요.");
			return false;
		}else if( $("#content").val() == "" ){
			alert("내용을 입력하세요.");
			return false;
		}else{
			$("#commuInsert").submit();
		}
		return true;
	} 
	 
</script>
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
					<form action="commuInsert.do" id ="commuInsert" method="post">
						<table class="board">
							<tr>
								<th>분류</th>
								<td><select class="form-control" id="category" name="category" onchange="categoryChange();" style="width:70%;">
										<option value="일반">일반</option>
										<option value="동행">동행</option>
									   </select>
								</td>								
								<td>
									<div class="festivalSelect" style="display:none;">	
									<select class="form-control" id="festival" name="no">
										<c:forEach items="${list }" var="festival">
											<option value="${festival.no }">${festival.name }</option>
										</c:forEach>
									</select>
									</div>
								</td>
								<td>
									<div class="festivalSelect" style="display:none;">
									<select class="form-control" id="user_count" name="user_count">
										<c:forEach var="i" begin="1" end="10">
											<option value="${i }">${i }</option>
										</c:forEach>
									</select>
									</div>								
								</td>
														
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="2"><input type="text" class="form-control" name="title" id="title"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="2" style="height:500px;"><textarea style="width:100%;height:100%;" id="content" name="content"></textarea></td>
							</tr>
						</table>
						<input type="text" name="user_id" value="${ member.user_id }" style="display:none;">
				<br>
			<div class="qnaWirteForm__btn">
				<button class="btn btn-light" type="button" id="cancel" onclick="location.href='commuPage.do';">취소</button>
				<button class="btn btn-light" type="button" id="updateBtn" onclick="updataBtnClick();" style="display:none;">수정완료</button>
				<button class="btn btn-light" type="button" id="insertBtn" style="display:inline;" onclick="formCheck();">등록</button>
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
</body>
<c:import url="/WEB-INF/views/footer.jsp" />
</html>