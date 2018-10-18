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
    	border-top: 1.5px solid #ececec;
    	width: 85%;
    	margin: 35px auto 15px auto;
    	font-size: 14px;
    }
    
    .board th { 
    	border-right: 1px solid #ececec; 
    	border-bottom: 1px solid #ececec; 
    	background: #f5f5f7; 
    	padding-left:15px; 
    	font-weight: 400;
    }
    
    .board td { 
    	padding:15px;
    	border-bottom: 1px solid #ececec; 
    	height: 56px;
    }
    
    #fileName {
    	width: 43%;
    }
    
    #content {
    	height: 100px;
    }
    
    .comment_frame {
      display: block;
       width: 85%;
       margin: 0 auto;
   }
   
   .comment_box {
      height: 145px;
       border: 1px solid #e0d7d2;
       background: #f5f5f7;
       padding: 20px;
   }
   
   .comment_textarea {
       float: left;
       padding: 10px 15px;
       border: 1px solid #dedede;
       background: #fff;
       width: 780px;
       height: 100px;
   }
   
   .comment_textarea textarea {
      padding: 0;
       margin: 0;
       border: 0;
       width: 750px;
       height: 77px;
   }
   
   .comment_btn {
      float: right;
       width: 110px;
       height: 100px;
       text-align: center;
   }
   
   .textCount {
      clear: both;
      display: block;
      text-align: right;
      margin-right: 120px;
      vertical-align: baseline;
      padding-top: 10px;
      color: #4a5c83;
   }
   
   .comment_listbox {
      clear: both;
      margin-top: 30px;
      width: 85%;
      margin: 0 auto;
   }
   
   .comment_list_rapper {
      margin-top: 10px;
   }
   
   .comment_list_rapper th {
      text-align: center;
      height: 1px;
   }
   
   .comment_list_rapper td {
      vertical-align: top;
       color: #444444;
       padding: 20px 0;
       border-bottom: 1px dotted #c2c2c2;
   }
   
   .comment_list_rapper .center {
       text-align: center;
   }
   
   .comment_list_rapper td.number {
      text-align: center;
       color: #4a6943;
   }
   
   .comment_list_rapper .comment_content {
       margin-top: 8px;
       clear: both;
       white-space: pre-line;
   }
   
   .hide {
      position: fixed;
       top: -10000px;
       left: -10000px;
   }
    
</style>
</head>

<body>


