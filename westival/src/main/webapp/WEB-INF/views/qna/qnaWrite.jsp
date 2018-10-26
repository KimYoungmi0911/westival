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
    
    [type='button'] {
    	cursor: pointer;
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
	<br><br><br><br>
	<!-- Footer -->

   <footer class="footer" style="padding-top: 0px;">
      <div class="container">
         <div class="row">

            <!-- Footer Column -->
            <div class="col-lg-3 footer_column" style="height: 200px;">
               <div class="footer_col" style="width: 800px;">
                  <div class="footer_content footer_about">

                     <div class="logo">
                        <a href="#"><img src="" alt="">westival</a>
                     </div>
                     <p class="footer_about_text">&nbsp;&nbsp;&nbsp;westival은 다양한
                        문화생활을 즐기는 현대인들에게 여러가지 축제정보를 제공하고 자유롭게 공유 할 수 있는 공간입니다.</p>

                     <div class="footer_content footer_contact">

                        <ul class="contact_info_list">
                           <li class="contact_info_item d-flex flex-row">
                              <div class="footer_title">&nbsp;&nbsp;&nbsp;contact info</div>
                           </li>
                           <li class="contact_info_item d-flex flex-row">
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/placeholder.svg" alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">kh정보교육원&nbsp;&nbsp;&nbsp;</div>
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/phone-call.svg" alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">1111-2222-3333&nbsp;&nbsp;&nbsp;</div>
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/message.svg" alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">westival@gmail.com&nbsp;&nbsp;&nbsp;</div>
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/planet-earth.svg"
                                       alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">www.westival.com</div>

                           </li>

                        </ul>
                     </div>
                  </div>
               </div>
            </div>




         </div>
      </div>
   </footer>
</div>

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<script>
	/*jquery*/
	$(function(){
		$("#summernote").css("height", "250px");
	    $("#summernote").css("width", "100%");
		
		$("#cancel").on("click", function(){
			location.href="qnaBoard.do";
		});

	});	//jquery
	
	function formCheck(){
		
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