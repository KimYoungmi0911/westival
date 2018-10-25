<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/header.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_responsive.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
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
    
    #home {
      height: 90%;
      display: block;
   }
    
   .home_background {
      position: relative;
   }
   
   [type='button'] { cursor:pointer; }
</style>
<script>

	var community_no;
	/*jquery*/
	$(function(){
		var userid = "${ member.user_id }";
		community_no = "${ community.community_no }";
		callReplyList(community_no);
		
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
	      
	      //댓글등록
	      $("#formBtn").on("click", function(){
	    	  if('${member.user_id}' == ""){
	    		  alert('${member.user_id}');
	    		  alert("로그인 후 이용 가능합니다.");
	    	  }else{
	    		  if($("#festival_comment").val() == ""){
	    			  alert("내용을 입력해주세요.");
	    		  }else{
		    		  var formData = $("#commentInsert").serialize();
			    	  $.ajax({
			              url: "commuReplyInsert.do",
			              data: formData,
			              type: "post",
			              success: function(result){
			                 if(result == "fail")
			                    alert("실패");
			                 //callReplyList(number, 1);
			                 $("#festival_comment").val("");
			                 $("#wordCount").text("0");
			                 callReplyList(community_no);
			              },
			              error: function(request, status, errorData){
			                 console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
			                       + "error : " + errorData);
			              }
			    	  });
	    		  }
	    		}
	      });
	      if('${community.no}' == 0){
	    	  $("#imgdiv").prop("style", "display:none;");
	      } 
	});	//jquery
	
	//댓글 목록, 페이지 함수
	   function callReplyList(a){
	      userid = "${ member.user_id }";
	      $(function(){
	         $.ajax({
	            url: "commuReplySelect.do",
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
	                	  for(var j=0; j < jsonObj.list[i].comment_content.length; j++){
	                		  jsonObj.list[i].comment_content = jsonObj.list[i].comment_content.replace("+", " ");
	                	  }
	                     outValues += '<tr><td class="number">'+jsonObj.list[i].comment_seq+'</td>';
	                     outValues += '<td><div class="comment_writer">';
	                     outValues += '<span style="margin-right: 10px; font-weight: bold;">'+decodeURIComponent(jsonObj.list[i].user_id)+'</span> 작성일 : '+jsonObj.list[i].comment_date+'';
	                     if(userid == obj.list[i].user_id){
	                        outValues += '&nbsp;&nbsp;&nbsp;&nbsp;<button id="editBtn'+jsonObj.list[i].comment_no+'" type="button" class="btn btn-secondary btn-sm" value="'+jsonObj.list[i].comment_no+'" onclick="updateReplyClick('+jsonObj.list[i].comment_no+')">수정</button>&nbsp;<button id="deleteBtn'+jsonObj.list[i].comment_no+'" type="button" class="btn btn-secondary btn-sm" onclick="deleteReply('+jsonObj.list[i].comment_no+')">삭제</button></div>';   
	                     }
	                     outValues += '<div class="comment_content" id="comment_content'+jsonObj.list[i].comment_no+'">'+decodeURIComponent(jsonObj.list[i].comment_content)+'</div>';
	                     outValues += '<div class="modify_content" style="display:none;margin-top:10px;"><textarea style="height:85px;width:700px">'+decodeURIComponent(jsonObj.list[i].comment_content)+'</textarea></div>';
	                     outValues += '<div class="modify_contentBtn" id="Btn'+jsonObj.list[i].comment_no+'" style="display:none;margin-top:10px;"><button type="button" class="btn btn-secondary btn-sm" onclick="updateReply('+jsonObj.list[i].comment_no+')">수정하기</button>&nbsp;<button id="cancelBtn'+jsonObj.list[i].comment_seq+'" type="button" class="btn btn-secondary btn-sm" onclick="cancleBtn()">취소</button></div>';
	                     outValues += '<div id="'+jsonObj.list[i].comment_no+'" style="display:none;"></div></td></tr>';
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
	      return false;
	   }
	//댓글 수정버튼 클릭시
	function updateReplyClick(num){
		var comment_content = $("#comment_content"+num).text();
		$("#comment_content"+num).html("<textarea id='thisContent' style='width:100%;height:100%;'>"+comment_content+"</textarea>");
		$("#Btn"+num).prop("style", "display:inline;");
		$("#editBtn"+num).prop("style", "display:none;")
		$("#deleteBtn"+num).prop("style", "display:none;");
		return false;
	}
	
	//댓글 취소버튼 클릭시
	function cancleBtn(){
		callReplyList($("#community_no").val());
		return false;
	}
	
	
	//댓글 수정완료 클릭시
	function updateReply(number){
			$.ajax({
				url : "replyupdate.do",
				type : "post",
				data : {"number" : number,
					"Replyconetent" : $("#thisContent").val()},
				success : function(data){
					if(data > 0){
						alert("댓글이 수정 되었습니다.");
						callReplyList($("#community_no").val());
					}else{
						alert("댓글 수정 실패");
					}
				},
				error: function(request, status, errorData){
		               console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
		                     + "error : " + errorData);
		        }
			});
		return false;
	}
	
	//댓글 삭제 클릭시
	function deleteReply(number){
		if(confirm("정말 삭제하시겠습니까?") == true){
			$.ajax({
				url : "replydelete.do",
				type : "post",
				data : {"number" : number},
				success : function(data){
					if(data > 0){
						alert("댓글이 삭제되었습니다.");
						callReplyList($("#community_no").val());
					}else{
						alert("댓글 삭제 실패");
					}
				},
				error: function(request, status, errorData){
		               console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
		                     + "error : " + errorData);
		        }
			});
		}else{
			aler("삭제가 취소되었습니다.");
		}
		return false;
	}
	
	//수정버튼 클릭시
	function updateClick(){
		if(confirm("확인을 누르시면 수정페이지로 이동합니다.")){
			$("#commuForm").prop("action", "commuWriteForm.do");
			$("#commuForm").submit();
		}else{
			alert("수정을 취소합니다.");
		}
		return false;
	}
	
	//삭제 버튼 클릭시
	function deleteClick (){
		
		if(confirm("해당 게시글을 정말 삭제하시겠습니까?")){
			$.ajax({
				url : "commudelete.do",
				type : "post",
				data : {"community_no" : community_no},
				success : function (data){
					if(data > 0){
						alert("삭제가 완료되었습니다.");
						location.href="commuPage.do";
					}else{
						alert("게시글 삭제 실패");
					}
				},
				error : function(jqXHR, textstatus, errorThrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
				}
				
			});
		}else{
			alert("삭제가 취소되었습니다.")
		}
		return false;
	}
	
	//목록 클릭시
	function listClick(){
		var oParams = getUrlParams();
		if(oParams.w == "w"){
			location.href="commuPage.do";
		}else{
			location.href="commuPage2.do?category2=${category }&search2=${search}&keyword2=${keyword}&page=${page}";
		}
	}
	
	//쿼리스트링 함수
	   function getUrlParams() {
	       var params = {};
	       window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	       return params;
	   }
	
</script>
</head>

<body>

<div class="super_container">
	<!-- Home -->
	<div class="home" id="home">
		<div class="home_background parallax-window" style="background-image:url(/westival/resources/images/about_background.jpg)"></div>
		<div class="home_content">
			<div class="home_title">동행게시판</div>
		</div>
	</div>
	<!-- Intro -->
	<div class="intro">
		<div class="container">
			<div class="row">
				<div class="col">
					<form id="commuForm" action="" method="post">
						<table class="board">
							<tr><td colspan="5"><strong>${ community.title }</strong>
									<input type="hidden" name="title" value="${community.title }">
								</td>
								<c:if test="${member.user_id == community.user_id }">
								<td align="right">
									<input type="button" class="btn btn-dark" value="수정" onclick="updateClick()">
									<input type="button" class="btn btn-dark" value="삭제" onclick="deleteClick()">
								</td>
								</c:if>
							</tr>
							<tr>
								<th>작성자</th><td>${ community.user_id }</td>
								<th>작성일</th><td>${ community.community_date }</td>
								<th>조회수</th><td>${ community.read_count }</td>
							</tr>
							<tr>
								<th>분류</th><td>${ community.category }
												<input type="hidden" name="category" value="${community.category }">
											</td>
								<c:if test="${not empty community.no }">
								<th>축제</th><td>${ festival.name }
												<input type="hidden" name="no" value="${community.no }">
											</td>
								<th>인원</th><td>${ community.user_count }
												<input type="hidden" name="user_count" value="${community.user_count }">
											</td>
								</c:if>
							</tr>
							<tr><td colspan="6" id="content"> ${ community.content }
								<div id="imgdiv" style="float:right;display: table-cell;diplay:inline; ">
							  		<a href="Info.do?no=${community.no }">
							  			<img style="width:300px;height:300px;" src="/westival/resources/uploadFiles/festivalImg/${festival.original_img_name }">
							  				<div style="vertical-align:middle;"><strong ><em>&nbsp;&nbsp;
							  				< ${festival.name } > 상세보기</em></strong></div>
							  		</a>
								</div> 
								<input type="hidden" name="content" value="${community.content }">
								<input type="hidden" id="community_no" name="community_no" value="${ community.community_no }">
							</td></tr>
						</table>
					</form>
					<div class="comment_frame">
	                  <form id="commentInsert" action="commuReplyInsert.do" method="post">
	                     <div class="comment_box">
	                        <div class="comment_textarea">
	                           <textarea id="festival_comment" name="comment_content"></textarea>
	                        </div>
	                        <div class="comment_btn">
	                           <button id="formBtn" type="button" class="btn btn-dark" style="width: 100px; height: 100%;">보내기</button>
	                        </div>
	                     </div>
	                     <input type="hidden" name="user_id" value="${ member.user_id }">
	                     <input type="hidden" name="community_no" value="${ community.community_no }">
	                     <input type="hidden" name="comment_level" value="1">
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
               <div align="center">
               <a class="btn btn-dark" href="#" onclick="listClick();">목록</a>
               </div>
               <!-- 댓글 목록 끝 -->
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
	
</div>


<!-- <script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>

</body>
<c:import url="/WEB-INF/views/footer.jsp" />
</html>