<div class="super_container">
	
	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" style="background-image:url(/westival/resources/images/about_background.jpg)"></div>
		<div class="home_content">
			<div class="home_title">QnA</div>
		</div>
	</div>
	
	<!-- Intro -->
	
	<div class="intro">
		<div class="container">
			<div class="row">
				<div class="col">
					<table class="board">
						<tr><td colspan="6"><strong>${ qna.subject }</strong></td></tr>
						<tr>
							<th>작성자</th><td>${ qna.user_id }</td>
							<th>작성일</th><td>${ qna.qna_date }</td>
							<th>조회수</th><td>${ qna.read_count }</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<c:if test="${ empty qna.file_name }">
								<td id="fileName">첨부파일 없음</td>
							</c:if>
							<c:if test="${ !empty qna.file_name }">
								<td id="fileName">${ qna.file_name }</td>
							</c:if>
							<th>분류</th><td>${ qna.category }</td>
							<th>상태</th><td>${ qna.state }</td>
						</tr>
						<tr><td colspan="6" id="content"> ${ qna.content } </td></tr>
					</table>
					
					<!-- 댓글 입력 -->
					<div class="comment_frame">
	                  <form id="commentInsert" action="" method="post">
	                     <div class="comment_box">
	                        <div class="comment_textarea">
	                           <textarea id="festival_comment" name="reply_content"></textarea>
	                        </div>
	                        <div class="comment_btn">
	                           <button id="formBtn" type="button" class="btn btn-dark" style="width: 100px; height: 100%;">보내기</button>
	                        </div>
	                     </div>
	                     <input type="hidden" name="reply_user_id" value="${ member.user_id }">
	                     <input type="hidden" name="qna_no" value="${ qna.qna_no }">
	                     <input type="hidden" name="reply_level" value="1">
	                  </form>
               		</div>
               		
               		<!-- 댓글 목록 -->
               <div class="comment_listbox">
                  <div class="comment_list_rapper">
                     <table width="100%" id="replyTable">
                        <colgroup>
                           <col style="width: 81px;">
                           <col>
                        </colgroup>
                        <thead>
                           <tr class="hide">
                              <th scope="col">댓글 번호</th>
                              <th scope="col">댓글</th>
                           </tr>
                        </thead>
                        <tbody>
                           
                        </tbody>
                     </table>
                  </div>
               </div>
               <!-- 댓글 목록 끝 -->
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
	<a href="qnaBoard.do?page=${ currentPage }">목록</a>
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
		var userid = "${ member.user_id }";
		var qna_no = "${ qna.qna_no }";
		callReplyList(qna_no);
		
		//textarea 로그인 체크 이벤트
	      $("#festival_comment").focus(function(){
	         if(userid == ''){
	            alert("로그인 후 작성 가능합니다.");
	            $(this).blur();   
	         }
	      });
	      
	      //textarea 글자수 이벤트
	      $("#festival_comment").keyup(function(e){
	         var content = $(this).val();
	         $("#wordCount").html(content.length);
	         
	         if(content.length > 200){
	            alert("200자 이하만 입력 가능합니다.");
	            $(this).val(content.substr(0,200));
	            $(this).focus();
	         }
	      });
	      $("#festival_comment").keyup();
	      
	      $("#formBtn").on("click", function(){
	    	  var formData = $("#commentInsert").serialize();
	    	  $.ajax({
	              url: "QnaInsertReply.do",
	              data: formData,
	              type: "post",
	              success: function(result){
	                 if(result == "fail")
	                    alert("실패");
	                 //callReplyList(number, 1);
	                 $("#festival_comment").val("");
	                 $("#wordCount").text("0");
	                 callReplyList(qna_no);
	              },
	              error: function(request, status, errorData){
	                 console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
	                       + "error : " + errorData);
	              }
	           });
	      });
	});	//jquery
	
	//댓글 목록, 페이지 함수
	   function callReplyList(a){
	      userid = "${ member.user_id }";
	      $(function(){
	         $.ajax({
	            url: "selectQnaReply.do",
	            data: {no: a},
	            type: "post",
	            dataType: "json",
	            success: function(obj){
	               var objStr = JSON.stringify(obj);
	               var jsonObj = JSON.parse(objStr);
	               
	               var outValues= '';
	               var pageValues='';
	               
	               if(obj.totalCount == 0){
	                  outValues += '<td colspan="2" class="center">등록된 댓글이 없습니다.</td>';
	               }else{
	                  for(var i in jsonObj.list){
	                     outValues += '<tr><td class="number">'+obj.list[i].reply_seq+'</td>';
	                     outValues += '<td><div class="comment_writer">';
	                     outValues += '<span style="margin-right: 10px; font-weight: bold;">'+decodeURIComponent(obj.list[i].reply_user_id)+'</span> 작성일 : '+obj.list[i].reply_date+'';
	                     if(userid == obj.list[i].reply_user_id){
	                        outValues += '&nbsp;&nbsp;&nbsp;&nbsp;<button id="'+obj.list[i].reply_seq+'" type="button" class="btn btn-secondary btn-sm">수정</button>&nbsp;<button id="deleteBtn'+obj.list[i].reply_seq+'" type="button" class="btn btn-secondary btn-sm">삭제</button></div>';   
	                     }
	                     outValues += '<div class="comment_content">'+decodeURIComponent(obj.list[i].reply_content)+'</div>';
	                     outValues += '<div class="modify_content" style="display:none;margin-top:10px;"><textarea style="height:85px;width:700px">'+decodeURIComponent(obj.list[i].reply_content)+'</textarea></div>';
	                     outValues += '<div class="modify_contentBtn" style="display:none;margin-top:10px;"><button id="'+obj.list[i].reply_seq+'Btn" type="button" class="btn btn-secondary btn-sm">수정하기</button>&nbsp;<button id="cancelBtn'+obj.list[i].reply_seq+'" type="button" class="btn btn-secondary btn-sm">취소</button></div>';
	                     outValues += '<div id="'+obj.list[i].reply_no+'" style="display:none;"></div></td></tr>';
	                  }
	               }
	               
	               $("#replyTable tbody").html(outValues);
	               
	            },
	            error: function(request, status, errorData){
	               console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
	                     + "error : " + errorData);
	            }
	         });
	      });
	   }
</script>

</body>

</html>